//
//  CondView.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {day,night} timeOfDay;

@interface CondView : UIView

- (instancetype)initWithStyle:(timeOfDay)timeOfDay withCond:(NSString *)cond withTmp:(NSString *)tmp;

@end
