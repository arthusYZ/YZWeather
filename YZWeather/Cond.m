//
//  Cond.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "Cond.h"
#import "MJExtension.h"


@implementation Cond
- (NSString *)txt
{
    if ([_txt isEqualToString:@"毛毛雨/细雨"]) {
        _txt = @"小雨";
    }
    return _txt;
}

- (NSString *)txt_d
{
    if ([_txt_d isEqualToString:@"毛毛雨/细雨"]) {
        _txt_d = @"小雨";
    }
    return _txt_d;
}

- (NSString *)txt_n
{
    if ([_txt_n isEqualToString:@"毛毛雨/细雨"]) {
        _txt_n = @"小雨";
    }
    return _txt_n;
}

MJCodingImplementation

@end
