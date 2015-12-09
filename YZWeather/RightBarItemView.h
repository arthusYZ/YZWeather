//
//  RightBarItemView.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

typedef void(^edit) (void);
typedef void(^confirm) (void);
typedef void(^reload) (void);

#import <UIKit/UIKit.h>

@interface RightBarItemView : UIView

@property (nonatomic ,copy ) edit edit;

@property (nonatomic ,copy ) confirm confirm;

@property (nonatomic ,copy ) reload refresh;

- (void)longPressed;

@end
