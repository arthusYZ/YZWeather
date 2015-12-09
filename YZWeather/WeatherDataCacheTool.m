//
//  WeatherDataCacheTool.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/28.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "WeatherDataCacheTool.h"
#import "FMDB.h"
#import "WeatherData.h"

@implementation WeatherDataCacheTool

static FMDatabaseQueue *_queue;

+ (void)setup
{
    // 0.获得沙盒中的数据库文件名
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"weatherDatas.sqlite"];
    
    // 1.创建队列
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    // 2.创表
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"create table if not exists t_weatherdatas (id integer primary key autoincrement, cityname text, weatherData blob);"];
    }];
}

#pragma mark 更改数据

+ (void)addWeatherData:(WeatherData *)weatherData withCityName:(NSString *)cityname
{
    [self setup];
    
    [_queue inDatabase:^(FMDatabase *db) {
        // 1.获得需要存储的数据
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:weatherData];
        
        // 2.存储数据
        [db executeUpdate:@"insert into t_weatherdatas (cityname, weatherData) values(?, ?)", cityname, data];
    }];
    
    [_queue close];
}

+ (void)updateWeatherData:(WeatherData *)weatherData withCityNmae:(NSString *)cityname
{
    [self setup];
    
    [_queue inDatabase:^(FMDatabase *db) {
        // 1.获得需要存储的数据
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:weatherData];
        
        // 2.存储数据
        [db executeUpdate:@"update t_weatherdatas set weatherData = ? where cityname = ?", data, cityname];
    }];
    
    [_queue close];
}

+ (void)deleteWeatherDataWithCityName:(NSString *)cityname
{
    [self setup];
    
    [_queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"delete from t_weatherdatas where cityname = ?",cityname];
    }];
    
    [_queue close];
}

#pragma mark 读取数据

+ (NSMutableArray *)loadAllWeatherDatas
{
    [self setup];
    __block NSMutableArray *weatherDatasArray = nil;
    
    // 2.使用数据库
    [_queue inDatabase:^(FMDatabase *db) {
        // 创建数组
        weatherDatasArray = [NSMutableArray array];
        
        FMResultSet *rs = [db executeQuery:@"select weatherData from t_weatherdatas order by id"];
        while (rs.next) {
            NSData *data = [rs dataForColumn:@"weatherData"];
            WeatherData *weatherData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [weatherDatasArray addObject:weatherData];
        }

    }];
    [_queue close];
    
    // 3.返回数据
    return weatherDatasArray;
}

+ (NSMutableArray *)loadAllCitys
{
    [self setup];
    __block NSMutableArray *citysArray = nil;
    
    // 2.使用数据库
    [_queue inDatabase:^(FMDatabase *db) {
        // 创建数组
        citysArray = [NSMutableArray array];
        
        FMResultSet *rs = [db executeQuery:@"select cityname from t_weatherdatas order by id"];
        while (rs.next) {
            NSString *cityname = [rs stringForColumn:@"cityname"];
            [citysArray addObject:cityname];
        }
        
    }];
    [_queue close];
    
    // 3.返回数据
    return citysArray;
}

@end
