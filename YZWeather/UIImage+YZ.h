//
//  UIImage+YZ.h
//  0831 - YZweibo
//
//  Created by 杨舟 on 15/9/8.
//  Copyright (c) 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YZ)

+ (UIImage *)resizeImage:(NSString *)image;
+ (UIImage *)resizeImage:(NSString *)imageName left:(float)left top:(float)top;

/**
 *  根据白天空气状况文字返回白天天气状况图片
 *
 *  @param condString 天气状况描述文字
 *
 *  @return 天气状况图片
 */
+ (UIImage *)dayCondImageFromString:(NSString *)condString;
/**
 *  根据夜间空气状况文字返回夜间天气状况图片
 *
 *  @param condString 天气状况描述文字
 *
 *  @return 天气状况图片
 */
+ (UIImage *)nightCondImageFromString:(NSString *)condString;

+ (UIImage *)navImageFromBackGroundImage:(NSString *)backGroundImageName;

+ (UIImage *)imageAtIndex:(NSInteger )index;

+ (UIImage *)cityManageCellCondImageFromCondString:(NSString *)condString WithTime:(BOOL)isDay;

@end
