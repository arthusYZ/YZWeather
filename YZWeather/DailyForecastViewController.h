//
//  DailyForecastViewController.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyForecastViewController : UIViewController

@property (nonatomic ,strong ) NSArray *dailyForecastsArray;

@property (nonatomic ,strong ) UIImage *backGroundImage;

@property (nonatomic ,copy ) NSString *cityname;

@property (nonatomic ,assign ) NSInteger defaultDay;

@end
