//
//  UIImage+YZ.m
//  0831 - YZweibo
//
//  Created by 杨舟 on 15/9/8.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

#import "UIImage+YZ.h"

@implementation UIImage (YZ)

+ (UIImage *)resizeImage:(NSString *)imageName
{
    UIImage *image = [self resizeImage:imageName left:0.5 top:0.5];
    return image;
}
+ (UIImage *)resizeImage:(NSString *)imageName left:(float)left top:(float)top
{
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:image.size.width*left topCapHeight:image.size.height*top];
    return image;
}

+ (UIImage *)dayCondImageFromString:(NSString *)condString
{
    UIImage *condImage = [[UIImage alloc] init];
    condImage = [UIImage imageNamed:@"weizhi"];
    
    NSArray *condArray = [NSArray arrayWithObjects:@"阵雨",@"多云",@"晴间多云",@"阴",@"晴",@"雷阵雨",@"雨夹雪",@"阵雨夹雪",@"雨雪天气",@"霾",@"扬沙",@"浮尘",@"沙尘暴",@"强沙尘暴",@"小雨",@"中雨",@"大雨",@"极端降雨",@"暴雨",@"大暴雨",@"特大暴雨",@"小雪",@"中雪",@"大雪",@"暴雪",@"少云",nil];
    
    NSInteger index = [condArray indexOfObject:condString];
    
    switch (index) {
            // 阵雨
        case 0:
            condImage = [UIImage imageNamed:@"zhenyu"];
            break;
            // 多云
        case 1:
        case 2:
            condImage = [UIImage imageNamed:@"duoyun"];
            break;
            // 阴
        case 3:
            condImage = [UIImage imageNamed:@"yin"];
            break;
            // 晴
        case 4:
            condImage = [UIImage imageNamed:@"qing"];
            break;
            // 雷阵雨
        case 5:
            condImage = [UIImage imageNamed:@"leizhenyu"];
            break;
            // 雨夹雪/阵雨夹雪/雨雪天气
        case 6:
        case 7:
        case 8:
            condImage = [UIImage imageNamed:@"yujiaxue"];
            break;
            // 霾/扬沙/浮尘/沙尘暴/强沙尘暴
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
            condImage = [UIImage imageNamed:@"mai"];
            break;
            // 小雨
        case 14:
            condImage = [UIImage imageNamed:@"xiaoyu"];
            break;
            // 中雨/大雨/极端降雨/暴雨/大暴雨/特大暴雨
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
            condImage = [UIImage imageNamed:@"zhong_dayu"];
            break;
            // 小雪
        case 21:
            condImage = [UIImage imageNamed:@"xiaoxue"];
            break;
            // 中雪/大雪/暴雪
        case 22:
        case 23:
        case 24:
            condImage = [UIImage imageNamed:@"zhong_daxue"];
            break;
            // 少云
        case 25:
            condImage = [UIImage imageNamed:@"shaoyun"];
            break;
            
    }
    return condImage;
}

+ (UIImage *)nightCondImageFromString:(NSString *)condString
{
    UIImage *condImage = [[UIImage alloc] init];
    condImage = [UIImage imageNamed:@"weizhi"];
    
    NSArray *condArray = [NSArray arrayWithObjects:@"阵雨",@"多云",@"晴间多云",@"阴",@"晴",@"雷阵雨",@"雨夹雪",@"阵雨夹雪",@"雨雪天气",@"霾",@"扬沙",@"浮尘",@"沙尘暴",@"强沙尘暴",@"小雨",@"中雨",@"大雨",@"极端降雨",@"暴雨",@"大暴雨",@"特大暴雨",@"小雪",@"中雪",@"大雪",@"暴雪",@"少云",nil];
    
        NSInteger index = [condArray indexOfObject:condString];
        
        switch (index) {
                // 阵雨
            case 0:
                condImage = [UIImage imageNamed:@"zhenyu"];
                break;
                // 多云
            case 1:
            case 2:
                condImage = [UIImage imageNamed:@"yejianduoyun"];
                break;
                // 阴
            case 3:
                condImage = [UIImage imageNamed:@"yin"];
                break;
                // 晴
            case 4:
                condImage = [UIImage imageNamed:@"yejianqing"];
                break;
                // 雷阵雨
            case 5:
                condImage = [UIImage imageNamed:@"leizhenyu"];
                break;
                // 雨夹雪/阵雨夹雪/雨雪天气
            case 6:
            case 7:
            case 8:
                condImage = [UIImage imageNamed:@"yujiaxue"];
                break;
                // 霾/扬沙/浮尘/沙尘暴/强沙尘暴
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
                condImage = [UIImage imageNamed:@"mai"];
                break;
                // 小雨
            case 14:
                condImage = [UIImage imageNamed:@"xiaoyu"];
                break;
                // 中雨/大雨/极端降雨/暴雨/大暴雨/特大暴雨
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
                condImage = [UIImage imageNamed:@"zhong_dayu"];
                break;
                // 小雪
            case 21:
                condImage = [UIImage imageNamed:@"xiaoxue"];
                break;
                // 中雪/大雪/暴雪
            case 22:
            case 23:
            case 24:
                condImage = [UIImage imageNamed:@"zhong_daxue"];
                break;
                // 少云
            case 25:
                condImage = [UIImage imageNamed:@"shaoyun"];
                break;
                
        }
    return condImage;
}

