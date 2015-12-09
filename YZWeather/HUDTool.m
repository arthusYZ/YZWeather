//
//  HUDTool.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/30.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "HUDTool.h"
#import "MBProgressHUD.h"

@interface HUDTool ()<MBProgressHUDDelegate>

{
    MBProgressHUD   *_hud;
}

@end

@implementation HUDTool

- (instancetype)initWithView:(UIView *)view
{
    if (view == nil) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _hud = [[MBProgressHUD alloc] initWithView:view];
        _hud.delegate                  = self;                       // 设置代理
        _hud.animationType             = MBProgressHUDAnimationZoom; // 默认动画样式
        _hud.removeFromSuperViewOnHide = YES;                        // 该视图隐藏后则自动从父视图移除掉
        
        [view addSubview:_hud];
    }
    return self;
}

- (void)hide:(BOOL)hide afterDelay:(NSTimeInterval)delay
{
    [_hud hide:hide afterDelay:delay];
}

- (void)hide
{
    [_hud hide:YES];
}

- (void)show:(BOOL)show
{
    // 根据属性判断是否要显示文本
    if (_text != nil && _text.length != 0) {
        _hud.labelText = _text;
    }
    
    // 设置文本字体
    if (_textFont) {
        _hud.labelFont = _textFont;
    }
    
    // 如果设置这个属性,则只显示文本
    if (_showTextOnly == YES && _text != nil && _text.length != 0) {
        _hud.mode = MBProgressHUDModeText;
    }
    
    // 设置背景色
    if (_backgroundColor) {
        _hud.color = _backgroundColor;
    }
    
    // 文本颜色
    if (_labelColor) {
        _hud.labelColor = _labelColor;
    }
    
    // 设置圆角
    if (_cornerRadius) {
        _hud.cornerRadius = _cornerRadius;
    }
    
    // 设置透明度
    if (_opacity) {
        _hud.opacity = _opacity;
    }
    
    // 自定义view
    if (_customView) {
        _hud.mode = MBProgressHUDModeCustomView;
        _hud.customView = _customView;
    }
    
    // 边缘留白
    if (_margin > 0) {
        _hud.margin = _margin;
    }
    
    [_hud show:show];
}

#pragma mark - HUD代理方法
- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [_hud removeFromSuperview];
    _hud = nil;
}

#pragma mark - 重写setter方法
@synthesize animationStyle = _animationStyle;
- (void)setAnimationStyle:(HUDAnimationType)animationStyle
{
    _animationStyle    = animationStyle;
    _hud.animationType = (MBProgressHUDAnimation)_animationStyle;
}
- (HUDAnimationType)animationStyle
{
    return _animationStyle;
}

#pragma mark - 便利的方法
+ (void)showTextOnly:(NSString *)text
     configParameter:(ConfigShowHUDBlock)config
            duration:(NSTimeInterval)sec
              inView:(UIView *)view
{
    HUDTool *hud     = [[HUDTool alloc] initWithView:view];
    hud.text         = text;
    hud.showTextOnly = YES;
    hud.margin       = 10.f;
    
    // 配置额外的参数
    config(hud);
    
    // 显示
    [hud show:YES];
    
    // 延迟sec后消失
    [hud hide:YES afterDelay:sec];
}

+ (void)showText:(NSString *)text
 configParameter:(ConfigShowHUDBlock)config
        duration:(NSTimeInterval)sec
          inView:(UIView *)view
{
    HUDTool *hud     = [[HUDTool alloc] initWithView:view];
    hud.text         = text;
    hud.margin       = 10.f;
    
    // 配置额外的参数
    config(hud);
    
    // 显示
    [hud show:YES];
    
    // 延迟sec后消失
    [hud hide:YES afterDelay:sec];
}


+ (void)showCustomView:(ConfigShowHUDCustomViewBlock)viewBlock
       configParameter:(ConfigShowHUDBlock)config
              duration:(NSTimeInterval)sec
                inView:(UIView *)view
{
    HUDTool *hud     = [[HUDTool alloc] initWithView:view];
    hud.margin       = 10.f;
    
    // 配置额外的参数
    config(hud);
    
    // 自定义View
    hud.customView   = viewBlock();
    
    // 显示
    [hud show:YES];
    
    [hud hide:YES afterDelay:sec];
}


+ (instancetype)showTextOnly:(NSString *)text
             configParameter:(ConfigShowHUDBlock)config
                      inView:(UIView *)view
{
    HUDTool *hud     = [[HUDTool alloc] initWithView:view];
    hud.text         = text;
    hud.showTextOnly = YES;
    hud.margin       = 10.f;
    
    // 配置额外的参数
    config(hud);
    
    // 显示
    [hud show:YES];
    
    return hud;
}

+ (instancetype)showText:(NSString *)text
         configParameter:(ConfigShowHUDBlock)config
                  inView:(UIView *)view
{
    HUDTool *hud     = [[HUDTool alloc] initWithView:view];
    hud.text         = text;
    hud.margin       = 10.f;
    
    // 配置额外的参数
    config(hud);
    
    // 显示
    [hud show:YES];
    
    return hud;
}

+ (instancetype)showCustomView:(ConfigShowHUDCustomViewBlock)viewBlock
               configParameter:(ConfigShowHUDBlock)config
                        inView:(UIView *)view
{
    HUDTool *hud     = [[HUDTool alloc] initWithView:view];
    hud.margin       = 10.f;
    
    // 配置额外的参数
    config(hud);
    
    // 自定义View
    hud.customView   = viewBlock();
    
    // 显示
    [hud show:YES];
    
    return hud;
}


@end
