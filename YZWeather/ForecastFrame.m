//
//  ForecastFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "ForecastFrame.h"

@implementation ForecastFrame

- (void)setWeatherData:(WeatherData *)weatherData
{
    _weatherData = weatherData;
    
    NowFrame *nowFrame = [[NowFrame alloc] init];
    nowFrame.weatherData = weatherData;
    _nowFrame = nowFrame;
    
    DailyForecastFrame *dailyForecastFrame = [[DailyForecastFrame alloc] init];
    dailyForecastFrame.daily_forecast = weatherData.daily_forecast;
    _dailyForecastFrame = dailyForecastFrame;
    
    WeeklyForecastFrame *weeklyForecastFrame = [[WeeklyForecastFrame alloc] init];
    weeklyForecastFrame.daily_forecast = weatherData.daily_forecast;
    _weeklyForecastFrame = weeklyForecastFrame;
    
    SuggestionFrame *suggestionFrame = [[SuggestionFrame alloc] init];
    suggestionFrame.suggestion = weatherData.suggestion;
    _suggestionFrame = suggestionFrame;
}

@end
