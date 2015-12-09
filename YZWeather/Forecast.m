//
//  Forecast.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "Forecast.h"
#import "MJExtension.h"

@implementation Forecast

- (NSString *)fl
{
    NSRange range = [_fl rangeOfString:@"°"];
    if (range.location == NSNotFound) {
        return [NSString stringWithFormat:@"%@°",_fl];
    }else{
        return _fl;
    }
}

- (NSString *)hum
{
    NSRange range = [_hum rangeOfString:@"%"];
    if (range.location == NSNotFound) {
        return [NSString stringWithFormat:@"%@%%",_hum];
    }else{
        return _hum;
    }
}

MJCodingImplementation

@end
