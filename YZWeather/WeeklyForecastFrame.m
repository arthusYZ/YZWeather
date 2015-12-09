//
//  WeeklyForecastFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "WeeklyForecastFrame.h"
#import "DailyForecast.h"

@implementation WeeklyForecastFrame

- (NSArray *)tmpsArray
{
    if (!_tmpsArray) {
        _tmpsArray = [NSArray array];
    }
    return _tmpsArray;
}




- (void)setDaily_forecast:(NSArray *)daily_forecast
{
    _daily_forecast = daily_forecast;
    
    NSMutableDictionary *dailyDayFontDict = [NSMutableDictionary dictionary];
    dailyDayFontDict[NSFontAttributeName] = dailyDayfont;
    CGSize weatherLableSize = [@"天气" sizeWithAttributes:dailyDayFontDict];
    CGFloat weatherLableX = forecastmargin;
    _weatherLableFrame = CGRectMake(weatherLableX, 0, weatherLableSize.width, weatherLableSize.height);
    
    CGFloat horizontalDeviderX = CGRectGetMaxX(_weatherLableFrame) + forecastmargin * 0.5;
    CGFloat horizontalDeviderW = screenSize.width - CGRectGetMaxX(_weatherLableFrame) - forecastmargin;
    _horizontalDeviderFrame =CGRectMake(horizontalDeviderX, _weatherLableFrame.size.height * 0.5, horizontalDeviderW, 1);
    
    NSMutableArray *btnFrameArray = [NSMutableArray array];
    NSMutableArray *maxTmpArray = [NSMutableArray array];
    NSMutableArray *minTmpArray = [NSMutableArray array];
    
    CGFloat dailyForecastButtonY = CGRectGetMaxY(_weatherLableFrame) + forecastmargin;
    CGFloat dailyForecastButtonW = screenSize.width / 6;
    for (int i = 0; i < 6; i++) {
        DailyForecast *dailyForecast = daily_forecast[i];
        
        [maxTmpArray addObject:dailyForecast.tmp.max];
        [minTmpArray addObject:dailyForecast.tmp.min];
        
        DailyForecastButtonFrame *dailyForecastButtonFrame = [[DailyForecastButtonFrame alloc] init];
        dailyForecastButtonFrame.dailyForecast = dailyForecast;
        CGFloat dailyForecastButtonX = dailyForecastButtonW * i;
        CGFloat dailyForecastButtonH = CGRectGetMaxY(dailyForecastButtonFrame.windScFrame) + forecastmargin;
        CGRect dailyForecastBtnFrame = CGRectMake(dailyForecastButtonX, dailyForecastButtonY, dailyForecastButtonW, dailyForecastButtonH);
        dailyForecastButtonFrame.buttonFrame = dailyForecastBtnFrame;
        [btnFrameArray addObject:dailyForecastButtonFrame];
    }
    _tmpsArray = @[maxTmpArray,minTmpArray];
    
    DailyForecastButtonFrame *dailyForecastButtonFrame = btnFrameArray[0];
    
    
    
    
    CGRect btnFrame = dailyForecastButtonFrame.buttonFrame;
    
    CGRect frame = dailyForecastButtonFrame.dayCondImageViewFrame;
    
    CGFloat chartY = CGRectGetMaxY(frame) + forecastmargin + dailyForecastButtonY;
    CGFloat chartH = 200 -forecastmargin * 2;
    CGRect chartFrame = CGRectMake(0, chartY, screenSize.width, chartH);
    _chartViewFrame = chartFrame;
    
    _btnFrameArray = btnFrameArray;
    
    _cellHeight = CGRectGetMaxY(btnFrame) + forecastmargin;
}

@end
