//
//  MyTitleView.m
//  YZWeather
//
//  Created by 杨舟 on 15/12/2.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "MyTitleView.h"
#import "TitleView.h"
#import "TitlePageControl.h"

@interface MyTitleView ()

@property (nonatomic ,weak ) TitleView *titleview;

@property (nonatomic ,weak ) UIPageControl *pagecontrol;

@property (nonatomic ,assign ) CGSize pagecontrolSize;

@end

@implementation MyTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor greenColor];
        self.userInteractionEnabled = YES;
        
        TitleView *titleview = [[TitleView alloc] init];
        titleview.cityname = @"杭州";
        [self addSubview:titleview];
        self.titleview = titleview;
        
        UIPageControl *pagecontrol = [[UIPageControl alloc] init];
        pagecontrol.hidesForSinglePage = YES;
        pagecontrol.userInteractionEnabled = NO;
        [self addSubview:pagecontrol];
        self.pagecontrol = pagecontrol;
    }
    return self;
}

- (void)setCitynameOfCurrentPage:(NSString *)citynameOfCurrentPage
{
    _citynameOfCurrentPage = citynameOfCurrentPage;
    self.titleview.cityname = citynameOfCurrentPage;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    _numberOfPages = numberOfPages;
    self.pagecontrol.numberOfPages = numberOfPages;
    self.pagecontrolSize = [self.pagecontrol sizeForNumberOfPages:numberOfPages];
}

- (void)setNumberOfCurrentPage:(NSInteger)numberOfCurrentPage
{
    _numberOfCurrentPage = numberOfCurrentPage;
    self.pagecontrol.currentPage = numberOfCurrentPage;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect superFrame = self.frame;
    
    CGSize titleviewSize = _titleview.selfSize;
    CGFloat titleViewX = (superFrame.size.width - titleviewSize.width) * 0.5;
    CGFloat titleViewY = 0;
    self.titleview.frame = CGRectMake(titleViewX, titleViewY, titleviewSize.width, titleviewSize.height);
    
    CGFloat pagecontrolY = CGRectGetMaxY(self.titleview.frame) - 10;
    CGFloat pagecontrolX = (superFrame.size.width - _pagecontrolSize.width) * 0.5;
    
    self.pagecontrol.frame = CGRectMake(pagecontrolX, pagecontrolY, _pagecontrolSize.width, _pagecontrolSize.height);
    
}

@end
