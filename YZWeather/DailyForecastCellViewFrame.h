//
//  DailyForecastCellViewFrame.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DailyForecast.h"

@interface DailyForecastCellViewFrame : NSObject
/**
 *  按钮高度
 */
@property (nonatomic ,assign ) CGFloat dailyForecastCellViewHeight;
/**
 *  日期（星期几）标签
 */
@property (nonatomic ,assign ) CGRect dayLableFrame;
/**
 *  天气状况图片
 */
@property (nonatomic ,assign ) CGRect condImageViewFrame;
/**
 *  最高温度标签
 */
@property (nonatomic ,assign ) CGRect maxTmpLableFrame;
/**
 *  最低温度标签
 */
@property (nonatomic ,assign ) CGRect minTmpLableFrame;
/**
 *  天气状况文字描述标签
 */
@property (nonatomic ,assign ) CGRect condTextLableFrame;

@property (nonatomic ,assign ) CGRect cellFrame;
/**
 *  每日天气数据
 */
@property (nonatomic ,strong ) DailyForecast *dailyForecast;

@end
