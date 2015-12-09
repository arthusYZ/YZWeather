//
//  SuggestionFrame.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/18.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "SuggestionFrame.h"
#import "ViewFrame.h"

@implementation SuggestionFrame

- (void)setSuggestion:(Suggestion *)suggestion
{
    _suggestion = suggestion;
    
    NSMutableDictionary *lifeFontDict = [NSMutableDictionary dictionary];
    lifeFontDict[NSFontAttributeName] = dailyDayfont;
    CGSize lifeSize = [@"生活" sizeWithAttributes:lifeFontDict];
    CGFloat lifeLableX = forecastmargin;
    CGFloat lifeLableY = forecastmargin;
    _lifeLableFrame = CGRectMake(lifeLableX, lifeLableY, lifeSize.width, lifeSize.height);
    
    CGFloat horizontalDeviderX = CGRectGetMaxX(_lifeLableFrame) + forecastmargin * 0.5;
    CGFloat horizontalDeviderW = screenSize.width - CGRectGetMaxX(_lifeLableFrame) - forecastmargin;
    _horizontalDeviderFrame =CGRectMake(horizontalDeviderX, _lifeLableFrame.size.height * 0.5 + forecastmargin, horizontalDeviderW, 1);
    
    CGFloat viewW = (screenSize.width - forecastmargin * 2) / 3;
    NSMutableArray *viewsFrameArray = [NSMutableArray array];
    
    ViewFrame *comfViewFrame = [[ViewFrame alloc] init];
    comfViewFrame.brf = suggestion.comf.brf;
    comfViewFrame.text = suggestion.comf.txt;
    CGFloat viewH = comfViewFrame.viewHeight;
    CGFloat comfX = forecastmargin;
    CGFloat comfY = CGRectGetMaxY(_lifeLableFrame) + forecastmargin * 2;
    CGRect comfFrame = CGRectMake(comfX, comfY, viewW, viewH);
    comfViewFrame.viewFrame = comfFrame;
    [viewsFrameArray addObject:comfViewFrame];
    
    ViewFrame *cwViewFrame = [[ViewFrame alloc] init];
    cwViewFrame.brf = suggestion.cw.brf;
    cwViewFrame.text = suggestion.cw.txt;
    CGFloat cwX = CGRectGetMaxX(comfFrame);
    CGFloat cwY = comfY;
    CGRect cwFrame = CGRectMake(cwX, cwY, viewW, viewH);
    cwViewFrame.viewFrame = cwFrame;
    [viewsFrameArray addObject:cwViewFrame];
    
    ViewFrame *drsgViewFrame = [[ViewFrame alloc] init];
    drsgViewFrame.brf = suggestion.drsg.brf;
    drsgViewFrame.text = suggestion.drsg.txt;
    CGFloat drsgX = CGRectGetMaxX(cwFrame);
    CGFloat drsgY = comfY;
    CGRect drsgFrame = CGRectMake(drsgX, drsgY, viewW, viewH);
    drsgViewFrame.viewFrame = drsgFrame;
    [viewsFrameArray addObject:drsgViewFrame];
    
    ViewFrame *fluViewFrame = [[ViewFrame alloc] init];
    fluViewFrame.brf = suggestion.flu.brf;
    fluViewFrame.text = suggestion.flu.txt;
    CGFloat fluX = comfX;
    CGFloat fluY = CGRectGetMaxY(comfFrame);
    CGRect fluFrame = CGRectMake(fluX, fluY, viewW, viewH);
    fluViewFrame.viewFrame = fluFrame;
    [viewsFrameArray addObject:fluViewFrame];
    
    ViewFrame *sportViewFrame = [[ViewFrame alloc] init];
    sportViewFrame.brf = suggestion.sport.brf;
    sportViewFrame.text = suggestion.sport.txt;
    CGFloat sportX = cwX;
    CGFloat sportY = CGRectGetMaxY(cwFrame);
    CGRect sportFrame = CGRectMake(sportX, sportY, viewW, viewH);
    sportViewFrame.viewFrame = sportFrame;
    [viewsFrameArray addObject:sportViewFrame];
    
    ViewFrame *travViewFrame = [[ViewFrame alloc] init];
    travViewFrame.brf = suggestion.trav.brf;
    travViewFrame.text = suggestion.trav.txt;
    CGFloat travX = drsgX;
    CGFloat travY = CGRectGetMaxY(drsgFrame);
    CGRect travFrame = CGRectMake(travX, travY, viewW, viewH);
    travViewFrame.viewFrame = travFrame;
    [viewsFrameArray addObject:travViewFrame];
    
    ViewFrame *uvViewFrame = [[ViewFrame alloc] init];
    uvViewFrame.brf = suggestion.uv.brf;
    uvViewFrame.text = suggestion.uv.txt;
    CGFloat uvX = fluX;
    CGFloat uvY = CGRectGetMaxY(fluFrame);
    CGRect uvFrame = CGRectMake(uvX, uvY, viewW, viewH);
    uvViewFrame.viewFrame = uvFrame;
    [viewsFrameArray addObject:uvViewFrame];
    
    _viewsFrameArray = viewsFrameArray;
    _cellHeight = CGRectGetMaxY(uvFrame) + forecastmargin;
}

@end