+ (UIImage *)imageAtIndex:(NSInteger)index
{
    UIImage *image = [[UIImage alloc] init];
    
    switch (index) {
        case 0:
            image = [UIImage imageNamed:@"comf"];
            break;
        case 1:
            image = [UIImage imageNamed:@"cw"];
            break;
        case 2:
            image = [UIImage imageNamed:@"drsg"];
            break;
        case 3:
            image = [UIImage imageNamed:@"flu"];
            break;
        case 4:
            image = [UIImage imageNamed:@"sport"];
            break;
        case 5:
            image = [UIImage imageNamed:@"trav"];
            break;
        case 6:
            image = [UIImage imageNamed:@"uv"];
            break;
    }
    return image;
}


+ (UIImage *)cityManageCellCondImageFromCondString:(NSString *)condString WithTime:(BOOL)isDay
{
    UIImage *condImage = [[UIImage alloc] init];
    condImage = [UIImage imageNamed:@"weizhi"];
    
    NSArray *condArray = [NSArray arrayWithObjects:@"阵雨",@"多云",@"晴间多云",@"阴",@"晴",@"雷阵雨",@"雨夹雪",@"阵雨夹雪",@"雨雪天气",@"霾",@"扬沙",@"浮尘",@"沙尘暴",@"强沙尘暴",@"小雨",@"中雨",@"大雨",@"极端降雨",@"暴雨",@"大暴雨",@"特大暴雨",@"小雪",@"中雪",@"大雪",@"暴雪",@"少云",nil];
    
    NSInteger index = [condArray indexOfObject:condString];
    
    if (isDay) {
        switch (index) {
                // 阵雨
            case 0:
                condImage = [UIImage imageNamed:@"citymanagement_icon_shower"];
                break;
                // 多云
            case 1:
            case 2:
                condImage = [UIImage imageNamed:@"citymanagement_icon_clound"];
                break;
                // 阴
            case 3:
                condImage = [UIImage imageNamed:@"citymanagement_icon_overcast"];
                break;
                // 晴
            case 4:
                condImage = [UIImage imageNamed:@"citymanagement_icon_sunny"];
                break;
                // 雷阵雨
            case 5:
                condImage = [UIImage imageNamed:@"citymanagement_icon_thundershower"];
                break;
                // 雨夹雪/阵雨夹雪/雨雪天气
            case 6:
            case 7:
            case 8:
                condImage = [UIImage imageNamed:@"citymanagement_icon_sleet"];
                break;
                // 霾/扬沙/浮尘/沙尘暴/强沙尘暴
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
                condImage = [UIImage imageNamed:@"citymanagement_icon_haze"];
                break;
                // 小雨
            case 14:
                condImage = [UIImage imageNamed:@"citymanagement_icon_rain"];
                break;
                // 中雨/大雨/极端降雨/暴雨/大暴雨/特大暴雨
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
                condImage = [UIImage imageNamed:@"citymanagement_icon_heavyrain"];
                break;
                // 小雪
            case 21:
                condImage = [UIImage imageNamed:@"citymanagement_icon_snow"];
                break;
                // 中雪/大雪/暴雪
            case 22:
            case 23:
            case 24:
                condImage = [UIImage imageNamed:@"citymanagement_icon_heavysnow"];
                break;
                // 少云
            case 25:
                condImage = [UIImage imageNamed:@"citymanagement_icon_partlyclound"];
                break;
                
        }
    }else{
        condImage = [UIImage imageNamed:@"citymanagement_icon_night"];
        if ([condString isEqualToString:@"多云"]) {
            condImage = [UIImage imageNamed:@"citymanagement_icon_nightcloundy"];
        }
    }
    
    return condImage;

}

@end
