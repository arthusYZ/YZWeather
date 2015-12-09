//
//  VoiceButton.m
//  YZWeather
//
//  Created by 杨舟 on 15/10/24.
//  Copyright © 2015年 Yang. All rights reserved.
//  语音选择按钮

#import "VoiceButton.h"

@implementation VoiceButton



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"forecast_navigationbar_icon_voice_normal"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"forecast_navigationbar_icon_voice_hilight"] forState:UIControlStateHighlighted];
        self.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
    }
    return self;
}



@end
