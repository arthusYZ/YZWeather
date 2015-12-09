//
//  WeeklyForecastTableViewCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "WeeklyForecastTableViewCell.h"
#import "DailyWeatherButton.h"
#import "UIImage+YZ.h"
#import "ChartView.h"

@interface WeeklyForecastTableViewCell ()
/**
 *  天气标签
 */
@property (nonatomic ,weak ) UILabel *weatherLable;
/**
 *  水平分隔线
 */
@property (nonatomic ,weak ) UIView *horizontalDevider;
/**
 *  每日天气详情按钮数组
 */
@property (nonatomic ,strong ) NSMutableArray *dailyWeatherBtnsArray;

@property (nonatomic ,weak ) ChartView *chartView;

@end

@implementation WeeklyForecastTableViewCell

- (NSMutableArray *)dailyWeatherBtnsArray
{
    if (!_dailyWeatherBtnsArray) {
        _dailyWeatherBtnsArray = [NSMutableArray array];
    }
    return _dailyWeatherBtnsArray;
}

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
        UILabel *weatherLable = [[UILabel alloc] init];
        weatherLable.text = @"天气";
        weatherLable.font = dailyDayfont;
        weatherLable.textColor = white;
        [self addSubview:weatherLable];
        self.weatherLable = weatherLable;
        
        UIView *horizontalDevider = [[UIView alloc] init];
        horizontalDevider.backgroundColor = [UIColor lightGrayColor];
        horizontalDevider.alpha = deviderAlpha;
        [self addSubview:horizontalDevider];
        self.horizontalDevider = horizontalDevider;
        
        for (int i = 0; i < 6; i++) {
            DailyWeatherButton *dailyWeatherButton = [[DailyWeatherButton alloc] init];
//            [dailyWeatherButton setTitle:@"" forState:UIControlStateNormal];
            dailyWeatherButton.tag = i;
            [dailyWeatherButton setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateHighlighted];
            [dailyWeatherButton addTarget:self action:@selector(selectDay:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:dailyWeatherButton];
            [self.dailyWeatherBtnsArray addObject:dailyWeatherButton];
        }
        
        ChartView *chartView = [[ChartView alloc] init];
        [self addSubview:chartView];
        self.chartView = chartView;
    }
    return self;
}

- (void)selectDay:(DailyWeatherButton *)dailyWeatherButton
{
    _dayClick(dailyWeatherButton.tag);
}

- (void)setWeeklyForecastFrame:(WeeklyForecastFrame *)weeklyForecastFrame
{
    _weeklyForecastFrame = weeklyForecastFrame;
    
    self.weatherLable.frame = weeklyForecastFrame.weatherLableFrame;
    self.horizontalDevider.frame = weeklyForecastFrame.horizontalDeviderFrame;
    
    NSArray *btnFrameArray = weeklyForecastFrame.btnFrameArray;
    for (int i = 0; i < 6; i++) {
        DailyWeatherButton *dailyWeatherButton = self.dailyWeatherBtnsArray[i];
        DailyForecastButtonFrame *dailyForecastButtonFrame = btnFrameArray[i];
        dailyWeatherButton.dailyForecastButtonFrame = dailyForecastButtonFrame;
        
        
        dailyWeatherButton.frame = dailyForecastButtonFrame.buttonFrame;
    }
    self.chartView.frame = weeklyForecastFrame.chartViewFrame;
    
    self.chartView.tmpsArray = weeklyForecastFrame.tmpsArray;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"week";
    WeeklyForecastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WeeklyForecastTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

@end
