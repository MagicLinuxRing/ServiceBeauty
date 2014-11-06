//
//  BeautyUtility.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-6.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "BeautyUtility.h"

static BeautyUtility *_sharedintance = nil;

@implementation BeautyUtility
+(BeautyUtility*)sharedInstance
{
    @synchronized(self)
    {
        if (_sharedintance == nil) {
            _sharedintance = [[BeautyUtility alloc]init];
        }
    }
    return _sharedintance;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        if (_sharedintance==nil) {
            _sharedintance = [super allocWithZone:zone];
            return _sharedintance;
        }
    }
    return nil;
}

@end
