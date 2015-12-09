//
//  RightBarItemView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "RightBarItemView.h"

@interface RightBarItemView ()

@property (nonatomic ,weak ) UIButton *editBtn;

@property (nonatomic ,weak ) UIButton *confirmBtn;

@property (nonatomic ,weak ) UIButton *refreshBtn;

@end

@implementation RightBarItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [editBtn setBackgroundImage:[UIImage imageNamed:@"edit_normal"] forState:UIControlStateNormal];
        [editBtn setBackgroundImage:[UIImage imageNamed:@"edit_hilight"] forState:UIControlStateHighlighted];
        [editBtn addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:editBtn];
        self.editBtn = editBtn;
        
        UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [confirmBtn setBackgroundImage:[UIImage imageNamed:@"ok_normal"] forState:UIControlStateNormal];
        [confirmBtn setBackgroundImage:[UIImage imageNamed:@"ok_hilight"] forState:UIControlStateHighlighted];
        [confirmBtn addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
        confirmBtn.hidden = YES;
        [self addSubview:confirmBtn];
        self.confirmBtn = confirmBtn;
        
        UIButton *refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [refreshBtn setBackgroundImage:[UIImage imageNamed:@"refresh_normal"] forState:UIControlStateNormal];
        [refreshBtn setBackgroundImage:[UIImage imageNamed:@"refresh_hilight"] forState:UIControlStateHighlighted];
        [refreshBtn addTarget:self action:@selector(refreshClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:refreshBtn];
        self.refreshBtn = refreshBtn;
    }
    return self;
}

- (void)longPressed
{
    _editBtn.hidden = YES;
    _confirmBtn.hidden = NO;
}

- (void)editClick:(UIButton *)editBtn
{
    _edit();
    editBtn.hidden = YES;
    _confirmBtn.hidden = NO;
}

- (void)confirmClick:(UIButton *)confirmBtn
{
    _confirm();
    confirmBtn.hidden = YES;
    _editBtn.hidden = NO;
}

- (void)refreshClick:(UIButton *)refreshBtn
{
    
    _refresh();
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat BtnWH = 25;
    
    self.editBtn.frame = CGRectMake(0, 0, BtnWH, BtnWH);
    self.confirmBtn.frame = CGRectMake(0, 0, BtnWH, BtnWH);
    
    CGFloat subW = self.frame.size.width;
    CGFloat refreshBtnX = subW - 25;
    self.refreshBtn.frame = CGRectMake(refreshBtnX, 0, BtnWH, BtnWH);
}

@end
