//
//  MainViewController.m
//  YZWeather
//
//  Created by 杨舟 on 15/10/5.
//  Copyright © 2015年 Yang. All rights reserved.
//  主界面

#import "MainViewController.h"
#import "BaseViewController.h"
#import "TabBar.h"
#import "LifeController.h"
#import "LiveController.h"
#import "MeController.h"
#import "ForecastViewController.h"

@interface MainViewController ()<TabBarDelegate>
/**
 *  自定义tabbar
 */
@property (nonatomic , weak) TabBar *myTabbar;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 设置自定义tabbar
    [self setupTabbar];
    
    // 设置子控制器
    [self setupChildViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 去除自带tabbarbutton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  创建自定义tabbar
 */
- (void)setupTabbar
{
    // 创建自定义tabbar
    TabBar *mytabbar = [[TabBar alloc] initWithFrame:self.tabBar.bounds];
    // 添加到自带tabbar里去
    [self.tabBar addSubview:mytabbar];
    // 设置代理
    mytabbar.delegate = self;
    
    self.myTabbar = mytabbar;
    
}

/**
 *  实现代理方法
 */
- (void)tabbar:(TabBar *)tabbar clickedFrom:(int)from To:(int)to
{
    // 点击哪个按钮就去哪个界面
    self.selectedIndex = to;
}

/**
 *  添加子控制器
 */
-(void)setupChildViewController
{
    // 添加天气预报界面
    ForecastViewController *forecastVc = [[ForecastViewController alloc] init];
    [self setChildVc:forecastVc cnTitle:@"预报" enTitle:@"Forecast"];
    
    // 添加生活界面
    LifeController *lifeVc = [[LifeController alloc] init];
    [self setChildVc:lifeVc cnTitle:@"生活" enTitle:@"Life"];
    
    // 添加实景界面
    LiveController *liveVc = [[LiveController alloc] init];
    [self setChildVc:liveVc cnTitle:@"实景" enTitle:@"Live"];
    
    // 添加我界面
    MeController *meVc = [[MeController alloc] init];
    [self setChildVc:meVc cnTitle:@"我" enTitle:@"Me"];
}

/**
 *  设置子控制器
 */
- (void)setChildVc:(UIViewController *)childVc cnTitle:(NSString *)cnTitle enTitle:(NSString *)enTitle
{
    childVc.title = cnTitle;
    // 通过中文标题及英文标题创建自定义tabbar的按钮
    [self.myTabbar addButtonWithCnTitle:cnTitle EnTitle:enTitle];
    // 包装导航栏
    BaseViewController  *nav = [[BaseViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}

@end
