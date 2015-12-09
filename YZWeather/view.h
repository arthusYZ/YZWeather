//
//  view.h
//  YZWeather
//
//  Created by 杨舟 on 15/12/3.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface view : UIView

@property (nonatomic ,copy ) NSString *goods;

+ (instancetype)viewWithGoods:(NSString *)goods;

- (instancetype)initWithGoods:(NSString *)goods;

@end
