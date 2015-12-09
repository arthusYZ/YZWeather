//
//  Wind.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  风力状况

#import <Foundation/Foundation.h>

@interface Wind : NSObject
/**
 *  风向(方向)
 */
@property (nonatomic ,copy ) NSString *dir;
/**
 *  风力等级
 */
@property (nonatomic ,copy ) NSString *sc;

@end
