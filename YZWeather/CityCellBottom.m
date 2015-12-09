//
//  CityCellBottom.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/24.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CityCellBottom.h"

@interface CityCellBottom ()

@property (nonatomic ,weak ) UILabel *cityLable;

@end

@implementation CityCellBottom

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *cityLable = [[UILabel alloc] init];
        cityLable.font = timefont;
        [self addSubview:cityLable];
        self.cityLable = cityLable;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSMutableDictionary *cityFontDict = [NSMutableDictionary dictionary];
    cityFontDict[NSFontAttributeName] = timefont;
    CGSize cityLableSize = [_cityname sizeWithAttributes:cityFontDict];
    CGFloat cityLableCenterX = self.frame.size.width * 0.5;
    CGFloat cityLableCenterY = self.frame.size.height * 0.5;
    self.cityLable.text = _cityname;
    self.cityLable.frame = CGRectMake(0, 0, cityLableSize.width, cityLableSize.height);
    self.cityLable.center = CGPointMake(cityLableCenterX, cityLableCenterY);
}

@end
