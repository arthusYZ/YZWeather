//
//  CityManageViewController.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/23.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CityManageViewController.h"
#import "ForecastViewController.h"
#import "BaseViewController.h"
#import "CityCellButton.h"
#import "WeatherData.h"
#import "UIImage+YZ.h"
#import "DeleteAlertView.h"
#import "RightBarItemView.h"
#import "ChooseCityViewController.h"
#import "ForecastRequest.h"

@interface CityManageViewController ()

@property (nonatomic ,strong ) NSMutableArray *cityCellsArray;

@property (nonatomic ,weak ) UIButton *addCityBtn;

@property (nonatomic ,weak ) RightBarItemView *rightView;



@property (nonatomic ,strong ) NSMutableArray *weatherDataArray;

@end

@implementation CityManageViewController

- (NSMutableArray *)weatherDataArray
{
    if (!_weatherDataArray) {
        _weatherDataArray = [NSMutableArray array];
    }
    return _weatherDataArray;
}

- (NSMutableArray *)cityCellsArray
{
    if (!_cityCellsArray) {
        _cityCellsArray = [NSMutableArray array];
    }
    return _cityCellsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGBA(237, 237, 237, 1);
    
    __weak typeof(self) weakself = self;
    [ForecastRequest homeWeatherDatasSuccess:^(NSMutableArray *weatherDatas) {
        weakself.weatherDataArray = weatherDatas;
    } failure:^(NSError *error) {
        
    }];
    
    
    [self setupNavgationBar];
    
    [self setupCityCells];
    
    _pop = ^(NSString *cityname){
        NSInteger index = weakself.weatherDataArray.count;
        CGFloat cellW = (screenSize.width - 4 * cityCellMargin) / 3;
        CGFloat cellH = cellW * 75 / 49;
        int maxColumn = 3;
        
        
        NSInteger row = index / maxColumn;
        NSInteger column = index % maxColumn;
        
        __block CityCellButton *cityCell = [[CityCellButton alloc] initWithCityname:cityname];
        cityCell.tag = index;
        cityCell.deleteButtonHidden = YES;
        [cityCell addTarget:weakself action:@selector(exitCityManageWithBtn:) forControlEvents:UIControlEventTouchUpInside];
        [ForecastRequest requestWithCityname:cityname success:^(WeatherData *weatherData) {
            cityCell.today = weatherData.daily_forecast[0];
            [weakself.weatherDataArray addObject:weatherData];
        } failure:^(NSError *error) {
            
        }];
        cityCell.deleteCity = ^(NSInteger tag){
            if (_cityCellsArray.count > 1) {
                WeatherData *weatherData = weakself.weatherDataArray[tag];
                [ForecastRequest deleteWithCityname:weatherData.basic.city];
                [weakself.weatherDataArray removeObjectAtIndex:tag];
                [weakself.cityCellsArray[tag] removeFromSuperview];
                [weakself.cityCellsArray removeObjectAtIndex:tag];
                NSInteger index = weakself.weatherDataArray.count;
                int maxColumn = 3;
                for (int i = 0; i < index; i++) {
                    CityCellButton *cell = weakself.cityCellsArray[i];
                    
                    int row = i / maxColumn;
                    int column = i % maxColumn;
                    
                    CGFloat cellX = cityCellMargin * (column + 1) + cellW * column;
                    CGFloat cellY = 64 + cityCellMargin * (row + 1) + cellH * row;
                    
                    CGRect cellFrame = cell.frame;
                    cellFrame.origin = CGPointMake(cellX, cellY);
                    cell.frame = cellFrame;
                    cell.tag = i;
                }
                
                int row = (int)index / maxColumn;
                int column = index % maxColumn;
                CGFloat addCityBtnX = cityCellMargin * (column + 1) + cellW * column;
                CGFloat addCityBtnY = 64 + cityCellMargin * (row + 1) + cellH * row;
                
                CGRect addCityBtnFrame = weakself.addCityBtn.frame;
                addCityBtnFrame.origin = CGPointMake(addCityBtnX, addCityBtnY);
                weakself.addCityBtn.frame = addCityBtnFrame;
            }else
            {
                DeleteAlertView *alert = [[DeleteAlertView alloc] initWithView:weakself.view];
                
                [alert show];
            }
        };
        
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:weakself action:@selector(cityCellLongPressed:)];
        longPress.minimumPressDuration = 1.5f;
        [cityCell addGestureRecognizer:longPress];
        
        CGFloat CellX = cityCellMargin * (column + 1) + cellW * column;
        CGFloat cellY = 64 + cityCellMargin * (row + 1) + cellH * row;
        cityCell.frame = CGRectMake(CellX , cellY , cellW, cellH);
        [weakself.view addSubview:cityCell];
        [weakself.cityCellsArray addObject:cityCell];
        
        if (!(index == 8)) {
            int row = (int)(index + 1) / maxColumn;
            int column = (index + 1) % maxColumn;
            
            CGFloat addCityBtnX = cityCellMargin * (column + 1) + cellW * column;
            CGFloat addCityBtnY = 64 + cityCellMargin * (row + 1) + cellH * row;
            
            
            weakself.addCityBtn.frame = CGRectMake(addCityBtnX, addCityBtnY, cellW, cellH);
            weakself.addCityBtn.hidden = NO;
        }else{
            weakself.addCityBtn.hidden = YES;
        }
    };

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 初始化界面
- (void)setupNavgationBar
{
    self.title = @"城市管理";
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitBtn setBackgroundImage:[UIImage imageNamed:@"cancel_normal"] forState:UIControlStateNormal];
    [exitBtn setBackgroundImage:[UIImage imageNamed:@"cancel_hilight"] forState:UIControlStateHighlighted];
    [exitBtn addTarget:self action:@selector(exitCityManage) forControlEvents:UIControlEventTouchUpInside];
    exitBtn.frame = CGRectMake(0, 0, 25, 25);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:exitBtn];
    
    
    __weak typeof(self) weakself = self;
    RightBarItemView *rightView = [[RightBarItemView alloc] init];
    
    rightView.edit = ^(void){
        [weakself cityCellLongPressed:nil];
    };
    
    rightView.confirm = ^(void){
        NSArray *cellArray = weakself.cityCellsArray;
        if (cellArray.count < 9) {
            weakself.addCityBtn.hidden = NO;
        }
        for (CityCellButton *cell in cellArray) {
            cell.deleteButtonHidden = YES;
        }
    };
    
    rightView.refresh = ^(void){
        NSInteger index = weakself.cityCellsArray.count;
        for (int i = 0; i < index; i++) {
            WeatherData *weatherData = weakself.weatherDataArray[i];
            __block CityCellButton *cell = weakself.cityCellsArray[i];
            [ForecastRequest requestWithCityname:weatherData.basic.city success:^(WeatherData *weatherData) {
                [weakself.weatherDataArray replaceObjectAtIndex:i withObject:weatherData];
                cell.today = weatherData.daily_forecast[0];
            } failure:^(NSError *error) {
                
            }];
        }
    };
    
    rightView.frame = CGRectMake(0, 0, 70, 25);
    self.rightView = rightView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];;
}

