//
//  BaseViewController.m
//  YZWeather
//
//  Created by 杨舟 on 15/10/5.
//  Copyright © 2015年 Yang. All rights reserved.
//  导航控制器模板

#import "BaseViewController.h"
#import "ForecastViewController.h"
#import "DailyForecastViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  初始化导航控制器的时候设定好导航栏
 */
+ (void)initialize
{
    // 1.设置导航栏文字主题
    // 1.1获取导航栏实例
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 1.2导航栏主题字典
    NSMutableDictionary *navTitleAttr = [NSMutableDictionary dictionary];
    // 1.2.1导航栏标题字体颜色为黑色
    navTitleAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    // 1.2.2导航栏标题字体大小为20
    navTitleAttr[NSFontAttributeName] = navTitleFont;
    
    // 1.3设置导航栏主题
    [navBar setTitleTextAttributes:navTitleAttr];
    
    // 2.设置导航栏按钮文字主题
    // 2.1获取导航栏按钮实例
    UIBarButtonItem *navBtn = [UIBarButtonItem appearance];
    
    // 2.2导航栏按钮主题字典
    NSMutableDictionary *navBtnAttr = [NSMutableDictionary dictionary];
    // 2.2.1导航栏按钮字体颜色为黑色
    navBtnAttr[NSForegroundColorAttributeName] = [UIColor blackColor];
    // 2.2.2导航栏按钮字体大小为14
    navBtnAttr[NSFontAttributeName] = navItemFont;
    
    // 2.3设置导航栏按钮主题
    [navBtn setTitleTextAttributes:navBtnAttr forState:UIControlStateNormal];
}

/**
 *  在导航控制器切换界面的时候隐藏底部状态栏
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // 如果跳转的控制器是天气预报主界面控制器 状态栏颜色为白色
    if ([self.childViewControllers[0] isKindOfClass:[ForecastViewController class]]|[self.childViewControllers[0] isKindOfClass:[DailyForecastViewController class]]) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

@end
