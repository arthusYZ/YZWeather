//
//  Update.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  数据更新时间,24小时制

#import <Foundation/Foundation.h>

@interface Update : NSObject
/**
 *  数据更新的当地时间
 */
@property (nonatomic ,copy ) NSString *loc;
/**
 *  数据更新的UTC时间
 */
@property (nonatomic ,copy ) NSString *utc;

@end
