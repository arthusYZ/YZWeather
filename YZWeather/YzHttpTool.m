//
//  YzHttpTool.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/9.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "YzHttpTool.h"

@implementation YzHttpTool

+ (void)getWithURL:(NSString *)geturl params:(NSDictionary *)params success:(void (^)(id))success falure:(void (^)(NSError *))falure
{
    //创建http请求管理
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //发送get请求
    [mgr GET:geturl parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (falure) {
            falure(error);
        }
    }];
}

+(void)postWithURL:(NSString *)posturl params:(NSDictionary *)params success:(void (^)(id))success falure:(void (^)(NSError *))falure
{
    //创建http请求管理
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    //发送get请求
    [mgr POST:posturl parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (falure) {
            falure(error);
        }
    }];
}

@end
