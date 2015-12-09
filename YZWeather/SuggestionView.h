//
//  SuggestionView.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/18.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewFrame.h"

@interface SuggestionView : UIView

@property (nonatomic ,copy ) ViewFrame *viewFrame;

@property (nonatomic ,copy ) NSString *text;

@property (nonatomic ,strong ) UIImage *image;

@end
