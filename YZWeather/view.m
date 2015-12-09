//
//  view.m
//  YZWeather
//
//  Created by 杨舟 on 15/12/3.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "view.h"

@implementation view

+ (instancetype)viewWithGoods:(NSString *)goods
{
    return [[self alloc] initWithGoods:goods];
}

- (instancetype)initWithGoods:(NSString *)goods
{
    view *view = [self init];
    self.goods = goods;
    return view;
}

@end
