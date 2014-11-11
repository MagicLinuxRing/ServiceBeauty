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

static BOOL FIRSTTIME = YES;

@interface MainTabBarViewController ()
{
    UIImageView *slideBg;
    UIImageView *backGroundImageView;
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (FIRSTTIME) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"hideCustomTabBar" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(hideCustomTabBar)
                                                     name:@"hideCustomTabBar"
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"bringCustomTabBarToFront" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(bringCustomTabBarToFront)
                                                     name:@"bringCustomTabBarToFront"
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"setBadge" object:nil];
        
        slideBg = [[UIImageView alloc] init];
        [self hideRealTabBar];
        [self _initTabbarView];
        FIRSTTIME = NO;
    }
}

//隐藏自定义tabbar
- (void)hideCustomTabBar {
    [self performSelector:@selector(hideRealTabBar)];
    CAKeyframeAnimation *animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.1;
    animation.delegate = self;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]];
    animation.values = values;
    [_tabbarView.layer addAnimation:animation forKey:nil];
}

- (void)bringCustomTabBarToFront {
    //[self performSelector:@selector(hideRealTabBar)];
    [_tabbarView setHidden:NO];
    CAKeyframeAnimation *animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.25;
    animation.delegate = self;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [_tabbarView.layer addAnimation:animation forKey:nil];
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

//隐藏tabbar
- (void)hideRealTabBar {
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[UITabBar class]])
        {
            view.hidden = YES;
            break;
        }
    }
}

-(void)selectedTab:(UIButton*)sender
{
    if (self.selectedIndex == sender.tag)
    {
        [[self.viewControllers objectAtIndex:sender.tag] popToRootViewControllerAnimated:YES];
        return;
    }
    NSInteger tag = sender.tag;
    self.selectedIndex = tag;
}

@end