- (void)setupCityCells
{
    NSInteger index = _weatherDataArray.count;
    
    WeatherData *weatherData;
    
    CGFloat cellW = (screenSize.width - 4 * cityCellMargin) / 3;
    CGFloat cellH = cellW * 75 / 49;
    int maxColumn = 3;
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        cellH = cellW * 127 / 98;
    }
    for (int i = 0;  i <index; i++) {
        int row = i / maxColumn;
        int column = i % maxColumn;
        weatherData = _weatherDataArray[i];
        CityCellButton *cityCell = [[CityCellButton alloc] initWithCityname:weatherData.basic.city];
        
        [cityCell addTarget:self action:@selector(exitCityManageWithBtn:) forControlEvents:UIControlEventTouchUpInside];
        cityCell.today = weatherData.daily_forecast[0];
        
        cityCell.tag = i;
        cityCell.deleteButtonHidden = YES;
        
        __weak typeof(self) weakself = self;
        cityCell.deleteCity = ^(NSInteger tag){
            if (_cityCellsArray.count > 1) {
                WeatherData *weatherData = weakself.weatherDataArray[tag];
                [ForecastRequest deleteWithCityname:weatherData.basic.city];
                
                [weakself.weatherDataArray removeObjectAtIndex:tag];
                [weakself.cityCellsArray[tag] removeFromSuperview];
                [weakself.cityCellsArray removeObjectAtIndex:tag];
                NSInteger index = weakself.weatherDataArray.count;
                int maxColumn = 3;
                for (int i = 0; i < index; i++) {
                    CityCellButton *cell = weakself.cityCellsArray[i];
                    
                    int row = i / maxColumn;
                    int column = i % maxColumn;
                    
                    CGFloat cellX = cityCellMargin * (column + 1) + cellW * column;
                    CGFloat cellY = 64 + cityCellMargin * (row + 1) + cellH * row;
                    
                    CGRect cellFrame = cell.frame;
                    cellFrame.origin = CGPointMake(cellX, cellY);
                    cell.frame = cellFrame;
                    cell.tag = i;
                }
                
                int row = (int)index / maxColumn;
                int column = index % maxColumn;
                CGFloat addCityBtnX = cityCellMargin * (column + 1) + cellW * column;
                CGFloat addCityBtnY = 64 + cityCellMargin * (row + 1) + cellH * row;
                
                CGRect addCityBtnFrame = weakself.addCityBtn.frame;
                addCityBtnFrame.origin = CGPointMake(addCityBtnX, addCityBtnY);
                weakself.addCityBtn.frame = addCityBtnFrame;
            }else
            {
                DeleteAlertView *alert = [[DeleteAlertView alloc] initWithView:self.view];
                
                [alert show];
            }
        };
        
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cityCellLongPressed:)];
        longPress.minimumPressDuration = 1.5f;
        [cityCell addGestureRecognizer:longPress];
        
        CGFloat cellX = cityCellMargin * (column + 1) + cellW * column;
        CGFloat cellY = 64 + cityCellMargin * (row + 1) + cellH * row;
        cityCell.frame = CGRectMake(cellX , cellY , cellW, cellH);
        [self.view addSubview:cityCell];
        [self.cityCellsArray addObject:cityCell];
    }
    
    
    
    
        int row = (int)index / maxColumn;
        int column = index % maxColumn;
        UIButton *addCityBtn = [[UIButton alloc] init];
        UIImage *addCityBtnNormalImage = [UIImage imageNamed:@"citymanagement_board_add568h"];
        UIImage *addCityBtnPressedImage = [UIImage imageNamed:@"citymanagement_board_pressed_add568h"];
        if ([UIScreen mainScreen].bounds.size.height == 480) {
            addCityBtnNormalImage = [UIImage imageNamed:@"citymanagement_board_add"];
            addCityBtnNormalImage = [UIImage imageNamed:@"citymanagement_board_add_pressed"];
        }
        
        
        [addCityBtn setBackgroundImage:addCityBtnNormalImage forState:UIControlStateNormal];
        [addCityBtn setBackgroundImage:addCityBtnPressedImage forState:UIControlStateHighlighted];
        
        [addCityBtn addTarget:self action:@selector(pushToCitySelecView) forControlEvents:UIControlEventTouchUpInside];
        CGFloat addCityBtnX = cityCellMargin * (column + 1) + cellW * column;
        CGFloat addCityBtnY = 64 + cityCellMargin * (row + 1) + cellH * row;
        
        
        addCityBtn.frame = CGRectMake(addCityBtnX, addCityBtnY, cellW, cellH);
        [self.view addSubview:addCityBtn];
        self.addCityBtn = addCityBtn;
    if (!(index == 9)) {
        self.addCityBtn.hidden = NO;
    }else{
        self.addCityBtn.hidden = YES;
    }
}



#pragma mark 界面跳转

- (void)exitCityManageWithBtn:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:^{
        _dismissWithBtn(btn);
    }];
}

- (void)exitCityManage
{
    [self dismissViewControllerAnimated:YES completion:^{
        _dismissWithBtn(nil);
    }];
}



- (void)pushToCitySelecView
{
    ChooseCityViewController *vc = [[ChooseCityViewController alloc] init];
//    __weak typeof(self) weakself = self;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)cityCellLongPressed:(UILongPressGestureRecognizer *)longPress
{
    
    
    [_rightView longPressed];
    
    
    if (_addCityBtn) {
        self.addCityBtn.hidden = YES;
    }
    for (CityCellButton *cell in _cityCellsArray) {
        cell.deleteButtonHidden = NO;
    }
}

@end
