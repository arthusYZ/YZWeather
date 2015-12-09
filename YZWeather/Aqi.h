//
//  Aqi.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  空气质量指数

#import <Foundation/Foundation.h>
#import "City.h"

@interface Aqi : NSObject
/**
 *  城市数据
 */
@property (nonatomic ,strong ) City *city;

@end
