//
//  CityCellTop.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/24.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CityCellTop.h"
#import "GMDCircleLoader.h"
#import "CityManageTool.h"

@interface CityCellTop ()

@property (nonatomic ,weak ) UIImageView *condImageView;

@property (nonatomic ,weak ) UILabel *maxTmpLable;

@property (nonatomic ,weak ) UILabel *minTmpLable;

@property (nonatomic ,weak ) UILabel *condTextLable;

@end

@implementation CityCellTop

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *condImageView = [[UIImageView alloc] init];
        condImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:condImageView];
        self.condImageView = condImageView;
        
        UILabel *maxTmpLable = [[UILabel alloc] init];
        maxTmpLable.font = timefont;
        maxTmpLable.textColor = [UIColor grayColor];
        [self addSubview:maxTmpLable];
        self.maxTmpLable = maxTmpLable;
        
        UILabel *minTmpLable = [[UILabel alloc] init];
        minTmpLable.font = timefont;
        minTmpLable.textColor = [UIColor grayColor];
        [self addSubview:minTmpLable];
        self.minTmpLable = minTmpLable;
        
        UILabel *condTextLable = [[UILabel alloc] init];
        condTextLable.font = timefont;
        condTextLable.textColor = [UIColor grayColor];
        [self addSubview:condTextLable];
        self.condTextLable = condTextLable;
        
    }
    return self;
}

- (void)setToday:(DailyForecast *)today
{
    _today = today;
    
    
    
    
    CGFloat subW = self.frame.size.width;
    CGFloat subH = self.frame.size.height;
    
    if(today){
        [GMDCircleLoader hideFromView:self animated:YES];
        
        NSString *cond = [NSDate isDayTime]? today.cond.txt_d:today.cond.txt_n;
        
        NSMutableDictionary *cityFontDict = [NSMutableDictionary dictionary];
        cityFontDict[NSFontAttributeName] = timefont;
        
        
        CGSize condTextLableSize = [cond sizeWithAttributes:cityFontDict];
        CGFloat condTextLableY = subH - forecastmargin * 0.5 - condTextLableSize.height;
        CGFloat condTextLableX = subW * 0.5 - condTextLableSize.width * 0.5;
        self.condTextLable.text = cond;
        self.condTextLable.frame = CGRectMake(condTextLableX, condTextLableY, condTextLableSize.width, condTextLableSize.height);
        
//        CGFloat margin = 20;
        
        CGFloat condImageViewW = [UIImage imageNamed:@"citymanagement_icon_clound"].size.width;
        CGFloat condImageViewH = [UIImage imageNamed:@"citymanagement_icon_clound"].size.height;
        CGFloat condImageViewY = (condTextLableY - condImageViewH) * 0.5;
        CGFloat condImageViewX = forecastmargin * 1.5;
        self.condImageView.frame = CGRectMake(condImageViewX, condImageViewY, condImageViewW, condImageViewH);
//        self.condImageView.backgroundColor = [UIColor redColor];
        self.condImageView.image = [CityManageTool condImageWith:today.cond];
        
        NSString *maxTmp = [NSString stringWithFormat:@"%@°",today.tmp.max];
        NSString *minTmp = [NSString stringWithFormat:@"%@°",today.tmp.min];
        
        CGSize maxTmpLableSize = [maxTmp sizeWithAttributes:cityFontDict];
        CGFloat maxTmpLableY = condImageViewY + condImageViewH * 0.5 - maxTmpLableSize.height -forecastmargin *0.5;
        CGFloat maxTmpLableX = subW - forecastmargin * 1.5 - maxTmpLableSize.width;
        self.maxTmpLable.text = maxTmp;
        self.maxTmpLable.frame = CGRectMake(maxTmpLableX, maxTmpLableY, maxTmpLableSize.width, maxTmpLableSize.height);
        
        CGSize minTmpLableSize = [minTmp sizeWithAttributes:cityFontDict];
        CGFloat minTmpLableY = condImageViewY + condImageViewH * 0.5 + forecastmargin * 0.5;
        CGFloat minTmpLableX = subW - forecastmargin * 1.5 - minTmpLableSize.width;
        self.minTmpLable.text = minTmp;
        self.minTmpLable.frame = CGRectMake(minTmpLableX, minTmpLableY, minTmpLableSize.width, minTmpLableSize.height);
    }else{
        [GMDCircleLoader setOnView:self withTitle:@"数据请求中" animated:YES];
    }
}

@end
