//
//  CondView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CondView.h"
#import "UIImage+YZ.h"

@interface CondView ()
/**
 *  view样式（白天或夜晚）
 */
@property (nonatomic ,assign ) timeOfDay timeOfDay;
/**
 *  天气状况
 */
@property (nonatomic ,copy ) NSString *cond;
/**
 *  温度
 */
@property (nonatomic ,copy ) NSString *tmp;

@property (nonatomic ,weak ) UILabel *timeLable;

@property (nonatomic ,weak ) UIImageView *condImageView;

@property (nonatomic ,weak ) UILabel *condLable;

@property (nonatomic ,weak ) UILabel *leftTmpLable;

@property (nonatomic ,weak ) UILabel *tmpLable;

@end

@implementation CondView

- (instancetype)initWithStyle:(timeOfDay)timeOfDay withCond:(NSString *)cond withTmp:(NSString *)tmp
{
    self.timeOfDay = timeOfDay;
    self.cond = cond;
    self.tmp = [NSString stringWithFormat:@"%@°",tmp];
    return [self init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *timeLable = [[UILabel alloc] init];
        timeLable.font = dailyForecastfont;
        timeLable.textColor = white;
        timeLable.textAlignment = NSTextAlignmentCenter;
        timeLable.text = @"白天";
        
        UIImageView *condImageView = [[UIImageView alloc] init];
        condImageView.contentMode = UIViewContentModeScaleToFill;
        condImageView.image = [UIImage dayCondImageFromString:_cond];
        
        UILabel *condLable = [[UILabel alloc] init];
        condLable.font = dailyForecastfont;
        condLable.textColor = white;
        condLable.textAlignment = NSTextAlignmentCenter;
        condLable.text = _cond;
        
        UILabel *leftTmpLable = [[UILabel alloc] init];
        leftTmpLable.font = comfont;
        leftTmpLable.textColor = white;
        leftTmpLable.text = @"最高温";
        
        UILabel *tmpLable = [[UILabel alloc] init];
        tmpLable.font = dailyForecastfont;
        tmpLable.textColor = white;
        tmpLable.text = _tmp;
        
        if (_timeOfDay == night) {
            timeLable.text =@"夜晚";
            condImageView.image = [UIImage nightCondImageFromString:_cond];
            leftTmpLable.text = @"最低温";
        }
        
        [self addSubview:timeLable];
        [self addSubview:condImageView];
        [self addSubview:condLable];
        [self addSubview:leftTmpLable];
        [self addSubview:tmpLable];
        
        self.timeLable = timeLable;
        self.condImageView = condImageView;
        self.condLable = condLable;
        self.leftTmpLable = leftTmpLable;
        self.tmpLable = tmpLable;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat subW = self.frame.size.width;
    CGFloat subH = self.frame.size.height;
    
    CGFloat timeLableH = self.frame.size.height * 0.3;
    self.timeLable.frame = CGRectMake(0, 0, subW, timeLableH);
    
    CGFloat condImageViewWH = 40;
    CGFloat condImageViewCenterX = subW * 0.5;
    CGFloat condImageViewCenterY = subH * 0.5 - condImageViewWH * 0.5 - forecastmargin;
    CGRect condImageViewFrame = CGRectMake(0, 0, condImageViewWH, condImageViewWH);
    self.condImageView.frame = condImageViewFrame;
    self.condImageView.center = CGPointMake(condImageViewCenterX, condImageViewCenterY);
    
    NSMutableDictionary * comFontDict = [NSMutableDictionary dictionary];
    comFontDict[NSFontAttributeName] = dailyForecastfont;
    
    CGSize condSize = [_cond sizeWithAttributes:comFontDict];
    CGFloat condLableY = CGRectGetMaxY(_condImageView.frame) + forecastmargin * 2;
    CGRect condLableFrame = CGRectMake(0, condLableY, subW, condSize.height);
    self.condLable.frame = condLableFrame;
    
    NSMutableDictionary *leftTmpFontDict = [NSMutableDictionary dictionary];
    leftTmpFontDict[NSFontAttributeName] = comfont;
    CGSize leftTmpSize = [_leftTmpLable.text sizeWithAttributes:leftTmpFontDict];
    CGSize tmpSize = [_tmpLable.text sizeWithAttributes:comFontDict];
    CGFloat tmpMargin = 3;
    
    CGFloat leftTmpLableX = (subW - leftTmpSize.width - tmpSize.width - tmpMargin) * 0.5;
    CGFloat tmpLableY = CGRectGetMaxY(_condLable.frame) + forecastmargin * 3;
    CGFloat leftTmpLableY = tmpLableY + tmpSize.height - leftTmpSize.height - 3.5;
    CGFloat tmpLableX = leftTmpLableX + leftTmpSize.width + tmpMargin;
    
    self.leftTmpLable.frame = CGRectMake(leftTmpLableX, leftTmpLableY, leftTmpSize.width, leftTmpSize.height);
    self.tmpLable.frame = CGRectMake(tmpLableX, tmpLableY, tmpSize.width, tmpSize.height);
}

@end
