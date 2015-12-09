//
//  TitleView.m
//  YZWeather
//
//  Created by 杨舟 on 15/10/9.
//  Copyright © 2015年 Yang. All rights reserved.
//  顶部view

#import "TitleView.h"

@interface TitleView()


@property (nonatomic ,assign ) titleSytle titleSytle;
/**
 *  城市名车lable
 */
@property (nonatomic , weak) UILabel *cityLable;
/**
 *  加号图片
 */
@property (nonatomic , weak) UIImageView *plus;
/**
 *  定位图片
 */
@property (nonatomic , weak) UIImageView *location;

@end

@implementation TitleView

-(instancetype)initWithStyle:(titleSytle)titleStyle
{
    self.titleSytle = titleStyle;
    return [self init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
        // 创建城市lable并设置其字体大小和颜色
        UILabel *cityLable = [[UILabel alloc] init];
        cityLable.font = [UIFont boldSystemFontOfSize:20];
        cityLable.textColor = [UIColor whiteColor];
        [self addSubview:cityLable];
        self.cityLable = cityLable;
        if (_titleSytle == loc) {
            // 创建加号
            UIImageView *plus = [[UIImageView alloc] init];
            plus.image = [UIImage imageNamed:@"forecast_navigationbar_city_icon_add"];
            plus.contentMode = UIViewContentModeCenter;
            [self addSubview:plus];
            self.plus = plus;
        }
        // 创建定位图片
        UIImageView *location = [[UIImageView alloc] init];
        location.image = [UIImage imageNamed:@"forecast_navigationbar_city_icon_location"];
        location.contentMode = UIViewContentModeTop;
        [self addSubview:location];
        self.location = location;
        
        // 可以与用户交互
        self.userInteractionEnabled = YES;
    }
    return self;
}



- (void)setCityname:(NSString *)cityname
{
    _cityname = cityname;
    self.cityLable.text = cityname;
    // 间隔距离
    CGFloat margin = 3;
    // 计算文字的高度
    NSMutableDictionary *fontAttr = [NSMutableDictionary dictionary];
    fontAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    CGSize fontsize = [cityname sizeWithAttributes:fontAttr];
    // 所有控件的高度
    CGFloat allHeight = fontsize.height;
    // lable的宽度
    CGFloat lableW = fontsize.width;
    
    CGFloat width = lableW + self.location.image.size.width + 2 * margin;
    
    
    // 设置lable的frame
    self.cityLable.frame = CGRectMake(margin, 0, fontsize.width, allHeight);
    // 设置定位图片的frame
    self.location.frame = CGRectMake(CGRectGetMaxX(self.cityLable.frame) + margin, margin, self.location.image.size.width, allHeight - 2 * margin);
    if (_titleSytle == loc) {
        // 父控件的总宽度
        width = self.plus.image.size.width + lableW + self.location.image.size.width + 2 * margin;
        
        // 设置加号的frame
        self.plus.frame = CGRectMake(0, 0, self.plus.image.size.width, allHeight);
        
        // 设置lable的frame
        self.cityLable.frame = CGRectMake(CGRectGetMaxX(self.plus.frame) + margin, 0, fontsize.width, allHeight);
        // 设置定位图片的frame
        self.location.frame = CGRectMake(CGRectGetMaxX(self.cityLable.frame) + margin, margin, self.location.image.size.width, allHeight - 2 * margin);
    }
     //设置父控件的frame
//    self.frame = CGRectMake(0, 0, width, allHeight);
    _selfSize = CGSizeMake(width, allHeight);
}

@end
