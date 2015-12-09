//
//  TabBar.h
//  YZWeather
//
//  Created by 杨舟 on 15/10/5.
//  Copyright © 2015年 Yang. All rights reserved.
//  自定义tabbar

#import <UIKit/UIKit.h>

@class TabBar;
@protocol TabBarDelegate <NSObject>

- (void)tabbar:(TabBar *)tabbar clickedFrom:(int)from To:(int)to;

@end

@interface TabBar : UIView
/**
 *  传入中英文标题创建按钮
 *
 *  @param cnTitle 中文标题
 *  @param enTitle 英文标题
 */
-(void)addButtonWithCnTitle:(NSString *)cnTitle EnTitle:(NSString *)enTitle;
/**
 *  代理属性
 */
@property (nonatomic ,weak ) id<TabBarDelegate> delegate;

@end
