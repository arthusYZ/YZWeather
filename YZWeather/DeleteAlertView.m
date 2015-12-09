//
//  DeleteAlertView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#define AlertPadding 10
#define AlertHeight 130
#define AlertWidth 270

#import "DeleteAlertView.h"

@interface DeleteAlertView ()

@property (nonatomic ,weak ) UIView *superView;

@property (nonatomic ,weak ) UIView *alertView;

@property (nonatomic ,weak ) UIView *coverView;

@end

@implementation DeleteAlertView

- (void)show
{
    [UIView animateWithDuration:0.5 animations:^{
        _coverView.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        
    }];
    
    [[[UIApplication sharedApplication] keyWindow].subviews[0] addSubview:self];
    _superView.userInteractionEnabled = NO;
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [_alertView.layer addAnimation:popAnimation forKey:nil];
}

- (instancetype)initWithView:(UIView *)view
{
    _superView = view;
    return [self init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.userInteractionEnabled = NO;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
//        self.alpha = 0;
//        [_superView addSubview:self];
        UIView *coverView = [[UIView alloc] initWithFrame:self.bounds];
//        coverView.userInteractionEnabled = NO;
        coverView.alpha = 0;
        coverView.backgroundColor = [UIColor blackColor];
        [self addSubview:coverView];
        self.coverView = coverView;
        
        UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AlertWidth, AlertHeight)];
        alertView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        alertView.layer.cornerRadius = 10;
        alertView.layer.masksToBounds = YES;
        alertView.backgroundColor = [UIColor whiteColor];
        [self addSubview:alertView];
        self.alertView = alertView;
        
        //title
        CGFloat labelHeigh = [self heightWithString:@"提示" fontSize:17 width:AlertWidth-2*AlertPadding];
        UILabel *labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(AlertPadding, AlertPadding * 2, AlertWidth-2*AlertPadding, labelHeigh)];
        labelTitle.font = [UIFont boldSystemFontOfSize:17];
        labelTitle.textColor = [UIColor blackColor];
        labelTitle.textAlignment = NSTextAlignmentCenter;
        labelTitle.numberOfLines = 0;
        labelTitle.text = @"提示";
        labelTitle.lineBreakMode = NSLineBreakByCharWrapping;
        [_alertView addSubview:labelTitle];
        
        //message
        CGFloat messageHeigh = [self heightWithString:@"请至少保留一个城市" fontSize:12 width:AlertWidth-2*AlertPadding];
        UILabel *labelmessage =  [[UILabel alloc]initWithFrame:CGRectMake(AlertPadding, labelTitle.frame.origin.y+labelTitle.frame.size.height + AlertPadding, AlertWidth-2*AlertPadding, messageHeigh)];
        labelmessage.font = [UIFont systemFontOfSize:12];
        labelmessage.textColor = [UIColor blackColor];
        labelmessage.textAlignment = NSTextAlignmentCenter;
        labelmessage.text = @"请至少保留一个城市";
        labelmessage.numberOfLines = 0;
        labelmessage.lineBreakMode = NSLineBreakByCharWrapping;
        [_alertView addSubview:labelmessage];
        
        CGFloat deviderY = CGRectGetMaxY(labelmessage.frame) + AlertPadding *2;
        UIView *devider = [[UIView alloc] initWithFrame:CGRectMake(0, deviderY, AlertWidth, 1)];
        devider.backgroundColor = [UIColor grayColor];
        devider.alpha = deviderAlpha;
        [_alertView addSubview:devider];
        
        CGFloat btnY = CGRectGetMaxY(devider.frame);
        CGFloat btnH = AlertHeight - btnY;
        UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
        confirmButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [confirmButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [confirmButton setTitle:@"OK" forState:UIControlStateNormal];
        confirmButton.frame = CGRectMake(0, btnY, AlertWidth, btnH);
        [_alertView addSubview:confirmButton];
    }
    return self;
}

- (CGFloat)heightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

- (void)dismiss
{
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakself.alpha = 0.0;
        _alertView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        [weakself removeFromSuperview];
        weakself.superView.userInteractionEnabled = YES;
    }];
}

@end
