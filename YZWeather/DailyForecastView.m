//
//  DailyForecastView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/12.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyForecastView.h"
#import "DailyForecast.h"
#import "DailyForecastCellView.h"

@interface DailyForecastView ()
/**
 *  每日天气预报按钮数组
 */
@property (nonatomic ,strong ) NSMutableArray *dailyForecastCellsArray;

@end

@implementation DailyForecastView
// 懒加载
- (NSMutableArray *)dailyForecastCellsArray
{
    if (!_dailyForecastCellsArray) {
        _dailyForecastCellsArray = [NSMutableArray array];
    }
    return _dailyForecastCellsArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        for (int i = 0; i < 6; i++) {
            DailyForecastCellView *dailyForecastCell = [[DailyForecastCellView alloc] init];
            dailyForecastCell.userInteractionEnabled = YES;
            dailyForecastCell.tag = i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapForecastCell:)];
            [dailyForecastCell addGestureRecognizer:tap];
            [self addSubview:dailyForecastCell];
            [self.dailyForecastCellsArray addObject:dailyForecastCell];
        }
    }
    return self;
}

- (void)setDailyForecastFrame:(DailyForecastFrame *)dailyForecastFrame
{
    _dailyForecastFrame = dailyForecastFrame;
    
    NSArray *cellFrameArray = dailyForecastFrame.cellFrameArray;
    for (int i = 0; i < 6; i++) {
        DailyForecastCellView *dailyForecastCell = self.dailyForecastCellsArray[i];
        DailyForecastCellViewFrame *dailyForecastCellViewFrame = cellFrameArray[i];
        dailyForecastCell.dailyForecastCellViewFrame = dailyForecastCellViewFrame;
        
        CGRect cellFrame = dailyForecastCellViewFrame.cellFrame;
        dailyForecastCell.frame = cellFrame;
    }
}


- (void)OnTapForecastCell:(UITapGestureRecognizer *)sender
{
    DailyForecastCellView *dailyForecastCell = (DailyForecastCellView *)sender.view;
    _dailyCellClick(dailyForecastCell.tag);
}

@end
