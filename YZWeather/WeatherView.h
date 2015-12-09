//
//  WeatherView.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherView : UIScrollView

- (instancetype)initWithDailyForecasts:(NSArray *)dailyForecasts;

@end
