//
//  DailyWeatherView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyWeatherView.h"
#import "CondView.h"
#import "NSDate+MJ.h"

@interface DailyWeatherView ()

@property (nonatomic ,strong ) DailyForecast *dailyForecast;

@property (nonatomic ,weak ) UILabel *weekdayLable;

@property (nonatomic ,weak ) UILabel *monthDateLable;

@property (nonatomic ,weak ) CondView *dayCondView;

@property (nonatomic ,weak ) CondView *nightCondView;

@property (nonatomic ,weak ) UILabel *windLable;

@property (nonatomic ,weak ) UIView *horizontalTopDevider;

@property (nonatomic ,weak ) UIView *horizontalBottomDevider;

@property (nonatomic ,weak ) UIView *verticalDevider;

@end

@implementation DailyWeatherView

- (instancetype)initWithDailyForecast:(DailyForecast *)dailyForecast
{
    self.dailyForecast = dailyForecast;
    return [self init];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSString *weekday  = [NSDate weekDayFromDate:_dailyForecast.date];
        NSString *monthDate = [NSDate monthDateFromDate:_dailyForecast.date];
        
        UILabel *weekdayLable = [[UILabel alloc] init];
        weekdayLable.font = dailyForecastfont;
        weekdayLable.textColor = white;
        weekdayLable.text = weekday;
        
        UILabel *monthDateLable = [[UILabel alloc] init];
        monthDateLable.font = timefont;
        monthDateLable.textColor = white;
        monthDateLable.text = monthDate;
        
        CondView *dayCondView = [[CondView alloc] initWithStyle:day withCond:_dailyForecast.cond.txt_d withTmp:_dailyForecast.tmp.max];
        
        CondView *nightCondView = [[CondView alloc] initWithStyle:night withCond:_dailyForecast.cond.txt_n withTmp:_dailyForecast.tmp.min];
        
        UILabel *windLable = [[UILabel alloc] init];
        windLable.font = navTitleFont;
        windLable.textColor = white;
        windLable.text = [NSString stringWithFormat:@"%@%@",_dailyForecast.wind.dir,_dailyForecast.wind.sc];
        
        UIView *horizontalTopDevider = [[UIView alloc] init];
        horizontalTopDevider.backgroundColor = [UIColor grayColor];
        horizontalTopDevider.alpha = deviderAlpha;
        self.horizontalTopDevider = horizontalTopDevider;
        
        UIView *horizontalBottomDevider = [[UIView alloc] init];
        horizontalBottomDevider.backgroundColor = [UIColor grayColor];
        horizontalBottomDevider.alpha = deviderAlpha;
        self.horizontalBottomDevider = horizontalBottomDevider;
        
        
        UIView *verticalDevider = [[UIView alloc] init];
        verticalDevider.backgroundColor = [UIColor grayColor];
        verticalDevider.alpha = deviderAlpha;
        self.verticalDevider = verticalDevider;
        
        [self addSubview:weekdayLable];
        [self addSubview:monthDateLable];
        [self addSubview:dayCondView];
        [self addSubview:nightCondView];
        [self addSubview:windLable];
        [self addSubview:horizontalTopDevider];
        [self addSubview:horizontalBottomDevider];
        [self addSubview:verticalDevider];
        
        self.weekdayLable = weekdayLable;
        self.monthDateLable = monthDateLable;
        self.dayCondView = dayCondView;
        self.nightCondView = nightCondView;
        self.windLable = windLable;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat subW = self.frame.size.width;
    
    NSMutableDictionary *weekdayFontDict = [NSMutableDictionary dictionary];
    weekdayFontDict[NSFontAttributeName] = dailyForecastfont;
    CGSize weekdaySize = [_weekdayLable.text sizeWithAttributes:weekdayFontDict];
    
    CGFloat weekdayLableCenterX = subW * 0.5;
    CGFloat weekdayLableCenterY = weekdaySize.height * 0.5 + 64 + forecastmargin * 4;
    CGRect weekdayLableFrame = CGRectMake(0, 0, weekdaySize.width, weekdaySize.height);
    self.weekdayLable.frame = weekdayLableFrame;
    self.weekdayLable.center = CGPointMake(weekdayLableCenterX, weekdayLableCenterY);
    
    NSMutableDictionary *monthDateFontDict = [NSMutableDictionary dictionary];
    monthDateFontDict[NSFontAttributeName] = timefont;
    CGSize monthDateSize= [_monthDateLable.text sizeWithAttributes:monthDateFontDict];
    
    CGFloat monthDateLableCenterY = CGRectGetMaxY(_weekdayLable.frame) + forecastmargin + monthDateSize.height * 0.5;
    CGRect monthDateLableFrame = CGRectMake(0, 0, monthDateSize.width, monthDateSize.height);
    self.monthDateLable.frame = monthDateLableFrame;
    self.monthDateLable.center = CGPointMake(weekdayLableCenterX, monthDateLableCenterY);
    
    CGFloat condViewY = CGRectGetMaxY(_monthDateLable.frame) + forecastmargin *4;
    CGFloat condViewH = self.frame.size.height * 0.4;
    CGFloat condViewW = subW * 0.5;
    self.horizontalTopDevider.frame = CGRectMake(0, condViewY, subW, 1);
    self.horizontalBottomDevider.frame = CGRectMake(0, condViewY + condViewH, subW, 1);
    self.verticalDevider.frame = CGRectMake(0, 0, 1, condViewH * 0.8);
    self.verticalDevider.center = CGPointMake(condViewW, condViewY + condViewH * 0.5);
    
    CGRect dayCondViewFrame = CGRectMake(0, condViewY, condViewW, condViewH);
    self.dayCondView.frame = dayCondViewFrame;
    CGRect nightCondViewFrame = CGRectMake(condViewW, condViewY, condViewW, condViewH);
    self.nightCondView.frame = nightCondViewFrame;
    
    NSMutableDictionary *windFontDict = [NSMutableDictionary dictionary];
    windFontDict[NSFontAttributeName] = navTitleFont;
    CGSize windLableSize = [_windLable.text sizeWithAttributes:windFontDict];
    
    CGFloat windLableCenterX = subW * 0.5;
    CGFloat windLableCenterY = CGRectGetMaxY(_dayCondView.frame) + forecastmargin * 10;
    self.windLable.frame = CGRectMake(0, 0, windLableSize.width, windLableSize.height);
    self.windLable.center = CGPointMake(windLableCenterX, windLableCenterY);
}

@end
