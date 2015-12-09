//
//  AqiButton.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/11.
//  Copyright © 2015年 Yang. All rights reserved.
//  空气质量指数
#define aqiFont [UIFont systemFontOfSize:12]

#import <UIKit/UIKit.h>
#import "Aqi.h"

@interface AqiButton : UIButton
/**
 *  空气质量指数模型
 */
@property (nonatomic ,strong ) Aqi *aqi;

@end
