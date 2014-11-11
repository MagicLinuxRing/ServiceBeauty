//
//  BeautyUtility.h
//  ServiceBeauty
//
//  Created by Sun on 14-11-6.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//判断版本
#define systemVersion [[[UIDevice currentDevice]systemVersion]floatValue]

@interface BeautyUtility : NSObject

+(BeautyUtility*)sharedInstance;
+(id)allocWithZone:(struct _NSZone *)zone;

@end
