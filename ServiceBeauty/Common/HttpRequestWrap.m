//
//  RequestWrap.m
//  HttpRequest
//
//  Created by wangyu on 10-10-19.
//  Copyright 2010 epro. All rights reserved.
//

#import "HttpRequestWrap.h"
#define kHttpTimeout 60.0f

@implementation HttpRequestWrap

@synthesize requestDelegate;
@synthesize didFinishSelector;
@synthesize didFailSelector;

- (id) initWithUrl:(NSString *)urlString
{
	NSLog(@"HttpRequestWrap:alloc");
	NSURL *url = [NSURL URLWithString: urlString];
	
	[ASIHTTPRequest setDefaultTimeOutSeconds:kHttpTimeout];
	request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request setDidFailSelector:@selector(postFailed:)];
	[request setDidFinishSelector:@selector(postFinished:)];
	return self;
}

- (void)addRequestHeader:(NSString *)header value:(NSString *)value
{
	if (value) {
		[request addRequestHeader:header value:value];
	}
}

- (void)setHTTPBody:(NSData *)data
{
	[request appendPostData:data];
}

- (void)send
{
	[request startAsynchronous];
	[self retain];
}

- (void)postFailed:(ASIHTTPRequest *)theRequest
{
	if (self.requestDelegate && [self.requestDelegate respondsToSelector:didFailSelector]) 
	{
		[self.requestDelegate performSelector:didFailSelector withObject:theRequest.error];
	}
	
	[requestDelegate release];
	[self release];
}

- (void)postFinished:(ASIHTTPRequest *)theRequest
{
	NSString *cookie_ = [[theRequest requestHeaders] objectForKey:@"Set-Cookie"];
	if (cookie_ != nil && (NSNull *)cookie_ != [NSNull null]) {
//		gCookie = [cookie_ retain];
	}

	//NSString *s = [[NSString alloc] initWithData: [theRequest responseData] encoding: NSUTF8StringEncoding];
	NSLog(@"HttpRequestWrap:requestDelegate=%@", self.requestDelegate);
	if (self.requestDelegate && [self.requestDelegate respondsToSelector:didFinishSelector]) 
	{
		[self.requestDelegate performSelector:didFinishSelector withObject:[theRequest responseData]];
	}
	[requestDelegate release];
	[self release];
}

- (void) dealloc
{
	NSLog(@"HttpRequestWrap-dealloc");
	[request setDelegate:nil];
	[request cancel];
//	[request release];
    requestDelegate = nil;
	request = nil;
	[super dealloc];
}

@end
