//
//  Wind.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//  风力状况

#import "Wind.h"
#import "MJExtension.h"

@implementation Wind

- (NSString *)sc
{
    NSRange range = [_sc rangeOfString:@"级"];
    if (range.location == NSNotFound) {
    if ([_sc isEqualToString:@"微风"]) {
        return _sc;
    }
    return [NSString stringWithFormat:@"%@级",_sc];
    }else
    {
        return _sc;
    }
}

MJCodingImplementation

@end
