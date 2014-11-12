//
//  BeautyServiceRequest.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/12.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "BeautyServiceRequest.h"
#import "HttpRequestWrap.h"

@implementation BeautyServiceRequest

+ (id)shareInstance
{
    static BeautyServiceRequest *request = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
                request = [[BeautyServiceRequest alloc]init];
    });
    return request;
}

- (void)initWithUrl:(NSString *)urlStr andBlock:(ServiceBlock)completionBlock
{
    HttpRequestWrap *requestWrap = [[HttpRequestWrap alloc]initWithUrl:urlStr];
    requestWrap.requestDelegate = self;
    requestWrap.didFinishSelector = @selector(didFinishSelector:);
    requestWrap.didFailSelector = @selector(didFailSelector);
    
}

@end
