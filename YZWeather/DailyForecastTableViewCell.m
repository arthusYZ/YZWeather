//
//  DailyForecastTableViewCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "DailyForecastTableViewCell.h"
#import "DailyForecastView.h"

@interface DailyForecastTableViewCell ()

/**
 *  每日天气预报滚动界面
 */
@property (nonatomic ,weak ) DailyForecastView *dailyForecastView;

@end

@implementation DailyForecastTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 创建每日天气预报滚动界面
        DailyForecastView *dailyForecastView = [[DailyForecastView alloc] init];
        
        dailyForecastView.dailyCellClick = ^(NSInteger day){
//            if ([self.delegate respondsToSelector:@selector(dailyForecastTableViewCell:chooseDay:)]) {
//                [self.delegate dailyForecastTableViewCell:self chooseDay:day];
//            }
            _chooseDay(day);
        };
        [self addSubview:dailyForecastView];
        self.dailyForecastView = dailyForecastView;
    }
    return self;
}

- (void)setDailyForecastFrame:(DailyForecastFrame *)dailyForecastFrame
{
    _dailyForecastFrame = dailyForecastFrame;
    
    
    self.dailyForecastView.dailyForecastFrame = dailyForecastFrame;
    self.dailyForecastView.frame = dailyForecastFrame.dailyForecastViewFrame;
//    self.dailyForecastView.frame = CGRectMake(0, forecastmargin + 106, screenSize.width, 106);
    self.dailyForecastView.contentSize = CGSizeMake(screenSize.width * 2, 0);
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"daily";
    DailyForecastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DailyForecastTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

@end
