//
//  BaseNavigationController.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-4.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BeautyUtility.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (systemVersion>6.9) {
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:220/255.0f green:48/255.0f blue:105/255.0f alpha:1.0]];
    }
    else{
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           UITextAttributeTextColor:[UIColor whiteColor],
                                                           UITextAttributeFont:[UIFont systemFontOfSize:20.0f]
                                                           }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
