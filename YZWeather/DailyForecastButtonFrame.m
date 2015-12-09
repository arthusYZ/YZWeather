//
//  DailyForecastButtonFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyForecastButtonFrame.h"
#import "NSDate+MJ.h"

@implementation DailyForecastButtonFrame

- (void)setDailyForecast:(DailyForecast *)dailyForecast
{
    _dailyForecast = dailyForecast;
    
    CGFloat btnW = screenSize.width / 6;
    NSMutableDictionary *timeFontDict = [NSMutableDictionary dictionary];
    timeFontDict[NSFontAttributeName] = timefont;
    
    // 日期标签
    NSString *weekdayStr = [NSDate weekDayFromDate:dailyForecast.date];
    CGSize weekdaySize = [weekdayStr sizeWithAttributes:timeFontDict];
    CGFloat weekdayX = (btnW - weekdaySize.width) * 0.5;
    CGFloat weekdayY =forecastmargin;
    _weekdayLableFrame = CGRectMake(weekdayX, weekdayY, weekdaySize.width, weekdaySize.height);
    
    NSString *monthDateStr = [NSDate monthDateFromDate:dailyForecast.date];
    CGSize monthDateSize = [monthDateStr sizeWithAttributes:timeFontDict];
    CGFloat monthDateX = (btnW - monthDateSize.width) * 0.5;
    CGFloat monthDateY = CGRectGetMaxY(_weekdayLableFrame) + forecastmargin;
    _monthDateLableFrame = CGRectMake(monthDateX, monthDateY, monthDateSize.width, monthDateSize.height);
    
    // 天气情况图片
    CGFloat imageViewWH = 30;
    CGFloat imageViewMargin = forecastmargin * 2;
    CGFloat tmpViewH = 200;
    
    CGFloat dayCondImageViewY = CGRectGetMaxY(_monthDateLableFrame) + imageViewMargin;
    CGFloat dayCondImageViewX = (btnW - imageViewWH) * 0.5;
    _dayCondImageViewFrame = CGRectMake(dayCondImageViewX, dayCondImageViewY, imageViewWH, imageViewWH);
    
    CGFloat nightCondImageViewY = CGRectGetMaxY(_dayCondImageViewFrame) + tmpViewH;
    CGFloat nightCondImageViewX = dayCondImageViewX;
    _nightCondImageViewFrame = CGRectMake(nightCondImageViewX, nightCondImageViewY, imageViewWH, imageViewWH);
    
    // 风向
    NSString *windDir = dailyForecast.wind.dir;
    CGSize windDirSize = [windDir sizeWithAttributes:timeFontDict];
    CGFloat windDirX = (btnW - windDirSize.width) * 0.5;
    CGFloat windDirY = CGRectGetMaxY(_nightCondImageViewFrame) + forecastmargin;
    _windDirFrame = CGRectMake(windDirX, windDirY, windDirSize.width, windDirSize.height);
    
    // 风力
    NSString *windSc = dailyForecast.wind.sc;
    CGSize windScSize = [windSc sizeWithAttributes:timeFontDict];
    CGFloat windScX = (btnW - windScSize.width) * 0.5;
    CGFloat windScY = CGRectGetMaxY(_windDirFrame) + forecastmargin;
    _windScFrame = CGRectMake(windScX, windScY, windScSize.width, windScSize.height);
}

@end
