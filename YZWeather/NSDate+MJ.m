//
//  NSDate+MJ.m
//  ItcastWeibo
//
//  Created by apple on 14-5-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NSDate+MJ.h"

@implementation NSDate (MJ)
/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return
    (selfCmps.year == nowCmps.year) &&
    (selfCmps.month == nowCmps.month) &&
    (selfCmps.day == nowCmps.day);
}

/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
//    
//    // 1.获得当前时间的年月日
//    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
//    
//    // 2.获得self的年月日
//    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
//    return
//    (selfCmps.year == nowCmps.year) &&
//    (selfCmps.month == nowCmps.month) &&
//    (selfCmps.day == nowCmps.day);
    return NO;
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

+ (NSString *)weekdayStringFromDate:(NSDate *)inputDate
{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

+ (NSString *)weekDayFromDate:(NSString *)date
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
    NSDate *forecastDate = [fmt dateFromString:date];
    
    if (forecastDate.isToday) {
        return @"今天";
    }
    return [NSDate weekdayStringFromDate:forecastDate];
}

+ (NSString *)monthDateFromDate:(NSString *)date
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
    NSDate *forecastDate = [fmt dateFromString:date];
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"MM/dd"];
    
    return [outputFormatter stringFromDate:forecastDate];
}

+ (BOOL)isDayTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH"];
    NSString *str = [formatter stringFromDate:[NSDate date]];
    int time = [str intValue];
    if (time>=18||time<=06) {
        return NO;
    }
    else{
        return YES;
    }
}

@end
