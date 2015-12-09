//
//  SuggestionFrame.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/18.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Suggestion.h"

@interface SuggestionFrame : NSObject

@property (nonatomic ,strong ) Suggestion *suggestion;

@property (nonatomic ,assign ) CGFloat cellHeight;

@property (nonatomic ,assign ) CGRect lifeLableFrame;

@property (nonatomic ,assign ) CGRect horizontalDeviderFrame;

//@property (nonatomic ,assign ) CGRect comfViewFrame;
//
//@property (nonatomic ,assign ) CGRect cwViewFrame;
//
//@property (nonatomic ,assign ) CGRect drsgViewFrame;
//
//@property (nonatomic ,assign ) CGRect fluViewFrame;
//
//@property (nonatomic ,assign ) CGRect sportViewFrame;
//
//@property (nonatomic ,assign ) CGRect travViewFrame;
//
//@property (nonatomic ,assign ) CGRect uvViewFrame;

@property (nonatomic ,strong ) NSArray *viewsFrameArray;

@end
