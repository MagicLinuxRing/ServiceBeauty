//
//  MyOrderViewController.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-6.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "MyOrderViewController.h"
@interface MyOrderViewController ()

@end

@implementation MyOrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
     self.title = @"我的订单";
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake(0, 0, 40, 40);
    leftbutton.backgroundColor = [UIColor clearColor];
    [leftbutton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftbuttonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = leftbuttonItem;
}

-(void)toobar
{
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
