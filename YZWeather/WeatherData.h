//
//  WeatherData.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  天气预报数据

#import <Foundation/Foundation.h>
#import "Aqi.h"
#import "Basic.h"
#import "Forecast.h"
#import "DailyForecast.h"
#import "Suggestion.h"

@interface WeatherData : NSObject
/**
 *  空气质量指数
 */
@property (nonatomic ,strong ) Aqi *aqi;
/**
 *  城市基本信息
 */
@property (nonatomic ,strong ) Basic *basic;
/**
 *  一周内天气预报
 */
@property (nonatomic ,strong ) NSArray *daily_forecast;
/**
 *  每小时天气预报
 */
@property (nonatomic ,strong ) NSArray *hourly_forecast;
/**
 *  实况天气
 */
@property (nonatomic ,strong ) Forecast *now;
/**
 *  生活指数
 */
@property (nonatomic ,strong ) Suggestion *suggestion;

@end
