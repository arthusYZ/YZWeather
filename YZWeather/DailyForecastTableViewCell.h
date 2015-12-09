//
//  DailyForecastTableViewCell.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyForecast.h"
#import "DailyForecastFrame.h"

typedef void(^chooseDay)(NSInteger day);

@interface DailyForecastTableViewCell : UITableViewCell

@property (nonatomic ,copy ) chooseDay chooseDay;
/**
 *  每周天气预报数组
 */
@property (nonatomic ,strong ) DailyForecastFrame *dailyForecastFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
