//
//  CityCellButton.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CityCellButton.h"
#import "CityCellTop.h"
#import "CityCellBottom.h"
#import "UIImage+YZ.h"

@interface CityCellButton ()

@property (nonatomic ,copy ) NSString *cityname;

@property (nonatomic ,weak ) CityCellTop *cityCellTop;

@property (nonatomic ,weak ) CityCellBottom *cityCellBottom;

@property (nonatomic ,weak ) UIButton *deleteButton;

@property (nonatomic ,weak ) UIImageView *highlightImage;

@end

@implementation CityCellButton


- (instancetype)initWithCityname:(NSString *)cityname
{
    self.cityname = cityname;
    return [self init];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CityCellTop *cityCellTop = [[CityCellTop alloc] init];
        //        cityCellTop.image = [UIImage resizeImage:@"citymanagement_board_up" left:0.5 top:1];
        cityCellTop.backgroundColor = [UIColor clearColor];
        [self addSubview:cityCellTop];
        self.cityCellTop =cityCellTop;
        
        CityCellBottom *cityCellBottom = [[CityCellBottom alloc] init];
        //        cityCellBottom.image = [UIImage resizeImage:@"citymanagement_board_down"];
        //        cityCellBottom.image = [UIImage resizeImage:@"citymanagement_board_down" left:0.5 top:1];
        cityCellBottom.backgroundColor = [UIColor clearColor];
        [self addSubview:cityCellBottom];
        self.cityCellBottom = cityCellBottom;
        
        UIButton *deleteButton = [[UIButton alloc] init];
        [deleteButton setImage:[UIImage imageNamed:@"citymanagement_closed"] forState:UIControlStateNormal];
        [deleteButton setImage:[UIImage imageNamed:@"citymanagement_closed_pressed"] forState:UIControlStateHighlighted];
        [deleteButton addTarget:self action:@selector(deleteCityClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:deleteButton];
        self.deleteButton = deleteButton;
        
        UIImageView *highlightImage = [[UIImageView alloc] init];
        highlightImage.image = [UIImage resizeImage:@"citymanagement_card_pressed"];
        [self addSubview:highlightImage];
        self.highlightImage = highlightImage;
    }
    return self;
}

- (void)deleteCityClick
{
        _deleteCity(self.tag);
//    [self removeFromSuperview];
}

- (void)setDeleteButtonHidden:(BOOL)deleteButtonHidden
{
    _deleteButtonHidden = deleteButtonHidden;
    _deleteButton.hidden = deleteButtonHidden;
}

- (void)setToday:(DailyForecast *)today
{
    _today = today;
    self.cityCellTop.today = _today;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat subW = self.frame.size.width;
    CGFloat subH = self.frame.size.height;
    
    CGFloat cityCellTopW = subW;
    CGFloat cityCellTopH = subH * 0.75;
    self.cityCellTop.frame = CGRectMake(0, 0, cityCellTopW, cityCellTopH);
    self.cityCellTop.image = [UIImage resizeImage:@"citymanagement_board_up" left:0.5 top:1];
    self.cityCellTop.today = _today;
    
    
    
    CGFloat cityCellBottomH = subH * 0.25;
    self.cityCellBottom.cityname = _cityname;
    self.cityCellBottom.frame = CGRectMake(0, cityCellTopH, subW, cityCellBottomH);
    //    self.cityCellBottom.image = [UIImage resizeImage:@"citymanagement_board_down" left:0.5 top:0];
    self.cityCellBottom.image = [[UIImage imageNamed:@"citymanagement_board_down"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 5, 12, 5) resizingMode:UIImageResizingModeStretch];
    
    self.highlightImage.frame = self.bounds;
    self.highlightImage.hidden = !self.highlighted;
    
    CGFloat deleteButtonWH = 20;
    self.deleteButton.frame = CGRectMake(-5, -5, deleteButtonWH, deleteButtonWH);
    [self bringSubviewToFront:self.deleteButton];
}

@end
