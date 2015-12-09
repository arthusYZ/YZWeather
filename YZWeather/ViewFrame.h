//
//  ViewFrame.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/18.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewFrame : NSObject

@property (nonatomic ,assign ) CGRect imageViewFrame;

@property (nonatomic ,assign ) CGRect brfLableFrame;

@property (nonatomic ,assign ) CGRect viewFrame;

@property (nonatomic ,assign ) CGFloat viewHeight;

@property (nonatomic ,copy ) NSString *brf;

@property (nonatomic ,copy ) NSString *text;

@end
