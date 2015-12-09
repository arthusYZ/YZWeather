//
//  AqiButton.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/11.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "AqiButton.h"
#import "UIImage+YZ.h"

@implementation AqiButton

- (void)setAqi:(Aqi *)aqi
{
    _aqi = aqi;
    
    // 设置污染情况图标和背景
    NSString *qlty = aqi.city.qlty;
    UIImage *polluteIcon = [[UIImage alloc] init];
    UIImage *backGround = [[UIImage alloc] init];
    
    NSArray *qltyArray = [NSArray arrayWithObjects:@"优",@"良",@"轻度污染",@"中度污染",@"重度污染",@"严重污染",@"爆表", nil];
    
    NSInteger index = [qltyArray indexOfObject:qlty];
    
    switch (index) {
        // 空气质量优
        case 0:
            polluteIcon = [UIImage imageNamed:@"forecast_card_icon_pollute_optimal"];
            backGround = [UIImage resizeImage:@"forecast_minicard_pollute_background_optimal"];
            break;
        
        // 空气质量良
        case 1:
            polluteIcon = [UIImage imageNamed:@"forecast_card_icon_pollute_optimal"];
            backGround = [UIImage resizeImage:@"forecast_minicard_pollute_background_good"];
            break;
        
        // 空气质量轻度污染
        case 2:
            polluteIcon = [UIImage imageNamed:@"forecast_card_icon_pollute_moderate"];
            backGround = [UIImage resizeImage:@"forecast_minicard_pollute_background_light"];
            break;
            
        // 空气质量中度污染
        case 3:
            polluteIcon = [UIImage imageNamed:@"forecast_card_icon_pollute_moderate"];
            backGround = [UIImage resizeImage:@"forecast_minicard_pollute_background_moderate"];
            break;
          
        // 空气质量重度污染
        case 4:
            polluteIcon = [UIImage imageNamed:@"forecast_card_icon_pollute_heavy"];
            backGround = [UIImage resizeImage:@"forecast_minicard_pollute_background_heavy"];
            break;
            
        // 空气质量严重污染
        case 5:
            polluteIcon = [UIImage imageNamed:@"forecast_card_icon_pollute_bader"];
            backGround = [UIImage resizeImage:@"forecast_minicard_pollute_background_bad"];
            break;
            
        // 空气质量爆表
        case 6:
            polluteIcon = [UIImage imageNamed:@"forecast_card_icon_pollute_bader"];
            backGround = [UIImage resizeImage:@"forecast_minicard_pollute_background_bader"];
            break;
    }
    
    [self setImage:polluteIcon forState:UIControlStateNormal];
    [self setBackgroundImage:backGround forState:UIControlStateNormal];
    
    self.titleLabel.font = aqiFont;
    
    
}

@end
