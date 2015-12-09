//
//  WeatherDataCacheTool.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/28.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherData;

@interface WeatherDataCacheTool : NSObject

#pragma mark 更改数据

+ (void)addWeatherData:(WeatherData *)weatherData withCityName:(NSString *)cityname;

+ (void)updateWeatherData:(WeatherData *)weatherData withCityNmae:(NSString *)cityname;

+ (void)deleteWeatherDataWithCityName:(NSString *)cityname;

#pragma mark 读取数据

+ (NSMutableArray *)loadAllWeatherDatas;

+ (NSMutableArray *)loadAllCitys;

@end
