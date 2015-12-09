//
//  CitysCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/26.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CitysCell.h"
#import "UIImage+YZ.h"
#import "HotCity.h"
#import "WeatherDataCacheTool.h"

@interface CitysCell ()

@property (nonatomic ,weak ) UILabel *titleLable;

@property (nonatomic ,weak ) UIImageView *coverView;

@property (nonatomic ,strong ) NSMutableArray *cityBtnsArray;

@end

@implementation CitysCell

- (NSMutableArray *)cityBtnsArray
{
    if (!_cityBtnsArray) {
        _cityBtnsArray = [NSMutableArray array];
    }
    return _cityBtnsArray;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.backgroundColor = [UIColor clearColor];
        
        
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.font = comfont;
        titleLable.textColor = RGBA(149, 149, 149, 1);
        [self addSubview:titleLable];
        self.titleLable = titleLable;
        
        
        
    }
    return self;
}

- (void)setHotCityArray:(NSArray *)hotCityArray
{
    _hotCityArray = hotCityArray;
    
    _titleLable.text = _titleText;
    
    NSMutableDictionary *titleFontDict = [NSMutableDictionary dictionary];
    titleFontDict[NSFontAttributeName] = comfont;
    CGSize titleSize = [_titleText sizeWithAttributes:titleFontDict];
    _titleLable.frame = CGRectMake(forecastmargin, forecastmargin, titleSize.width, titleSize.height);
    
    CGFloat coverViewW = screenSize.width - 2 * forecastmargin;
    
    NSInteger maxColumn = 4;
    
    CGFloat btnW = coverViewW / (float)maxColumn;
    CGFloat btnH = (float)btnW * 0.5;
    
    CGFloat btnOriginY = CGRectGetMaxY(_titleLable.frame) + forecastmargin;
    
    NSInteger index = _hotCityArray.count;
    
    NSMutableArray *cityBtnsArray = [NSMutableArray array];
    for (int i = 0; i < index; i++) {
        int row = i / maxColumn;
        int column = i % maxColumn;
        HotCity *hotCity = _hotCityArray[i];
        
        NSRange range = [hotCity.name rangeOfString:@"#"]; //现获取要截取的字符串位置
        NSString * cityName = [hotCity.name substringToIndex:range.location]; //截取字符串
        
        NSArray *citys = [WeatherDataCacheTool loadAllCitys];
        
        
        UIButton *cityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cityBtn setTitle:cityName forState:UIControlStateNormal];
        CGFloat cityBtnX = btnW * column + forecastmargin;
        CGFloat cityBtnY = btnH * row + btnOriginY;
        
        [cityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if ([citys indexOfObject:cityName] != NSNotFound) {
            [cityBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
        
        cityBtn.titleLabel.font = comfont;
        
        cityBtn.frame = CGRectMake(cityBtnX, cityBtnY, btnW, btnH);
        
        
        [cityBtn addTarget:self action:@selector(cityBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cityBtn];
        [cityBtnsArray addObject:cityBtn];
    }
    _cityBtnsArray = cityBtnsArray;
    
    UIButton *btn = [cityBtnsArray lastObject];
    
    CGFloat moreBtnY = CGRectGetMaxY(btn.frame);
    
    CGFloat moreBtnH = 50;
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreBtn addTarget:self action:@selector(morePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    moreBtn.frame = CGRectMake(forecastmargin, moreBtnY, coverViewW, moreBtnH);
    
    
    moreBtn.titleLabel.font = comfont;
    
    [self addSubview:moreBtn];
    [moreBtn setTitle:@"更多景点" forState:UIControlStateNormal];
    if ([_titleText isEqualToString:@"热门城市"]) {
        [moreBtn setTitle:@"更多城市" forState:UIControlStateNormal];
    }
    
    CGRect frame = self.frame;
    frame.size.height = CGRectGetMaxY(moreBtn.frame) + forecastmargin;
    self.frame = frame;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"city";
    
    CitysCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CitysCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)morePressed:(UIButton *)moreBtn
{
    if ([_titleText isEqualToString:@"热门城市"]) {
        _moreBtnPressed(_titleText);
    }
}

- (void)cityBtnPressed:(UIButton *)cityBtn
{
    _cityBtnPressed(cityBtn.titleLabel.text);
}

@end
