//
//  SubListViewController.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/2.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "SubListViewController.h"
#import "BookServiceViewController.h"
#import "SubListView.h"

@interface SubListViewController ()<ServiceBeautyDelegate>
{
    NSMutableArray *_beatyListArr;
}
@end

@implementation SubListViewController

- (id)initWithBeatySerViceName:(NSString *)serviceName
{
    self = [super init];
    if (self)
    {
        self.title = serviceName;
        [self createBeautyServiceListArr];
    }
    return self;
}

//造假数据
- (void)createBeautyServiceListArr
{
    NSDictionary *dic1,*dic2,*dic3,*dic4;
    if ([self.title isEqualToString:@"美容"])
    {
        dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"水嫩保湿",@"leftLbl",@"123456",@"bgLColor",@"紧致抗皱", @"rightLbl",@"234566",@"bgRColor",nil];
        dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"魅力美白",@"leftLbl",@"123456",@"bgLColor",@"控油祛痘", @"rightLbl",@"234566",@"bgRColor",nil];
        dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"舒敏修复",@"leftLbl",@"123456",@"bgLColor",@"RF射频", @"rightLbl",@"234566",@"bgRColor",nil];
        dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"眼部护理",@"leftLbl",@"123456",@"bgLColor",@"颈部护理", @"rightLbl",@"234566",@"bgRColor",nil];
        
    }
    else
    {
        dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"全身嫩肤",@"leftLbl",@"123456",@"bgLColor",@"淋巴排毒", @"rightLbl",@"234566",@"bgRColor",nil];
        dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"暖宫养巢",@"leftLbl",@"123456",@"bgLColor",@"手部护理", @"rightLbl",@"234566",@"bgRColor",nil];
        dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"肾部护理",@"leftLbl",@"123456",@"bgLColor",@"局部瘦身", @"rightLbl",@"234566",@"bgRColor",nil];
        dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"健康美胸",@"leftLbl",@"123456",@"bgLColor",@"肩颈舒压", @"rightLbl",@"234566",@"bgRColor",nil];
    }
    _beatyListArr = [[NSMutableArray alloc] initWithObjects:dic1,dic2,dic3,dic4, nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSublistView];
}

- (void)createSublistView
{
    SubListView *subView = [[SubListView alloc]initCurrentViewData:_beatyListArr];
    subView.serviceBeautyDelegate = self;
    [self.view addSubview:subView];
}

- (void)backForBeautyService:(NSDictionary *)dic
{
    BookServiceViewController *serviceView = [[BookServiceViewController alloc]init];
    [self.navigationController pushViewController:serviceView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end
