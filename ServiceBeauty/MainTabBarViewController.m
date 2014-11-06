//
//  MainTabBarViewController.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-4.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainViewController.h"
#import "ShareViewController.h"
#import "IntroductionViewController.h"
#import "AccountViewController.h"
#import "BaseNavigationController.h"
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//判断版本
#define systemVersion [[[UIDevice currentDevice]systemVersion]floatValue]

@interface MainTabBarViewController ()
{
    UIView *_tabbarView;
}
@end

@implementation MainTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBar setHidden:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _initViewController];
    [self _initTabbarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化子控制器
-(void)_initViewController
{
    MainViewController *mainView = [[MainViewController alloc]init];
    
    ShareViewController *shareView = [[ShareViewController alloc]init];
    
    IntroductionViewController *introductionView = [[IntroductionViewController alloc]init];
    
    AccountViewController *accountView = [[AccountViewController alloc]init];
    
    NSArray *array = @[mainView,shareView,introductionView,accountView];
    NSMutableArray *viewcontrollers = [NSMutableArray arrayWithCapacity:4];
    for (UIViewController *viewcontroller in array) {
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:viewcontroller];
        [viewcontrollers addObject:nav];
    }
    self.viewControllers = viewcontrollers;
}

//创建自定义tabBar
-(void)_initTabbarView
{
    float Y = systemVersion>6.9?ScreenHeight-49:ScreenHeight-49-20;
    _tabbarView = [[UIView alloc]initWithFrame:CGRectMake(0, Y, ScreenWidth, 49)];
    [self.view addSubview:_tabbarView];
    
    UIImageView *tabbarGroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_background.png"]];
    tabbarGroundImage.frame = _tabbarView.bounds;
    [_tabbarView addSubview:tabbarGroundImage];
    
    NSArray *backgroud = @[@"tabbar_home.png",
                           @"tabbar_message_center.png",
                           @"tabbar_profile.png",
                           @"tabbar_discover.png"];
   
    NSArray *heightBackground =@[@"tabbar_home_highlighted.png",
                                 @"tabbar_message_center_highlighted.png",
                                 @"tabbar_profile_highlighted.png",
                                 @"tabbar_discover_highlighted.png"];
    
    NSArray *titles = @[@"首页",@"分享",@"介绍",@"我的"];
    
    for (int i = 0; i<titles.count; i++) {
        NSString *backImage = backgroud[i];
        NSString *heightImage = heightBackground[i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(ScreenWidth/8-15+(i*ScreenWidth/4),2.0, 30, 30);
        button.tag = i;
        [button setImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:heightImage] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/8-15+(i*ScreenWidth/4),35.0, 30, 12.0)];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.text = titles[i];
        title.font = [UIFont systemFontOfSize:12.0f];
        title.textColor = [UIColor whiteColor];
        [_tabbarView addSubview:title];
    }
    
    
}
-(void)selectedTab:(UIButton*)sender
{
    NSInteger tag = sender.tag;
    self.selectedIndex = tag;
    [self.navigationController popViewControllerAnimated:YES];
    self.selectedViewController = [self.viewControllers objectAtIndex:tag];
}
@end
