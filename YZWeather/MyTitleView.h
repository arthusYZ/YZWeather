//
//  MyTitleView.h
//  YZWeather
//
//  Created by 杨舟 on 15/12/2.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTitleView : UIView

@property (nonatomic ,assign ) NSInteger numberOfPages;

@property (nonatomic ,assign ) NSInteger numberOfCurrentPage;

@property (nonatomic ,copy ) NSString *citynameOfCurrentPage;

@end
