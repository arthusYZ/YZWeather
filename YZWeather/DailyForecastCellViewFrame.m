//
//  DailyForecastCellViewFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyForecastCellViewFrame.h"
#import "NSDate+MJ.h"
#import "UIImage+YZ.h"


@implementation DailyForecastCellViewFrame

- (void)setDailyForecast:(DailyForecast *)dailyForecast
{
    _dailyForecast = dailyForecast;
    // 整个按钮的宽度
    CGFloat btnW = screenSize.width / 3;
    
    // 日期标签
    NSString *dailyDay = [NSDate weekDayFromDate:dailyForecast.date];
    NSMutableDictionary *dayFontDict = [NSMutableDictionary dictionary];
    dayFontDict[NSFontAttributeName] = dailyDayfont;
    CGSize dailyDaySize = [dailyDay sizeWithAttributes:dayFontDict];
    CGFloat dayW = dailyDaySize.width;
    CGFloat dayH = dailyDaySize.height;
    CGFloat dayY = forecastmargin;
    CGFloat dayX = (btnW - dayW) * 0.5;
    _dayLableFrame = CGRectMake(dayX, dayY, dayW, dayH);
    
    
    // 天气状况图片
    UIImage *condImage = [UIImage dayCondImageFromString:dailyForecast.cond.txt_d];
    CGFloat condImageX = forecastmargin;
    CGFloat condImageY = CGRectGetMaxY(_dayLableFrame) + forecastmargin;
    _condImageViewFrame = CGRectMake(condImageX, condImageY, condImage.size.width, condImage.size.height);
    
    // 最高最低温度标签
    NSMutableDictionary *tmpFontDict = [NSMutableDictionary dictionary];
    tmpFontDict[NSFontAttributeName] = aqiFont;
    
    NSString *maxTmp = [NSString stringWithFormat:@"%@°",dailyForecast.tmp.max];
    NSString *minTmp = [NSString stringWithFormat:@"%@°",dailyForecast.tmp.min];
    
    CGSize maxTmpSize = [maxTmp sizeWithAttributes:tmpFontDict];
    CGSize minTmpSize = [minTmp sizeWithAttributes:tmpFontDict];
    
    // 最高温度
    CGFloat maxTmpX = btnW - maxTmpSize.width - forecastmargin;
    CGFloat maxTmpY = condImageY;
    _maxTmpLableFrame = CGRectMake(maxTmpX, maxTmpY, maxTmpSize.width, maxTmpSize.height);
    
    // 最低温度
    CGFloat minTmpX = btnW - minTmpSize.width - forecastmargin;
    CGFloat minTmpY = CGRectGetMaxY(_condImageViewFrame) - minTmpSize.height;
    _minTmpLableFrame = CGRectMake(minTmpX, minTmpY, minTmpSize.width, minTmpSize.height);
    
    // 天气状况文字描述
    CGSize condTextSize = [dailyForecast.cond.txt_d sizeWithAttributes:dayFontDict];
    CGFloat condTextY = CGRectGetMaxY(_condImageViewFrame) + forecastmargin;
    CGFloat condTextX = (btnW - condTextSize.width) * 0.5;
    _condTextLableFrame = CGRectMake(condTextX, condTextY, condTextSize.width, condTextSize.height);
    
    _dailyForecastCellViewHeight = CGRectGetMaxY(_condTextLableFrame) + forecastmargin;
}

@end
