//
//  TitlePageControl.m
//  YZWeather
//
//  Created by 杨舟 on 15/12/3.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "TitlePageControl.h"

@implementation TitlePageControl

/**
*  改变pageControl中点的大小
*/
- (void)setCurrentPage:(NSInteger)page {
    [super setCurrentPage:page];
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        CGSize size;
        size.height = 3;
        size.width = 3;
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y, size.width,size.height)];
            if (subviewIndex == page) {
                       [subview setBackgroundColor:self.currentPageIndicatorTintColor];
            } else {
            [subview setBackgroundColor:self.pageIndicatorTintColor];
        }
    }
}

@end
