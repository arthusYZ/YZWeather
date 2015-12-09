//
//  WeatherView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "WeatherView.h"
#import "DailyWeatherView.h"
#import "DailyForecast.h"

@interface WeatherView ()

@property (nonatomic ,strong ) NSArray *dailyForecasts;


@property (nonatomic ,strong ) NSArray *dailyWeatherViewsArray;

@end

@implementation WeatherView

- (NSArray *)dailyWeatherViewsArray
{
    if (!_dailyForecasts) {
        _dailyForecasts = [NSArray array];
    }
    return _dailyForecasts;
}

- (instancetype)initWithDailyForecasts:(NSArray *)dailyForecasts
{
    self.dailyForecasts = dailyForecasts;
    
    return [self init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        NSInteger index = _dailyForecasts.count;
        NSMutableArray *dailyWeatherTempArray = [NSMutableArray array];
        for (int i = 0; i < index; i++) {
            DailyForecast *dailyForecast = _dailyForecasts[i];
            DailyWeatherView *dailyWeatherView = [[DailyWeatherView alloc] initWithDailyForecast:dailyForecast];
            [self addSubview:dailyWeatherView];
            [dailyWeatherTempArray addObject:dailyWeatherView];
        }
        self.dailyWeatherViewsArray = dailyWeatherTempArray;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger index = _dailyForecasts.count;
    for (int i = 0; i < index; i++) {
        DailyWeatherView *dailyWeatherView = _dailyWeatherViewsArray[i];
        CGRect dailyWeatherViewFrame = CGRectMake(screenSize.width * i, 0, screenSize.width, screenSize.height);
        dailyWeatherView.frame = dailyWeatherViewFrame;
        
    }
}

@end
