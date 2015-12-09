//
//  WeatherData.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "WeatherData.h"
#import "MJExtension.h"

@implementation WeatherData

+ (NSDictionary *)objectClassInArray
{
    return @{@"daily_forecast" : [DailyForecast class],@"hourly_forecast" : [Forecast class]};
}

MJCodingImplementation

@end
