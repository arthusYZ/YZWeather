//
//  CityCellButton.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyForecast.h"

typedef void (^ deleteCity) (NSInteger tag);

@interface CityCellButton : UIButton


@property (nonatomic ,assign ) BOOL deleteButtonHidden;

@property (nonatomic ,strong ) DailyForecast *today;

@property (nonatomic ,copy ) deleteCity deleteCity;

- (instancetype)initWithCityname:(NSString *)cityname;

@end
