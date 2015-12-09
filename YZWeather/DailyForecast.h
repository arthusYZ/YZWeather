//
//  DailyForecast.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/12.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Astro.h"
#import "Cond.h"
#import "Wind.h"
#import "Tmp.h"

@interface DailyForecast : NSObject
/**
 *  天文数值（日出日落时间）
 */
@property (nonatomic ,strong ) Astro *astro;
/**
 *  天气状况
 */
@property (nonatomic ,strong ) Cond *cond;
/**
 *  风力状况
 */
@property (nonatomic ,strong ) Wind *wind;
/**
 *  最低最高温度
 */
@property (nonatomic ,strong ) Tmp *tmp;
/**
 *  当地日期
 */
@property (nonatomic ,copy ) NSString *date;
/**
 *  湿度(%)
 */
@property (nonatomic ,copy ) NSString *hum;
@end
