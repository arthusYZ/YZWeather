//
//  ForecastCityCell.h
//  YZWeather
//
//  Created by 杨舟 on 15/12/2.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastCityCell : UICollectionViewCell

@property (nonatomic ,copy ) void (^refresh)(NSInteger);

@property (nonatomic ,assign ) CGPoint tableviewOffset;

- (void)setTableViewDataSourceDelegate:(id<UITableViewDataSource,UITableViewDelegate>)delegate AndIndex:(NSInteger )index;

- (void)refreshWeather;

@end
