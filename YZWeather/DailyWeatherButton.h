//
//  DailyWeatherButton.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/13.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyForecastButtonFrame.h"

@interface DailyWeatherButton : UIButton
/**
 *  每日天气预报模型
 */
@property (nonatomic ,strong ) DailyForecastButtonFrame *dailyForecastButtonFrame;
/**
 *  按钮高度
 */
@property (nonatomic ,assign ) CGFloat buttonH;
@end
