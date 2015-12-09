//
//  DailyWeatherButton.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/13.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyWeatherButton.h"
#import "NSDate+MJ.h"
#import "UIImage+YZ.h"

@interface DailyWeatherButton ()
/**
 *  日期（星期几）标签
 */
@property (nonatomic ,weak ) UILabel *weekdayLable;
/**
 *  日期（月日）标签
 */
@property (nonatomic ,weak ) UILabel *monthDateLable;
/**
 *  日间天气状况图片
 */
@property (nonatomic ,weak ) UIImageView *dayCondImageView;
/**
 *  夜间天气状况图片
 */
@property (nonatomic ,weak ) UIImageView *nightCondImageView;
/**
 *  风向标签
 */
@property (nonatomic ,weak ) UILabel *windDir;
/**
 *  风力大小
 */
@property (nonatomic ,weak ) UILabel *windSc;

@end

@implementation DailyWeatherButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor blackColor];
        
        UILabel *weekdayLable = [[UILabel alloc] init];
        weekdayLable.font = timefont;
        weekdayLable.textColor = white;
        [self addSubview:weekdayLable];
        self.weekdayLable = weekdayLable;
        
        UILabel *monthDateLable = [[UILabel alloc] init];
        monthDateLable.font = timefont;
        monthDateLable.textColor = white;
        [self addSubview:monthDateLable];
        self.monthDateLable = monthDateLable;
        
        UIImageView *dayCondImageView = [[UIImageView alloc] init];
        dayCondImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:dayCondImageView];
        self.dayCondImageView = dayCondImageView;
        
        UIImageView *nightCondImageView = [[UIImageView alloc] init];
        nightCondImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:nightCondImageView];
        self.nightCondImageView = nightCondImageView;
        
        UILabel *windDir = [[UILabel alloc] init];
        windDir.font = timefont;
        windDir.textColor = white;
        [self addSubview:windDir];
        self.windDir = windDir;
        
        UILabel *windSc = [[UILabel alloc] init];
        windSc.font = timefont;
        windSc.textColor = white;
        [self addSubview:windSc];
        self.windSc = windSc;
    }
    return self;
}

-  (void)setDailyForecastButtonFrame:(DailyForecastButtonFrame *)dailyForecastButtonFrame
{
    _dailyForecastButtonFrame = dailyForecastButtonFrame;

    DailyForecast *dailyForecast = dailyForecastButtonFrame.dailyForecast;
    
    // 日期标签
    NSString *weekdayStr = [NSDate weekDayFromDate:dailyForecast.date];
    self.weekdayLable.text = weekdayStr;
    self.weekdayLable.frame = dailyForecastButtonFrame.weekdayLableFrame;
    
    NSString *monthDateStr = [NSDate monthDateFromDate:dailyForecast.date];
    self.monthDateLable.text = monthDateStr;
    self.monthDateLable.frame = dailyForecastButtonFrame.monthDateLableFrame;
    
    // 天气情况图片
    self.dayCondImageView.image = [UIImage dayCondImageFromString:dailyForecast.cond.txt_d];
    self.dayCondImageView.frame = dailyForecastButtonFrame.dayCondImageViewFrame;
    
    self.nightCondImageView.image = [UIImage nightCondImageFromString:dailyForecast.cond.txt_n];
    self.nightCondImageView.frame = dailyForecastButtonFrame.nightCondImageViewFrame;
    
    // 风向
    NSString *windDir = dailyForecast.wind.dir;
    self.windDir.text = windDir;
    self.windDir.frame = dailyForecastButtonFrame.windDirFrame;
    
    // 风力
    NSString *windSc = dailyForecast.wind.sc;
    self.windSc.text = windSc;
    self.windSc.frame = dailyForecastButtonFrame.windScFrame;
}

@end
