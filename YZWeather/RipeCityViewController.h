//
//  RipeCityViewController.h
//  YZWeather
//
//  Created by 杨舟 on 15/12/1.
//  Copyright © 2015年 Yang. All rights reserved.
//

typedef enum {citylist ,citydetail } viewtype;
typedef enum {inland ,foreign } country;


#import <UIKit/UIKit.h>

@interface RipeCityViewController : UITableViewController

@property (nonatomic ,assign ) viewtype viewtype;

@property (nonatomic ,assign ) country country;

@end
