//
//  Basic.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  城市基本信息

#import <Foundation/Foundation.h>
#import "Update.h"

@interface Basic : NSObject
/**
 *  城市名称
 */
@property (nonatomic ,strong ) NSString *city;
/**
 *  数据更新时间,24小时制
 */
@property (nonatomic ,strong ) Update *update;

@end
