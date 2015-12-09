//
//  YzHttpTool.h
//  YZWeather
//
//  Created by 杨舟 on 15/11/9.
//  Copyright © 2015年 Yang. All rights reserved.
//  封装AFN

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface YzHttpTool : NSObject
/**
 *  发送get请求
 *
 *  @param url     get请求API链接
 *  @param params  请求体
 *  @param success 成功后执行
 *  @param error   失败后执行
 */
+ (void)getWithURL:(NSString *)geturl params:(NSDictionary *)params success:(void(^)(id responseObject))success falure:(void(^)(NSError *error))falure;
/**
 *  发送post请求
 *
 *  @param url     post请求API链接
 *  @param params  请求体
 *  @param success 成功后执行
 *  @param error   失败后执行
 */
+ (void)postWithURL:(NSString *)posturl params:(NSDictionary *)params success:(void(^)(id responseObject))success falure:(void(^)(NSError *error))falure;

@end
