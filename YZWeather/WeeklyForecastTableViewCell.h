//
//  WeeklyForecastTableViewCell.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeeklyForecastFrame.h"

typedef void (^ dayClick) (NSInteger day);

@interface WeeklyForecastTableViewCell : UITableViewCell

@property (nonatomic ,copy ) dayClick dayClick;

@property (nonatomic ,strong ) WeeklyForecastFrame *weeklyForecastFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
