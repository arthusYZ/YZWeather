//
//  ChartView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/19.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "ChartView.h"

@interface ChartView ()

@property (nonatomic ,weak ) CAShapeLayer *chartLine;

@end

@implementation ChartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        // Initialization code
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)setTmpsArray:(NSArray *)tmpsArray
{
    _tmpsArray = tmpsArray;
    
    self.layer.sublayers = nil;
    
    NSArray *maxTmpArray = tmpsArray[0];
    int max = [[maxTmpArray valueForKeyPath:@"@max.intValue"] intValue];
    NSArray *minTmpArray = tmpsArray[1];
    int min = [[minTmpArray valueForKeyPath:@"@min.intValue"] intValue];
    
    CGFloat range = max - min;
    
    NSArray *array = tmpsArray[0];
    
    float num = array.count;
    
    CGFloat xWidth = self.frame.size.width / num;
    for (int i=0; i<_tmpsArray.count; i++) {
        NSArray *childAry = _tmpsArray[i];
        if (childAry.count==0) {
            return;
        }
        
        //划线
        CAShapeLayer *chartLine = [CAShapeLayer layer];
        chartLine.lineCap = kCALineCapRound;
        chartLine.lineJoin = kCALineJoinBevel;
        chartLine.fillColor   = [[UIColor whiteColor] CGColor];
        chartLine.lineWidth   = 1.5;
        chartLine.strokeEnd   = 0.0;
        [self.layer addSublayer:chartLine];
        
        UIBezierPath *progressline = [UIBezierPath bezierPath];
        CGFloat firstValue = [[childAry objectAtIndex:0] floatValue];
        CGFloat xPosition = xWidth/2.0;
        CGFloat chartCavanHeight = (self.frame.size.height - forecastmargin * 8) / range;
        
        //第一个点
        [self addFirstPoint:CGPointMake(xPosition, chartCavanHeight * (max - firstValue) + forecastmargin * 4) index:i value:firstValue];
        
        
        [progressline moveToPoint:CGPointMake(xPosition, chartCavanHeight * (max - firstValue) + forecastmargin * 4)];
        [progressline setLineWidth:2.0];
        [progressline setLineCapStyle:kCGLineCapRound];
        [progressline setLineJoinStyle:kCGLineJoinRound];
        NSInteger index = 0;
        for (NSString * valueString in childAry) {
            
            float grade = max - [valueString floatValue];
            if (index != 0) {
                
                CGPoint point = CGPointMake(xPosition+index*xWidth, grade * chartCavanHeight +forecastmargin * 4);
                [progressline addLineToPoint:point];
                
                
                [progressline moveToPoint:point];
                [self addPoint:point index:i value:[valueString floatValue]];
                
                //                [progressline stroke];
            }
            index += 1;
        }
        
        chartLine.path = progressline.CGPath;
        chartLine.strokeColor = (i == 0)?[MaxTmpLineColor CGColor]:[MinTmpLineColor CGColor];
        chartLine.strokeEnd = 1.0;
    }
    
}

- (void)addFirstPoint:(CGPoint)point index:(NSInteger)index value:(CGFloat)value
{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 10, 10)];
    view.center = point;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5.7;
    view.layer.borderWidth = 1;
    view.layer.borderColor = (index == 0)?[MaxTmpLineColor CGColor]:[MinTmpLineColor CGColor];
    
    
    view.backgroundColor = (index == 0)? MaxTmpLineColor:MinTmpLineColor;
    
    UILabel *label = [[UILabel alloc] init];
    if (index == 0) {
        label.frame = CGRectMake(point.x-TagLabelwidth/2.0, point.y-forecastmargin - LabelHeight, TagLabelwidth, LabelHeight);
    }else{
        label.frame = CGRectMake(point.x-TagLabelwidth/2.0, point.y+forecastmargin, TagLabelwidth, LabelHeight);
    }
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = view.backgroundColor;
    label.text = [NSString stringWithFormat:@"%d°",(int)value];
    [self addSubview:label];
    
    [self addSubview:view];
}


- (void)addPoint:(CGPoint)point index:(NSInteger)index value:(CGFloat)value
{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 5, 5)];
    view.center = point;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 2.5;
    view.layer.borderWidth = 1;
    view.layer.borderColor = (index == 0)?[MaxTmpLineColor CGColor]:[MinTmpLineColor CGColor];
    
    view.backgroundColor = (index == 0)? MaxTmpLineColor:MinTmpLineColor;
    
    UILabel *label = [[UILabel alloc] init];
    if (index == 0) {
        label.frame = CGRectMake(point.x-TagLabelwidth/2.0, point.y-forecastmargin - LabelHeight, TagLabelwidth, LabelHeight);
    }else{
        label.frame = CGRectMake(point.x-TagLabelwidth/2.0, point.y+forecastmargin, TagLabelwidth, LabelHeight);
    }
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = view.backgroundColor;
    label.text = [NSString stringWithFormat:@"%d°",(int)value];
    [self addSubview:label];
    
    [self addSubview:view];
}


@end
