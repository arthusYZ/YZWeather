//
//  DailyForecastButtonFrame.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DailyForecast.h"

@interface DailyForecastButtonFrame : NSObject

@property (nonatomic ,strong ) DailyForecast *dailyForecast;

@property (nonatomic ,assign ) CGRect buttonFrame;

@property (nonatomic ,assign ) CGRect weekdayLableFrame;

@property (nonatomic ,assign ) CGRect monthDateLableFrame;

@property (nonatomic ,assign ) CGRect dayCondImageViewFrame;

@property (nonatomic ,assign ) CGRect nightCondImageViewFrame;

@property (nonatomic ,assign ) CGRect windDirFrame;

@property (nonatomic ,assign ) CGRect windScFrame;


@end
