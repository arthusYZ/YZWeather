//
//  ForecastRequest.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherData.h"
#import "YzHttpTool.h"

@interface ForecastRequest : NSObject
/**
 *  通过城市名称获得天气预报数据
 *
 *  @param cityname 城市名称
 *
 *  @return 天气预报数据
 */
+ (void)requestWithCityname:(NSString *)cityname success:(void(^)(WeatherData *weatherData))success failure:(void(^)(NSError *error))failure;


+ (void)homeWeatherDatasSuccess:(void(^)(NSMutableArray *weatherDatas))success failure:(void(^)(NSError *error))failure;

+ (void)deleteWithCityname:(NSString *)cityname;

@end
