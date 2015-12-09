//
//  WeeklyForecastFrame.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DailyForecastButtonFrame.h"

@interface WeeklyForecastFrame : NSObject

@property (nonatomic ,strong ) NSArray *daily_forecast;

@property (nonatomic ,strong ) NSArray *btnFrameArray;

@property (nonatomic ,assign ) CGFloat cellHeight;

@property (nonatomic ,assign ) CGRect weatherLableFrame;

@property (nonatomic ,assign ) CGRect horizontalDeviderFrame;

@property (nonatomic ,assign ) CGRect chartViewFrame;
/**
 *  最高温度数组
 */
@property (nonatomic ,strong ) NSArray *tmpsArray;

@end
