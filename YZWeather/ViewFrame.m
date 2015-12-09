//
//  ViewFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/18.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "ViewFrame.h"

@implementation ViewFrame

- (void)setBrf:(NSString *)brf
{
    _brf = brf;
    
    CGFloat viewW = (screenSize.width - forecastmargin) / 3;
    
    CGFloat imageWH = 30;
    CGFloat imageX = (viewW - imageWH) * 0.5;
    CGFloat imageY = forecastmargin;
    _imageViewFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    NSMutableDictionary *brfFontDict = [NSMutableDictionary dictionary];
    brfFontDict[NSFontAttributeName] = timefont;
    
    CGSize brfSize = [brf sizeWithAttributes:brfFontDict];
    CGFloat brfX = (viewW - brfSize.width) * 0.5;
    CGFloat brfY = CGRectGetMaxY(_imageViewFrame) + forecastmargin;
    _brfLableFrame = CGRectMake(brfX, brfY, brfSize.width, brfSize.height);
    
    _viewHeight = CGRectGetMaxY(_brfLableFrame) + forecastmargin;
}

@end
