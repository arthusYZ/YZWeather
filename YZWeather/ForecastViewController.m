//
//  ForecastViewController.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/9.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "ForecastViewController.h"
#import "ForecastFrame.h"
#import "DailyForecastViewController.h"
#import "ForecastRequest.h"
#import "TitleView.h"
#import "MyTitleView.h"
#import "VoiceButton.h"
#import "ShareButton.h"
#import "DKLiveBlurView.h"
#import "NowTableViewCell.h"
#import "DailyForecastTableViewCell.h"
#import "WeeklyForecastTableViewCell.h"
#import "SuggestionTableViewCell.h"
#import "CityManageViewController.h"
#import "BaseViewController.h"
#import "MJRefresh.h"
#import "ForecastCityCell.h"

#define Button_Width 50.f
#define Button_Space 10.f
#define YZCellID @"forecastcity"

@interface ForecastViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,weak ) UITableView *currentTableview;
/**
 *  天气预报背景界面
 */
@property (nonatomic ,weak ) DKLiveBlurView *forecastBackGroundView;

@property (nonatomic ,weak ) UICollectionView *collectionView;
/**
 *  城市按钮
 */
//@property (nonatomic ,weak ) TitleView *titleView;

@property (nonatomic ,weak ) MyTitleView *titleView;

@property (nonatomic ,strong ) NSMutableArray *forecastFrames;

@end

@implementation ForecastViewController

//- (NSMutableArray *)weatherDatas
//{
//    if (!_weatherDatas) {
//        _weatherDatas = [NSMutableArray array];
//    }
//    return _weatherDatas;
//}

- (NSMutableArray *)forecastFrames
{
    if (!_forecastFrames) {
        _forecastFrames = [NSMutableArray array];
    }
    return _forecastFrames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view = [[UIScrollView alloc] init];
    
    
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];

    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    // 设置天气预报界面背景
    [self setupForecastBackGroundView];
    
    
    [self setupForecastView];
    
    // 设置导航栏
    [self setupNavigationBar];
    
    // 设置天气信息
    [self setupForecast];
    
}

#pragma mark 初始化界面
/**
 *  设置天气信息
 */
- (void)setupForecast
{
    __weak typeof(self) weakself = self;
    [ForecastRequest homeWeatherDatasSuccess:^(NSMutableArray *weatherDatas) {
        WeatherData *weatherData = [weatherDatas firstObject];
        NSMutableArray *forecastFrames = [NSMutableArray array];
        for (WeatherData *weatherData in weatherDatas) {
            ForecastFrame *forecastFrame = [[ForecastFrame alloc] init];
            forecastFrame.weatherData = weatherData;
            [forecastFrames addObject:forecastFrame];
        }
        weakself.titleView.numberOfPages = weatherDatas.count;
        weakself.forecastFrames = forecastFrames;
        weakself.titleView.citynameOfCurrentPage = weatherData.basic.city;
        [weakself.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
/**
 *  设置导航栏
 */
- (void)setupNavigationBar
{
    // 设置导航栏颜色及背景图片
//    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage imageNamed:@"forecast_navigationbar_firstscreen"] stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5] forBarMetrics:UIBarMetricsDefault];
    MyTitleView *title = [[MyTitleView alloc] init];
    title.frame = CGRectMake(0, 0, 100, 40);
    title.numberOfPages = 1;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToCityManageView)];
    [title addGestureRecognizer:tap];
    self.titleView = title;
    self.navigationItem.titleView = title;    
    // 创建语音选择按钮
    UIBarButtonItem *voiceitem = [[UIBarButtonItem alloc] initWithCustomView:[[VoiceButton alloc] init]];
    self.navigationItem.leftBarButtonItem = voiceitem;
    
    // 创建分享按钮
    UIBarButtonItem *shareitem = [[UIBarButtonItem alloc] initWithCustomView:[[ShareButton alloc] init]];
    self.navigationItem.rightBarButtonItem = shareitem;
}
/**
 *  设置天气预报界面
 */
- (void)setupForecastBackGroundView
{
    DKLiveBlurView *forecastBackGroundView = [[DKLiveBlurView alloc] init];
    forecastBackGroundView.frame = [UIScreen mainScreen].bounds;
    forecastBackGroundView.image = [UIImage imageNamed:@"cloudy"];
    forecastBackGroundView.glassColor = RGBA(0, 0, 0, 1);
    forecastBackGroundView.isGlassEffectOn = YES;
    self.forecastBackGroundView = forecastBackGroundView;
    [self.view addSubview:forecastBackGroundView];
//    if (self.collectionView) {
//        [self.view insertSubview:self.collectionView aboveSubview:self.forecastBackGroundView];
//    }
}

- (void)setupForecastView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.itemSize = CGSizeMake(screenSize.width, screenSize.height - 64 - 49);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, screenSize.width, screenSize.height - 64 - 49) collectionViewLayout:flowLayout];
    [collectionView registerClass:[ForecastCityCell class] forCellWithReuseIdentifier:YZCellID];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    [self.collectionView reloadData];
}




#pragma mark 界面跳转

