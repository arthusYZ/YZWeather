//
//  ShareButton.m
//  YZWeather
//
//  Created by 杨舟 on 15/10/26.
//  Copyright © 2015年 Yang. All rights reserved.
//  分享按钮

#import "ShareButton.h"

@implementation ShareButton

//// 取消高亮效果
//- (void)setHighlighted:(BOOL)highlighted
//{
//    
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"share_white"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"share_white_hilight"] forState:UIControlStateHighlighted];
        self.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    }
    return self;
}

@end
