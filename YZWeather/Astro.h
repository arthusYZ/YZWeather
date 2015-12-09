//
//  Astro.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  天文数值

#import <Foundation/Foundation.h>

@interface Astro : NSObject
/**
 *  日出时间
 */
@property (nonatomic ,copy ) NSString *sr;
/**
 *  日落时间
 */
@property (nonatomic ,copy ) NSString *ss;

@end
