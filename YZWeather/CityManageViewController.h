//
//  CityManageViewController.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/23.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^pop)(NSString *cityname);

@interface CityManageViewController : UIViewController

@property (nonatomic ,copy ) pop pop;

@property (nonatomic ,copy ) void (^dismissWithBtn)(UIButton *);

@end
