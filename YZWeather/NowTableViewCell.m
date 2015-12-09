//
//  UpdateTimeTableViewCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/17.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "NowTableViewCell.h"
#import "AqiButton.h"

@interface NowTableViewCell ()
/**
 *  发布时间
 */
@property (nonatomic ,weak ) UILabel *updateTimeLable;
/**
 *  温度
 */
@property (nonatomic , weak) UILabel *tmp;
/**
 *  温度符号
 */
@property (nonatomic , weak) UILabel *tmpcircle;
/**
 *  天气状况（阴晴）
 */
@property (nonatomic , weak) UILabel *cond;
/**
 *  我来报天气按钮
 */
@property (nonatomic , weak) UIButton *meforecast;
/**
 *  体感温度
 */
@property (nonatomic , weak) UILabel *fl;
/**
 *  风向风力及湿度
 */
@property (nonatomic , weak) UILabel *windhum;
/**
 *  空气质量指数
 */
@property (nonatomic ,weak ) AqiButton *aqiBtn;
/**
 *  即时天气分隔线
 */
@property (nonatomic ,weak ) UIView *nowdevider;

@end

@implementation NowTableViewCell

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
        // 创建发布时间标签
        UILabel *updateTimeLable = [[UILabel alloc] init];
        updateTimeLable.font = timefont;
        updateTimeLable.textColor = white;
        [self addSubview:updateTimeLable];
        self.updateTimeLable = updateTimeLable;
        
        // 创建温度标签
        UILabel *tmp = [[UILabel alloc] init];
        tmp.font = tmpfont;
        tmp.textColor = white;
        [self addSubview:tmp];
        self.tmp = tmp;
        
        UILabel *tmpcircle = [[UILabel alloc] init];
        tmpcircle.text = @"○";
        tmpcircle.textColor = white;
        tmpcircle.font = [UIFont boldSystemFontOfSize:15];
        [self addSubview:tmpcircle];
        self.tmpcircle = tmpcircle;
        
        // 天气状况
        UILabel *cond = [[UILabel alloc] init];
        cond.font = condfont;
        cond.textColor = white;
        [self addSubview:cond];
        self.cond = cond;
        
        // 体感温度标签
        UILabel *fl =[[UILabel alloc] init];
        fl.font = comfont;
        fl.textColor = white;
        [self addSubview:fl];
        self.fl = fl;
        
        // 风向风力及湿度
        UILabel *windhum = [[UILabel alloc] init];
        windhum.font = comfont;
        windhum.textColor = white;
        [self addSubview:windhum];
        self.windhum = windhum;
        
        // 创建aqi按钮
        AqiButton *aqiBtn = [[AqiButton alloc] init];
        [self addSubview:aqiBtn];
        self.aqiBtn = aqiBtn;
        
        // 创建即时天气分隔线
        UIView *nowdevider = [[UIView alloc] init];
        nowdevider.backgroundColor = [UIColor lightGrayColor];
        nowdevider.alpha = deviderAlpha;
        [self addSubview:nowdevider];
        self.nowdevider = nowdevider;
    }
    return self;
}

- (void)setNowFrame:(NowFrame *)nowFrame
{
    _nowFrame = nowFrame;
    
    WeatherData *weatherData = nowFrame.weatherData;
    // 设置更新时间标签
    self.updateTimeLable.text = weatherData.basic.update.loc;
    self.updateTimeLable.frame = nowFrame.updateLableFrame;
    
    // 温度标签
    self.tmp.text = weatherData.now.tmp;
    self.tmp.frame = nowFrame.tmpFrame;
    
    
    // 温度符号标签
    self.tmpcircle.frame = nowFrame.tmpCircleFrame;
    
    // 天气状况
    self.cond.text = weatherData.now.cond.txt;
    self.cond.frame = nowFrame.condFrame;
    
    // 体感温度
    NSString *fl = [NSString stringWithFormat:@"体感温度 %@",weatherData.now.fl];
    self.fl.text = fl;
    self.fl.frame = nowFrame.flFrame;
    
    // 风向风力及湿度
    NSString *windhum  = [NSString stringWithFormat:@"%@%@ 湿度 %@",weatherData.now.wind.dir,weatherData.now.wind.sc,weatherData.now.hum];
    self.windhum.text = windhum;
    self.windhum.frame = nowFrame.windhumFrame;
    
    // aqi按钮
    NSString *title = [NSString stringWithFormat:@"%@·%@",weatherData.aqi.city.aqi,weatherData.aqi.city.qlty];
    self.aqiBtn.aqi = weatherData.aqi;
    [self.aqiBtn setTitle:title forState:UIControlStateNormal];
    self.aqiBtn.frame = nowFrame.aqiBtnFrame;
    
    self.nowdevider.frame = CGRectMake(forecastmargin * 0.5, CGRectGetMaxY(nowFrame.aqiBtnFrame) + forecastmargin, screenSize.width - forecastmargin, 1);
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"now";
    NowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
@end
