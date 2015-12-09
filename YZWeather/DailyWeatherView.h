//
//  DailyWeatherView.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyForecast.h"

@interface DailyWeatherView : UIView

- (instancetype)initWithDailyForecast:(DailyForecast *)dailyForecast;

@end
