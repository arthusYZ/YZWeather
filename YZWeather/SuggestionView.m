//
//  SuggestionView.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/18.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "SuggestionView.h"

@interface SuggestionView ()

@property (nonatomic ,weak ) UIImageView *imageView;

@property (nonatomic ,weak ) UILabel *textView;

@end

@implementation SuggestionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UILabel *textView = [[UILabel alloc] init];
        textView.font = timefont;
        textView.textColor = white;
        [self addSubview:textView];
        self.textView = textView;
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (void)setViewFrame:(ViewFrame *)viewFrame
{
    _viewFrame = viewFrame;
    
    _text = viewFrame.text;
    self.textView.text = viewFrame.brf;
    self.imageView.frame = viewFrame.imageViewFrame;
    self.textView.frame = viewFrame.brfLableFrame;
}


@end
