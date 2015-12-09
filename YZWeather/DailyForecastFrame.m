//
//  DailyForecastFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyForecastFrame.h"
#import "DailyForecastCellViewFrame.h"

@implementation DailyForecastFrame

- (void)setDaily_forecast:(NSArray *)daily_forecast
{
    _daily_forecast = daily_forecast;
    
    NSMutableArray *cellFrameArray = [NSMutableArray array];
    CGFloat btnW = screenSize.width / 3;
    for (int i = 0; i < 6; i++) {
        DailyForecast *dailyForecast = daily_forecast[i];
        
        DailyForecastCellViewFrame *dailyForecastCellViewFrame = [[DailyForecastCellViewFrame alloc] init];
        dailyForecastCellViewFrame.dailyForecast = dailyForecast;
        CGFloat btnX = btnW * i;
        CGFloat btnY = 0;
        CGFloat btnH = dailyForecastCellViewFrame.dailyForecastCellViewHeight;
        CGRect dailyForecastCellFrame = CGRectMake(btnX, btnY, btnW, btnH);
        dailyForecastCellViewFrame.cellFrame = dailyForecastCellFrame;
        [cellFrameArray addObject:dailyForecastCellViewFrame];
    }
    
    _cellFrameArray = cellFrameArray;
    
    CGFloat dailyForecastViewY = forecastmargin;
    DailyForecastCellViewFrame *dailyForecastCellViewFrame = cellFrameArray[0];
    CGRect btnFrame = dailyForecastCellViewFrame.cellFrame;
    CGFloat dailyForecastViewH = btnFrame.size.height;
    
    _dailyForecastViewFrame = CGRectMake(0, dailyForecastViewY, screenSize.width, dailyForecastViewH);
    
    _cellHeight = CGRectGetMaxY(_dailyForecastViewFrame);
}

@end
