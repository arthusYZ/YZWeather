//
//  Cond.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  天气状况

#import <Foundation/Foundation.h>

@interface Cond : NSObject
/**
 *  白天天气描述
 */
@property (nonatomic ,copy ) NSString *txt_d;
/**
 *  夜间天气描述
 */
@property (nonatomic ,copy ) NSString *txt_n;
/**
 *  天气描述（实况）
 */
@property (nonatomic ,copy ) NSString *txt;


@end
