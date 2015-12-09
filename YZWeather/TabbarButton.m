//
//  TabbarButton.m
//  YZWeather
//
//  Created by 杨舟 on 15/10/5.
//  Copyright © 2015年 Yang. All rights reserved.
//  自定义tabbar按钮

#import "TabbarButton.h"

@interface TabbarButton ()

/**
 *  中文标题
 */
@property (nonatomic ,weak ) UILabel *cnLable;
/**
 *  英文标题
 */
@property (nonatomic ,weak ) UILabel *enLable;

@end

@implementation TabbarButton

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.cnLable.textColor = [UIColor whiteColor];
        self.enLable.textColor = [UIColor whiteColor];
    }else{
        self.cnLable.textColor = [UIColor grayColor];
        self.enLable.textColor = [UIColor grayColor];
    }
}

/**
 *  初始化按钮并创建自定义标签
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 创建中文标题标签
        UILabel *cnLable = [[UILabel alloc] init];
        [self addSubview:cnLable];
        self.cnLable = cnLable;
        
        // 创建英文标题标签
        UILabel *enLable = [[UILabel alloc] init];
        [self addSubview:enLable];
        self.enLable = enLable;
    }
    return self;
}

/**
 *  去除自带高亮效果
 */
- (void)setHighlighted:(BOOL)highlighted
{
    
}

/**
 *  传入中文标题的时候确定中文title尺寸
 */
- (void)setCnTitle:(NSString *)cnTitle
{
    _cnTitle = cnTitle;
    
    // 设置中文title的文字和文字大小
    self.cnLable.font = [UIFont systemFontOfSize:16];
    self.cnLable.textColor = [UIColor grayColor];
    self.cnLable.textAlignment = NSTextAlignmentCenter;
    self.cnLable.text = cnTitle;
}

/**
 *  传入中文标题的时候确定英文title尺寸
 */
- (void)setEnTitle:(NSString *)enTitle
{
    _enTitle = enTitle;
    
    // 设置英文title的文字和文字大小
    self.enLable.font = [UIFont systemFontOfSize:8];
    self.enLable.textColor = [UIColor grayColor];
    self.enLable.textAlignment = NSTextAlignmentCenter;
    self.enLable.text = enTitle;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置lable的frame
    CGFloat cnLableX = 0;
    CGFloat cnLableY = self.frame.size.height * 0.25;
    CGFloat cnLableW = self.frame.size.width;
    CGFloat cnLableH = self.frame.size.height * 0.4;
    self.cnLable.frame = CGRectMake(cnLableX, cnLableY, cnLableW, cnLableH);

    
    
    // 设置lable的frame
    CGFloat enLableX = 0;
    CGFloat enLableY = CGRectGetMaxY(self.cnLable.frame);
    CGFloat enLableW = self.frame.size.width;
    CGFloat enLableH = self.frame.size.height * 0.25;
    self.enLable.frame = CGRectMake(enLableX, enLableY, enLableW, enLableH);
}

@end
