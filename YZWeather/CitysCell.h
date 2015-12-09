//
//  CitysCell.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/26.
//  Copyright © 2015年 Yang. All rights reserved.
//


#import <UIKit/UIKit.h>


typedef void(^CityBtnPressed)(NSString *cityName);

typedef void(^MoreBtnPressed)(NSString *cellTtle);

@interface CitysCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic ,copy ) NSString *titleText;

@property (nonatomic ,strong ) NSArray *hotCityArray;

@property (nonatomic ,copy ) CityBtnPressed cityBtnPressed;

@property (nonatomic ,copy ) MoreBtnPressed moreBtnPressed;

@end
