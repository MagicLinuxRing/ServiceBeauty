//
//  BeautyServiceRequest.h
//  ServiceBeauty
//
//  Created by king jack on 14/11/12.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ServiceBlock)(id response,NSError *error);

@interface BeautyServiceRequest : NSObject


- (void)initWithUrl:(NSString *)urlStr andBlock:(ServiceBlock)completionBlock;

@end
