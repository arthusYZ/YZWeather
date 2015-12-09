//
//  NowFrame.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WeatherData.h"

@interface NowFrame : NSObject

@property (nonatomic ,strong ) WeatherData *weatherData;
/**
 *  更新时间标签frame
 */
@property (nonatomic ,assign )  CGRect updateLableFrame;
/**
 *  温度frame
 */
@property (nonatomic ,assign ) CGRect tmpFrame;
/**
 *
 */
@property (nonatomic ,assign ) CGRect tmpCircleFrame;
/**
 *  天气状况frame
 */
@property (nonatomic ,assign ) CGRect condFrame;
/**
 *  体感温度frame
 */
@property (nonatomic ,assign ) CGRect flFrame;
/**
 *  风力情况frame
 */
@property (nonatomic ,assign ) CGRect windhumFrame;
/**
 *  Aqi按钮frame
 */
@property (nonatomic ,assign ) CGRect aqiBtnFrame;
/**
 *  cell高度
 */
@property (nonatomic ,assign ) CGFloat cellHeight;

@end
