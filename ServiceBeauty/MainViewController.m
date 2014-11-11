//
//  MainViewController.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/1.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "MainViewController.h"
#import "SubListViewController.h"
#import "BeautyMakeUpFootViewController.h"
#import "AdvitiseView.h"
#import "ListButton.h"

@interface MainViewController ()
{
    AdvitiseView *_adVitise;
}
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"美到家";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initAdvitiseView];
    [self initBusinessBtn];
    [self initCallComeBtn];
}

//获取广告图片
- (NSMutableArray *)getImgArr
{
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"1.jpg", @"image", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"2.jpg", @"image", nil];
    NSMutableArray *arr = [[NSMutableArray alloc]initWithObjects:dic1,dic2, nil];
    return arr;
}

- (void)initAdvitiseView
{
    _adVitise = [[AdvitiseView alloc]initWithFrame:self.view.frame];
    [_adVitise initImgArrAndUI:[self getImgArr]];
    _adVitise.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_adVitise];
}

//主页面的四个按钮
- (void)initBusinessBtn
{
    //造假数据
    NSDictionary  *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1.jpg", @"imageName", @"美容", @"lblName", nil];
    NSDictionary  *dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"2.jpg", @"imageName", @"美体", @"lblName", nil];
    NSDictionary  *dic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"2.jpg", @"imageName", @"美妆", @"lblName", nil];
    NSDictionary  *dic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1.jpg", @"imageName", @"美足", @"lblName", nil];
    
    NSArray *btnDicArr = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4, nil];
    
    for (int i = 0; i < 2; i++)
    {
        CGFloat btnWidth = self.view.frame.size.width/2-15;
        ListButton *t_btn = [[ListButton alloc]initBtnWithFrame:CGRectMake(i*btnWidth+(i+1)*10, 234, btnWidth, 122) andBgImg:[btnDicArr[i] objectForKey:@"imageName"]];
        t_btn.titleLabel.text = [btnDicArr[i] objectForKey:@"lblName"];
        t_btn.layer.cornerRadius = 5;
        t_btn.tag = 1000 + i;
        [t_btn initLblWithFrame:CGRectMake((btnWidth-60)*(1-i)+10, 83, 50, 30) andName:[btnDicArr[i] objectForKey:@"lblName"] andFontSize:20];
        
        [t_btn addTarget:self
                  action:@selector(btnClick:)
        forControlEvents:UIControlEventTouchUpInside];
        
        ListButton *t_btn1 = [[ListButton alloc]initBtnWithFrame:CGRectMake(i*btnWidth+(i+1)*10, 234+142, btnWidth, 122) andBgImg:[btnDicArr[i+2] objectForKey:@"imageName"]];
        t_btn1.tag = 1000 + i + 2;
        t_btn1.layer.cornerRadius = 5;
        t_btn1.titleLabel.text = [btnDicArr[i+2] objectForKey:@"lblName"];
        [t_btn1 initLblWithFrame:CGRectMake((btnWidth-60)*(1-i)+10, 14, 50, 30) andName:[btnDicArr[i+2] objectForKey:@"lblName"] andFontSize:20];
        [t_btn1 addTarget:self
                  action:@selector(btnClick:)
        forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:t_btn];
        [self.view addSubview:t_btn1];
    }
}

//随叫随到按钮初始化
- (void)initCallComeBtn
{
    UIButton *callComeBtn = [[UIButton alloc]init];
    callComeBtn.backgroundColor = [UIColor clearColor];
    [callComeBtn addTarget:self
                    action:@selector(btnClick:)
          forControlEvents:UIControlEventTouchUpInside];
    CGRect rect = self.view.frame;
    rect.origin.y = self.view.frame.size.height - 104;
    rect.origin.x = (self.view.frame.size.width-200)/2.0;
    rect.size.width = 200;
    rect.size.height = 44;
    callComeBtn.tag = 1004;
    callComeBtn.layer.cornerRadius = 5;
    callComeBtn.frame = rect;
    [callComeBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    callComeBtn.backgroundColor = [UIColor lightGrayColor];
    [callComeBtn setTitle:@"随叫随到" forState:UIControlStateNormal];
    [callComeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:callComeBtn];
}

//按钮点击事件
- (void)btnClick:(UIButton *)sender
{
    NSInteger btnTag = sender.tag - 1000;
    switch (btnTag) {
        case 0:
        case 1:
            [self pushToBusinessSubViewController:sender.titleLabel.text];
            break;
        case 2:
        case 3:
            [self pushToBeautyMakeUpFootViewController:sender.titleLabel.text];
            break;
        case 4:
            //随叫随到入口
            
            break;
    }
}

#pragma mark - push

- (void)pushToBusinessSubViewController:(NSString *)serViceName
{
    SubListViewController *subListView = [[SubListViewController alloc]initWithBeatySerViceName:serViceName];
    [self.navigationController pushViewController:subListView animated:YES];
}

- (void)pushToBeautyMakeUpFootViewController:(NSString *)serViceName
{
    BeautyMakeUpFootViewController *beautyView = [[BeautyMakeUpFootViewController alloc]initWithBeatySerViceName:serViceName];
    [self.navigationController pushViewController:beautyView animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
