//
//  City.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  城市数据空气质量

#import <Foundation/Foundation.h>

@interface City : NSObject
/**
 *  PM2.5 1小时平均值(ug/m³)
 */
@property (nonatomic ,copy ) NSString *pm25;
/**
 *  空气质量类别
 */
@property (nonatomic ,copy ) NSString *qlty;
/**
 *  空气质量指数
 */
@property (nonatomic ,copy ) NSString *aqi;

@end
