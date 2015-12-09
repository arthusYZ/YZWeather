//
//  DailyForecastViewController.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/21.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyForecastViewController.h"
#import "UIImageView+LBBlurredImage.h"
#import "TitleView.h"
#import "ShareButton.h"
#import "WeatherView.h"

@interface DailyForecastViewController ()

@end

@implementation DailyForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self setupMainView];
    [self setupNav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNav
{
    // 设置导航栏颜色及背景图片
//    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage imageNamed:@"forecast_navigationbar_firstscreen"] stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5] forBarMetrics:UIBarMetricsDefault];
    
    // 创建并设置标题
    TitleView *title = [[TitleView alloc] initWithStyle:nor];
    title.cityname = _cityname;
    CGSize titleSize = title.selfSize;
    title.frame = CGRectMake(0, 0, titleSize.width, titleSize.height);
    self.navigationItem.titleView = title;
    
    // 创建语音选择按钮
    UIButton *exitButton = [[UIButton alloc] init];
    [exitButton setImage:[UIImage imageNamed:@"cancel_white"] forState:UIControlStateNormal];
    [exitButton setImage:[UIImage imageNamed:@"cancel_hilight"] forState:UIControlStateHighlighted];
    [exitButton addTarget:self action:@selector(exitDailyForecast) forControlEvents:UIControlEventTouchUpInside];
    exitButton.frame = CGRectMake(0, 0, 25, 25);
    UIBarButtonItem *exititem = [[UIBarButtonItem alloc] initWithCustomView:exitButton];
    self.navigationItem.leftBarButtonItem = exititem;
    
    // 创建分享按钮
    UIBarButtonItem *shareitem = [[UIBarButtonItem alloc] initWithCustomView:[[ShareButton alloc] init]];
    self.navigationItem.rightBarButtonItem = shareitem;
}

- (void)setupMainView
{
    UIImageView *backGroundView = [[UIImageView alloc] init];
    [backGroundView setImageToBlur:_backGroundImage blurRadius:kLBBlurredImageDefaultBlurRadius completionBlock:^{
        
    }];
    backGroundView.frame = [UIScreen mainScreen].bounds;
    NSInteger index = _dailyForecastsArray.count;
    
    WeatherView *weatherView = [[WeatherView alloc] initWithDailyForecasts:_dailyForecastsArray];
    weatherView.frame = [UIScreen mainScreen].bounds;
    weatherView.contentSize = CGSizeMake(screenSize.width * index, 0);
    weatherView.pagingEnabled = YES;
    [weatherView setContentOffset:CGPointMake(screenSize.width * _defaultDay, 0)];
    [self.view addSubview:backGroundView];
    [self.view addSubview:weatherView];
}

- (void)exitDailyForecast
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
