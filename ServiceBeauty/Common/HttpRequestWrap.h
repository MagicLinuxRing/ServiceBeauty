//
//  RequestWrap.h
//  HttpRequest
//
//  Created by wangyu on 10-10-19.
//  Copyright 2010 epro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface HttpRequestWrap : NSObject {
	ASIHTTPRequest *request;
	id requestDelegate;
	SEL didFinishSelector;
	SEL didFailSelector;
}

@property (retain, nonatomic) id requestDelegate;
@property SEL didFinishSelector;
@property SEL didFailSelector;

- (id) initWithUrl:(NSString *)urlString;
- (void)addRequestHeader:(NSString *)header value:(NSString *)value;
- (void)setHTTPBody:(NSData *)data;
- (void)send;

@end
