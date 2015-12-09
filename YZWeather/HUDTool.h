//
//  HUDTool.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/30.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HUDTool;
typedef void (^ConfigShowHUDBlock)(HUDTool *config);
typedef UIView *(^ConfigShowHUDCustomViewBlock)();

// 定义枚举值
typedef enum {
    Fade    ,
    Zoom    ,
    ZoomOut = Zoom,
    ZoomIn  ,
} HUDAnimationType;

@interface HUDTool : NSObject


// 动画效果
@property (nonatomic, assign) HUDAnimationType   animationStyle;  // 动画样式

// 文本加菊花
@property (nonatomic, strong) NSString          *text;            // 文本
@property (nonatomic, strong) UIFont            *textFont;        // 文本字体

// 自定义view
@property (nonatomic, strong) UIView            *customView;      // 自定义view  37x37尺寸

// 只显示文本的相关设置
@property (nonatomic, assign) BOOL               showTextOnly;    // 只显示文本

// 边缘留白
@property (nonatomic, assign) float              margin;          // 边缘留白

// 颜色设置(设置了颜色之后,透明度就会失效)
@property (nonatomic, strong) UIColor           *backgroundColor; // 背景颜色
@property (nonatomic, strong) UIColor           *labelColor;      // 文本颜色

// 透明度
@property (nonatomic, assign) float              opacity;         // 透明度

// 圆角
@property (nonatomic, assign) float              cornerRadius;    // 圆角

// 仅仅显示文本并持续几秒的方法
/* - 使用示例 -
 [ShowHUD showTextOnly:@"请稍后,显示不了..."
 configParameter:^(ShowHUD *config) {
 config.margin          = 10.f;    // 边缘留白
 config.opacity         = 0.7f;    // 设定透明度
 config.cornerRadius    = 2.f;     // 设定圆角
 } duration:3 inView:self.view];
 */
+ (void)showTextOnly:(NSString *)text
     configParameter:(ConfigShowHUDBlock)config
            duration:(NSTimeInterval)sec
              inView:(UIView *)view;

// 显示文本与菊花并持续几秒的方法(文本为nil时只显示菊花)
/* - 使用示例 -
 [ShowHUD showText:@"请稍后,显示不了..."
 configParameter:^(ShowHUD *config) {
 config.margin          = 10.f;    // 边缘留白
 config.opacity         = 0.7f;    // 设定透明度
 config.cornerRadius    = 2.f;     // 设定圆角
 } duration:3 inView:self.view];
 */
+ (void)showText:(NSString *)text
 configParameter:(ConfigShowHUDBlock)config
        duration:(NSTimeInterval)sec
          inView:(UIView *)view;

// 加载自定义view并持续几秒的方法
/* - 使用示例 -
 [ShowHUD showText:@"请稍后,显示不了..."
 configParameter:^(ShowHUD *config) {
 config.margin          = 10.f;    // 边缘留白
 config.opacity         = 0.7f;    // 设定透明度
 config.cornerRadius    = 2.f;     // 设定圆角
 } duration:3 inView:self.view];
 */
+ (void)showCustomView:(ConfigShowHUDCustomViewBlock)viewBlock
       configParameter:(ConfigShowHUDBlock)config
              duration:(NSTimeInterval)sec
                inView:(UIView *)view;




+ (instancetype)showTextOnly:(NSString *)text
             configParameter:(ConfigShowHUDBlock)config
                      inView:(UIView *)view;
+ (instancetype)showText:(NSString *)text
         configParameter:(ConfigShowHUDBlock)config
                  inView:(UIView *)view;
+ (instancetype)showCustomView:(ConfigShowHUDCustomViewBlock)viewBlock
               configParameter:(ConfigShowHUDBlock)config
                        inView:(UIView *)view;
- (void)hide;

@end
