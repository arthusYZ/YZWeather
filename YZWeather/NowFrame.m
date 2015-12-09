//
//  NowFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "NowFrame.h"

@implementation NowFrame

- (void)setWeatherData:(WeatherData *)weatherData
{
    _weatherData = weatherData;
    
    NSMutableDictionary *timeFontDict = [NSMutableDictionary dictionary];
    timeFontDict[NSFontAttributeName] = timefont;
    CGSize timeSize = [weatherData.basic.update.loc sizeWithAttributes:timeFontDict];\
    _updateLableFrame = CGRectMake(forecastmargin, 0, timeSize.width + 20, timeSize.height);
    
    NSString *tmp = weatherData.now.tmp;
    NSMutableDictionary *tmpFontDict = [NSMutableDictionary dictionary];
    tmpFontDict[NSFontAttributeName] = tmpfont;
    CGSize tmpSize = [tmp sizeWithAttributes:tmpFontDict];
    CGFloat tmpY = CGRectGetMaxY(_updateLableFrame) + screenSize.height * 0.32;
    CGFloat tmpX = forecastmargin;
    _tmpFrame = CGRectMake(tmpX, tmpY, tmpSize.width, tmpSize.height-40);
    
    // 公用字体
    NSMutableDictionary *comFontDict = [NSMutableDictionary dictionary];
    comFontDict[NSFontAttributeName] = comfont;
    
    // 温度符号标签
    CGSize tmpCircleSize = [@"○" sizeWithAttributes:comFontDict];
    CGFloat tmpCircleX = CGRectGetMaxX(_tmpFrame) + forecastmargin;
    _tmpCircleFrame = CGRectMake(tmpCircleX, tmpY, tmpCircleSize.width, tmpCircleSize.height);
    
    // 天气状况
    NSString *cond = weatherData.now.cond.txt;
    NSMutableDictionary *condFontDict = [NSMutableDictionary dictionary];
    condFontDict[NSFontAttributeName] = condfont;
    CGSize condSize = [cond sizeWithAttributes:condFontDict];
    CGFloat condY = CGRectGetMaxY(_tmpFrame) - condSize.height;
    _condFrame = CGRectMake(tmpCircleX, condY, condSize.width, condSize.height);
    
    // 体感温度
    NSString *fl = [NSString stringWithFormat:@"体感温度 %@",weatherData.now.fl];
    CGSize flSize = [fl sizeWithAttributes:comFontDict];
    CGFloat flY = CGRectGetMaxY(_tmpFrame) + 4;
    _flFrame = CGRectMake(tmpX, flY, flSize.width, flSize.height);
    
    // 风向风力及湿度
    NSString *windhum  = [NSString stringWithFormat:@"%@%@ 湿度 %@",weatherData.now.wind.dir,weatherData.now.wind.sc,weatherData.now.hum];
    CGSize windhumSize = [windhum sizeWithAttributes:comFontDict];
    CGFloat windhunY = CGRectGetMaxY(_flFrame) + 4;
    _windhumFrame = CGRectMake(tmpX, windhunY, windhumSize.width, windhumSize.height);
    
    
    NSString *title = [NSString stringWithFormat:@"%@·%@",weatherData.aqi.city.aqi,weatherData.aqi.city.qlty];
    NSMutableDictionary *aqiFontDict = [NSMutableDictionary dictionary];
    aqiFontDict[NSFontAttributeName] = aqiFont;
    CGSize aqiSize = [title sizeWithAttributes:aqiFontDict];
    
    CGFloat aqiY = CGRectGetMaxY(_windhumFrame) + forecastmargin * 0.5;
    
    CGSize imageSize = [UIImage imageNamed:@"forecast_card_icon_warning_bigrain"].size;
    
    _aqiBtnFrame = CGRectMake(forecastmargin, aqiY, imageSize.width + aqiSize.width + 10, imageSize.height + 5);
    
    _cellHeight = CGRectGetMaxY(_aqiBtnFrame) + forecastmargin;
}

@end
