//
//  TabBar.m
//  YZWeather
//
//  Created by 杨舟 on 15/10/5.
//  Copyright © 2015年 Yang. All rights reserved.
//  自定义tabbar

#import "TabBar.h"
#import "TabbarButton.h"

@interface TabBar()
/**
 *  自定义按钮数组
 */
@property (nonatomic ,strong ) NSMutableArray *tabbarBtns;
/**
 *  上一个点击的按钮
 */
@property (nonatomic ,weak ) TabbarButton *clickedBtn;
/**
 *  点击后高亮图片
 */
@property (nonatomic ,weak ) UIImageView *selectedImage;

@end

@implementation TabBar

/**
 *  懒加载
 */
- (NSMutableArray *)tabbarBtns
{
    if (!_tabbarBtns) {
        _tabbarBtns = [NSMutableArray array];
    }
    return _tabbarBtns;
}

/**
 *  创建tabbar时创建里面的按钮
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置自定义tabbar背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar"]];
        // 创建高亮显示图片界面
        UIImageView *selectedImage = [[UIImageView alloc] init];
        selectedImage.userInteractionEnabled = YES;
        selectedImage.image = [[UIImage imageNamed:@"tabbarItem_selected"] stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5];
        [self addSubview:selectedImage];
        self.selectedImage = selectedImage;
        [self bringSubviewToFront:selectedImage];
    }
    return self;
}

/**
 *  传入中英文标题创建按钮
 *
 *  @param cnTitle 中文标题
 *  @param enTitle 英文标题
 */
- (void)addButtonWithCnTitle:(NSString *)cnTitle EnTitle:(NSString *)enTitle
{
    // 1.创建按钮
    TabbarButton *button = [[TabbarButton alloc] init];
    // 2.设置按钮中英文标题
    button.cnTitle = cnTitle;
    button.enTitle = enTitle;
    // 3.添加按钮点击事件
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    // 4.将自定义按钮加入到tabbar和按钮数组中
    [self addSubview:button];
    [self.tabbarBtns addObject:button];
    // 5.设置默认点击按钮为第一个按钮
    if (self.tabbarBtns.count == 1) {
//        self.clickedBtn = button;
        [self btnClicked:button];
    }
}

/**
 *  按钮点击事件
 */
- (void)btnClicked:(TabbarButton *)button
{
    // 实现代理方法
    if ([self.delegate respondsToSelector:@selector(tabbar:clickedFrom:To:)]) {
        [self.delegate tabbar:self clickedFrom:(int)self.clickedBtn.tag To:(int)button.tag];
    }
    [UIView animateWithDuration:0.2 animations:^{
        // 设置高亮图片frame
        self.selectedImage.frame = CGRectMake(button.frame.origin.x, 0, button.frame.size.width, button.frame.size.height);

    }];
    // 设置按钮状态
    self.clickedBtn.selected = NO;
    button.selected = YES;
    self.clickedBtn = button;
}

/**
 *  设置子控件（按钮）frame
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 2.1算出按钮宽度
    CGFloat buttonW = self.frame.size.width / self.tabbarBtns.count;
    // 2.2按钮高度
    CGFloat buttonH = self.frame.size.height;
    // 当高亮图片的frame为空时，设置初始frame
    if (CGRectIsEmpty(self.selectedImage.frame)) {
        self.selectedImage.frame = CGRectMake(0, 0, buttonW, buttonH);
    }
    // 取出数组中的按钮
    for (int index = 0; index < self.tabbarBtns.count; index ++) {
        // 1.取出按钮数组中的第i个按钮
        UIButton *button = self.tabbarBtns[index];
        
        // 2.计算frame
        // 2.3按钮Y值
        CGFloat buttonY = 0;
        // 2.4按钮X值
        CGFloat buttonX = index * buttonW;
        
        // 3.设置frame
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 4.设置按钮tag
        button.tag = index;
    }
}

@end
