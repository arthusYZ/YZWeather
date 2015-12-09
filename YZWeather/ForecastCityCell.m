//
//  ForecastCityCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/12/2.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "ForecastCityCell.h"
#import "MJRefresh.h"

@interface ForecastCityCell ()

@property (nonatomic ,weak ) UITableView *forecastView;

@end

@implementation ForecastCityCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
        UITableView *forecastView = [[UITableView alloc] init];
        forecastView.frame = CGRectMake(0, 0, screenSize.width, screenSize.height - 64 - 49);
        forecastView.backgroundColor = [UIColor clearColor];
        forecastView.separatorStyle = NO;
        forecastView.showsVerticalScrollIndicator = NO;
        
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//            [weakself refreshWeatherWithView:weakself.forecastView.mj_header];
            _refresh(forecastView.tag);
        }];
        // 设置文字
        [header setTitle:@"下拉更新天气数据" forState:MJRefreshStateIdle];
        [header setTitle:@"松开以进行更新" forState:MJRefreshStatePulling];
        [header setTitle:@"更新中 ..." forState:MJRefreshStateRefreshing];
        
        // 设置字体
        header.stateLabel.font = timefont;
        header.lastUpdatedTimeLabel.font = timefont;
        
        // 设置颜色
        header.stateLabel.textColor = white;
        header.lastUpdatedTimeLabel.textColor = white;
        
        forecastView.mj_header = header;
        [self.contentView addSubview:forecastView];
        self.forecastView = forecastView;
    }
    return self;
}

- (void)setTableViewDataSourceDelegate:(id<UITableViewDataSource,UITableViewDelegate>)delegate AndIndex:(NSInteger)index
{
    self.forecastView.dataSource = delegate;
    self.forecastView.delegate = delegate;
    self.forecastView.tag = index;
}

- (void)setTableviewOffset:(CGPoint)tableviewOffset
{
    _tableviewOffset = tableviewOffset;
    [self.forecastView setContentOffset:tableviewOffset];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self.forecastView reloadData];
}

- (void)refreshWeather
{
    [self.forecastView.mj_header beginRefreshing];
}

@end
