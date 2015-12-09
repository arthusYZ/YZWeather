//
//  ForecastRequest.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "ForecastRequest.h"
#import "MJExtension.h"
#import "WeatherDataCacheTool.h"

@interface ForecastRequest()
@end

@implementation ForecastRequest

+ (void)requestWithCityname:(NSString *)cityname success:(void (^)(WeatherData *weatherData))success failure:(void (^)(NSError *error))failure
{
    
//    [WeatherDataCacheTool addWeatherData:nil withCityName:cityname];
    
    // 设置请求体
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    param[@"city"] = cityname;
    param[@"key"] = @"1592213ace62408d9ec37752772ccd96";
    
    [YzHttpTool getWithURL:@"https://api.heweather.com/x3/weather" params:param success:^(id responseObject) {
        NSArray *weatherArray = [WeatherData mj_objectArrayWithKeyValuesArray:responseObject[@"HeWeather data service 3.0"]];
        WeatherData *weatherData = [weatherArray lastObject];
        
        NSArray *cityArray = [WeatherDataCacheTool loadAllCitys];
        if ([cityArray indexOfObject:cityname] != NSNotFound) {
            [WeatherDataCacheTool updateWeatherData:weatherData withCityNmae:cityname];
        }else{
            [WeatherDataCacheTool addWeatherData:weatherData withCityName:cityname];
        }
        
        if (success) {
            success(weatherData);
        }

    } falure:^(NSError *error) {
        
    }];
}

+ (void)homeWeatherDatasSuccess:(void (^)(NSMutableArray *weatherDatas))success failure:(void (^)(NSError *error))failure
{
    
        NSMutableArray *weatherDatas = [WeatherDataCacheTool loadAllWeatherDatas];
    if (weatherDatas.count) {
        if (success) {
            success(weatherDatas);
        }
    }else
    {
        [self requestWithCityname:@"杭州" success:^(WeatherData *weatherData) {
            if (success) {
                success([WeatherDataCacheTool loadAllWeatherDatas]);
            }
        } failure:^(NSError *error) {
            
        }];
    }    
}

+ (void)deleteWithCityname:(NSString *)cityname
{
    [WeatherDataCacheTool deleteWeatherDataWithCityName:cityname];
}

@end
