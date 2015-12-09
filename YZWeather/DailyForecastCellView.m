//
//  DailyForecastCellView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/13.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyForecastCellView.h"
#import "UIImage+YZ.h"
#import "NSDate+MJ.h"
#import "Masonry.h"

@interface DailyForecastCellView ()
/**
 *  日期（星期几）标签
 */
@property (nonatomic ,weak ) UILabel *dayLable;
/**
 *  天气状况图片
 */
@property (nonatomic ,weak ) UIImageView *condImageView;
/**
 *  最高温度标签
 */
@property (nonatomic ,weak ) UILabel *maxTmpLable;
/**
 *  最低温度标签
 */
@property (nonatomic ,weak ) UILabel *minTmpLable;
/**
 *  天气状况文字描述标签
 */
@property (nonatomic ,weak ) UILabel *condTextLable;

@end

@implementation DailyForecastCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 创建日期标签
        UILabel *dayLable  = [[UILabel alloc] init];
        dayLable.font = dailyDayfont;
        dayLable.textColor = white;
        [self addSubview:dayLable];
        self.dayLable = dayLable;
        
        // 创建天气状况图片
        UIImageView *condImageView = [[UIImageView alloc] init];
        [self addSubview:condImageView];
        self.condImageView = condImageView;
        
        // 创建最高温度标签
        UILabel *maxTmpLable = [[UILabel alloc] init];
        maxTmpLable.font = aqiFont;
        maxTmpLable.textColor = white;
        [self addSubview:maxTmpLable];
        self.maxTmpLable = maxTmpLable;
        
        // 创建最低温度标签
        UILabel *minTmpLable = [[UILabel alloc] init];
        minTmpLable.font = aqiFont;
        minTmpLable.textColor = white;
        [self addSubview:minTmpLable];
        self.minTmpLable = minTmpLable;
        
        // 创建天气状况文字描述标签
        UILabel *condTextLable = [[UILabel alloc] init];
        condTextLable.font = dailyDayfont;
        condTextLable.textColor = white;
        [self addSubview:condTextLable];
        self.condTextLable = condTextLable;
    }
    return self;
}

- (void)setDailyForecastCellViewFrame:(DailyForecastCellViewFrame *)dailyForecastCellViewFrame
{
    _dailyForecastCellViewFrame = dailyForecastCellViewFrame;
    
    DailyForecast *dailyForecast = dailyForecastCellViewFrame.dailyForecast;
    
    // 日期标签
    NSString *dailyDay = [NSDate weekDayFromDate:dailyForecast.date];
    self.dayLable.text = dailyDay;
    self.dayLable.frame = dailyForecastCellViewFrame.dayLableFrame;
    
    // 天气状况图片
    UIImage *condImage = [UIImage dayCondImageFromString:dailyForecast.cond.txt_d];
    self.condImageView.image = condImage;
    self.condImageView.frame = dailyForecastCellViewFrame.condImageViewFrame;
    
    // 最高最低温度标签
    NSString *maxTmp = [NSString stringWithFormat:@"%@°",dailyForecast.tmp.max];
    NSString *minTmp = [NSString stringWithFormat:@"%@°",dailyForecast.tmp.min];
    
    // 最高温度
    self.maxTmpLable.text = maxTmp;
    self.maxTmpLable.frame = dailyForecastCellViewFrame.maxTmpLableFrame;
    
    // 最低温度
    self.minTmpLable.text = minTmp;
    self.minTmpLable.frame = dailyForecastCellViewFrame.minTmpLableFrame;
    
    // 天气状况文字描述
    self.condTextLable.text = dailyForecast.cond.txt_d;
    self.condTextLable.frame = dailyForecastCellViewFrame.condTextLableFrame;
}


@end
