//
//  MySearchBar.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/26.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "MySearchBar.h"

@implementation MySearchBar

- (void)layoutSubviews
{
//    self.backgroundColor = [UIColor clearColor];
//    self.backgroundColor = white;
    UITextField *searchField;
//    NSUInteger numViews = [self.subviews[0].subviews count];
//    for(int i = 0; i < numViews; i++) {
//        if([[self.subviews[0].subviews objectAtIndex:i] isKindOfClass:[UITextField class]]) { //conform?
//            searchField = [self.subviews[0].subviews objectAtIndex:i];
//        }
//    }
    
    for (UIView *view in self.subviews[0].subviews) {
        if([view isKindOfClass:[UITextField class]]){
            searchField = view;
        }
        if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [view removeFromSuperview];
        }
    }
    
    if(!(searchField == nil)) {
//        searchField.textColor = [UIColor redColor];
//        [searchField setBackground: [UIImage imageNamed:@"citysearched_searchbox"] ];
        searchField.borderStyle = UITextBorderStyleNone;
        searchField.layer.cornerRadius = 5;
        searchField.clipsToBounds = YES;
        searchField.backgroundColor = RGBA(225, 225, 225, 1);
        [searchField setBorderStyle:UITextBorderStyleRoundedRect];
        UIImage *image = [UIImage imageNamed:@"city_search"];
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        searchField.leftView = iView;
//        [searchField setValue:[UIFont systemFontOfSize:10] forKeyPath:@"_placeholderLabel.font"];
    }
    
    [super layoutSubviews];
}

@end