- (void)goToCityManageView
{
    
    CityManageViewController *vc = [[CityManageViewController alloc] init];
    __weak typeof(self) weakself = self;
    vc.dismissWithBtn = ^(UIButton *btn){
        [ForecastRequest homeWeatherDatasSuccess:^(NSMutableArray *weatherDatas) {            NSMutableArray *forecastFrames = [NSMutableArray array];
            for (WeatherData *weatherData in weatherDatas) {
                ForecastFrame *forecastFrame = [[ForecastFrame alloc] init];
                forecastFrame.weatherData = weatherData;
                [forecastFrames addObject:forecastFrame];
            }
            weakself.titleView.numberOfPages = weatherDatas.count;
            weakself.forecastFrames = forecastFrames;
            [weakself.collectionView reloadData];
        } failure:^(NSError *error) {
            
        }];
        if (!btn) {
            weakself.collectionView.contentOffset = CGPointMake(screenSize.width * btn.tag, 0);
        }
    };
    BaseViewController *nav = [[BaseViewController alloc] initWithRootViewController:vc];
    
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
    
}



#pragma mark tableview代理及数据源方法
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __block ForecastFrame *forecastFrame = _forecastFrames[tableView.tag];
    
    self.currentTableview = tableView;

    self.forecastBackGroundView.scrollView = tableView;
    NSInteger row = indexPath.row;
    if (row == 0) {
        NowTableViewCell *cell = [NowTableViewCell cellWithTableView:tableView];
        cell.nowFrame = forecastFrame.nowFrame;
        return cell;
    }else if (row == 1){
        DailyForecastTableViewCell *cell = [DailyForecastTableViewCell cellWithTableView:tableView];
        cell.dailyForecastFrame = forecastFrame.dailyForecastFrame;
        cell.chooseDay = ^(NSInteger day){
            DailyForecastViewController *vc = [[DailyForecastViewController alloc] init];
            vc.cityname = self.titleView.citynameOfCurrentPage;
            vc.backGroundImage = self.forecastBackGroundView.image;
            vc.defaultDay = day;
            NSMutableArray *dailyForecastArray = [NSMutableArray array];
            for (int i = 0; i < 6; i++) {
                DailyForecast *dailyForecast = forecastFrame.dailyForecastFrame.daily_forecast[i];
                [dailyForecastArray addObject:dailyForecast];
            }
            vc.dailyForecastsArray = dailyForecastArray;
            
            BaseViewController *nav = [[BaseViewController alloc] initWithRootViewController:vc];
            
            [self presentViewController:nav animated:YES completion:^{
                
            }];
        };
        return cell;
    }else if (row == 2){
        WeeklyForecastTableViewCell *cell = [WeeklyForecastTableViewCell cellWithTableView:tableView];
        cell.weeklyForecastFrame = forecastFrame.weeklyForecastFrame;
        __weak typeof(self) weakself = self;
        cell.dayClick = ^(NSInteger day){
            DailyForecastViewController *vc = [[DailyForecastViewController alloc] init];
            vc.cityname = forecastFrame.weatherData.basic.city;
            vc.backGroundImage = self.forecastBackGroundView.image;
            vc.defaultDay = day;
            NSMutableArray *dailyForecastArray = [NSMutableArray array];
            for (int i = 0; i < 6; i++) {
                DailyForecast *dailyForecast = forecastFrame.weatherData.daily_forecast[i];
                [dailyForecastArray addObject:dailyForecast];
            }
            vc.dailyForecastsArray = dailyForecastArray;
            
            BaseViewController *nav = [[BaseViewController alloc] initWithRootViewController:vc];
            
            [weakself presentViewController:nav animated:YES completion:^{
                
            }];
        };
        return cell;
    }
    SuggestionTableViewCell * cell = [SuggestionTableViewCell cellWithTableView:tableView];
    cell.suggestionFrame = forecastFrame.suggestionFrame;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForecastFrame *forecastFrame = _forecastFrames[0];
    NSInteger row = indexPath.row;
    if (row == 0) {
        return forecastFrame.nowFrame.cellHeight;
    }else if (row == 1){
        return forecastFrame.dailyForecastFrame.cellHeight;
    }else if (row == 2){
        return forecastFrame.weeklyForecastFrame.cellHeight;
    }
    return forecastFrame.suggestionFrame.cellHeight;
}


#pragma mark collectionview代理及数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.forecastFrames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ForecastCityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YZCellID forIndexPath:indexPath];
    [cell setTableViewDataSourceDelegate:self AndIndex:indexPath.item];
    
    __weak typeof(self) weakself = self;
    
    cell.tableviewOffset = self.currentTableview.contentOffset;

    cell.refresh = ^(NSInteger index){
        [ForecastRequest requestWithCityname:self.titleView.citynameOfCurrentPage success:^(WeatherData *weatherData) {
            ForecastFrame *forecastFrame = [[ForecastFrame alloc] init];
            forecastFrame.weatherData = weatherData;
            [weakself.forecastFrames replaceObjectAtIndex:index withObject:forecastFrame];
            [weakself.currentTableview.mj_header endRefreshing];
            [weakself.currentTableview reloadData];
        } failure:^(NSError *error) {
            
        }];

    };
    return cell;
}



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        NSInteger currentPage = (scrollView.contentOffset.x  + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
        self.titleView.numberOfCurrentPage = currentPage;
        ForecastFrame *frame = _forecastFrames[currentPage];
        if (![self.titleView.citynameOfCurrentPage isEqualToString:frame.weatherData.basic.city]) {
                self.titleView.citynameOfCurrentPage = frame.weatherData.basic.city;
        }
    }
}

@end
