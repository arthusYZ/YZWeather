//
//  Update.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/8.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "Update.h"
#import "NSDate+MJ.h"
#import "MJExtension.h"

@implementation Update

- (NSString *)loc
{
    NSRange range = [_loc rangeOfString:@"发布"];
    if (range.location == NSNotFound) {
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
        NSDate *updatedDate = [fmt dateFromString:_loc];
        
        // 2..判断微博发送时间 和 现在时间 的差距
        if (updatedDate.isToday) { // 今天
            if (updatedDate.deltaWithNow.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前发布", updatedDate.deltaWithNow.hour];
            } else if (updatedDate.deltaWithNow.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前发布", updatedDate.deltaWithNow.minute];
            } else {
                return @"刚刚发布";
            }
        } else if (updatedDate.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm发布";
            return [fmt stringFromDate:updatedDate];
        } else if (updatedDate.isThisYear) { // 今年(至少是前天)
            fmt.dateFormat = @"MM-dd HH:mm发布";
            return [fmt stringFromDate:updatedDate];
        } else { // 非今年
            fmt.dateFormat = @"yyyy-MM-dd HH:mm发布";
            return [fmt stringFromDate:updatedDate];
        }
    }else
    {
        return _loc;
    }
}

MJCodingImplementation

@end
