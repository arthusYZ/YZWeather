//
//  CityManageTool.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CityManageTool.h"

@implementation CityManageTool

+ (UIImage *)condImageWith:(Cond *)cond
{
    NSString *condString = [NSDate isDayTime]? cond.txt_d:cond.txt_n;
    return [UIImage cityManageCellCondImageFromCondString:condString WithTime:[NSDate isDayTime]];
}

@end
