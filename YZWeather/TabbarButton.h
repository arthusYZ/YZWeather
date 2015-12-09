//
//  TabbarButton.h
//  YZWeather
//
//  Created by 杨舟 on 15/10/5.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarButton : UIButton

/**
 *  自定义tabbar按钮标题文字（中文）
 */
@property (nonatomic ,copy ) NSString *cnTitle;
/**
 *  自定义tabbar按钮标题文字（英文）
 */
@property (nonatomic ,copy ) NSString *enTitle;


@end
