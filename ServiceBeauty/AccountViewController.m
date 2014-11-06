//
//  AccountViewController.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/1.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "AccountViewController.h"
#import "BeautyUtility.h"
#import "AccountTableViewCell.h"

float  const LabelHeight = 15.0f;

@interface AccountViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView        *_TopView;
    UILabel       *_Title;
    UIImageView   *_Icon;
    UILabel       *_Name;
    UILabel       *_Privilege;
    UILabel       *_Tota;
    UITableView   *_TableView;
    NSArray       *_Array;
}
@end

@implementation AccountViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
    [self topview];
    [self buttons];
    [self tableview];
}

-(void)topview
{
    _TopView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 155.0f)];
    _TopView.backgroundColor = [UIColor colorWithRed:221/255.0f green:46/255.0f blue:107/255.0f alpha:1.0];
    [self.view addSubview:_TopView];
    
    _Title = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth- 100)/2, 20, 100, 44)];
    _Title.text = @"我的账户";
    _Title.textAlignment = NSTextAlignmentCenter;
    _Title.backgroundColor = [UIColor clearColor];
    _Title.textColor = [UIColor whiteColor];
    _Title.font = [UIFont systemFontOfSize:20.0f];
    [_TopView addSubview:_Title];
    
    _Icon = [[UIImageView alloc]initWithFrame:CGRectMake(15.0f, 70.0f, 65.0f, 65.0f)];
    _Icon.image = [UIImage imageNamed:@"icon.jpg"];
    _Icon.backgroundColor = [UIColor clearColor];
    _Icon.layer.cornerRadius = 65/2;
    _Icon.layer.borderWidth = 5.0f;
    _Icon.layer.borderColor = [[UIColor colorWithRed:198/255.0f green:44/255.0f blue:101/255.0f alpha:1.0] CGColor];
    _Icon.contentMode = UIViewContentModeScaleAspectFit;
    _Icon.layer.masksToBounds = YES;
    [_TopView addSubview:_Icon];
    
    _Name = [[UILabel alloc]initWithFrame:CGRectMake(90.0f, 75.0f, 100.0f, LabelHeight)];
    _Name.backgroundColor = [UIColor clearColor];
    _Name.textColor = [UIColor whiteColor];
    _Name.font = [UIFont systemFontOfSize:15.0f];
    _Name.text = @"帅到被人砍";
    _Name.textAlignment = NSTextAlignmentLeft;
    [_TopView addSubview:_Name];
    
    float y = _Name.frame.origin.y+LabelHeight+10;
    
    _Privilege = [[UILabel alloc]initWithFrame:CGRectMake(90.0f,y, 100.0f, LabelHeight)];
    _Privilege.backgroundColor = [UIColor clearColor];
    _Privilege.textColor = [UIColor colorWithRed:238/255.0f green:178/255.0f blue:197/255.0f alpha:1.0];
    _Privilege.font = [UIFont systemFontOfSize:14.0f];
    _Privilege.text = @"我的优惠劵:1";
    _Privilege.textAlignment = NSTextAlignmentLeft;
    [_TopView addSubview:_Privilege];
    
     y = y+LabelHeight+5;
    
    _Tota = [[UILabel alloc]initWithFrame:CGRectMake(90.0f, y, 100.0f, LabelHeight)];
    _Tota.backgroundColor = [UIColor clearColor];
    _Tota.textColor = [UIColor colorWithRed:238/255.0f green:178/255.0f blue:197/255.0f alpha:1.0];
    _Tota.font = [UIFont systemFontOfSize:14.0f];
    _Tota.text = @"我的积分:60";
    _Tota.textAlignment = NSTextAlignmentLeft;
    [_TopView addSubview:_Tota];
    
    
}

-(void)buttons
{
    for (int i = 0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
         button.frame = CGRectMake(80*i, _TopView.frame.size.height, 80.0f, 55.0f);
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"button%d",i+1]] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(Touch:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
 
    
}

-(void)Touch:(UIButton*)sender
{
    switch (sender.tag) {
        case 0:
        {
            NSLog(@"我的订单");
        }
            break;
        case 1:
        {
            NSLog(@"我的收藏");
        }
            break;
        case 2:
        {
            NSLog(@"健康档案");
        }
            break;
        case 3:
        {
            NSLog(@"优惠劵");
        }
            break;
        default:
            break;
    }
}

-(void)tableview
{
    _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 210, ScreenWidth, ScreenHeight-210-49) style:UITableViewStylePlain];
    _TableView.backgroundColor = [UIColor clearColor];
    _TableView.delegate = self;
    _TableView.dataSource = self;
    _TableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_TableView];
    _Array = @[@"",@"个人资料",@"修改密码",@"我的积分",@"朋友圈",@"",@"我的邀请码",@"退出账户"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellId";
    AccountTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    if (cell ==nil) {
        cell = [[AccountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row!=0 && indexPath.row!=5) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.image = [NSString stringWithFormat:@"cell_icon_%d",indexPath.row];
        cell.text = [_Array objectAtIndex:indexPath.row];
    }
    else
    {
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row!=0 && indexPath.row!=5) {
        return 40.0f;
    }
    else
    {
        return 20.0f;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        NSLog(@"个人资料");
    }
    else if (indexPath.row == 2)
    {
        NSLog(@"修改密码");
    }
    else if (indexPath.row == 3)
    {
        NSLog(@"我的积分");
    }
    else if (indexPath.row == 4)
    {
        NSLog(@"朋友圈");
    }
    else if (indexPath.row == 6)
    {
        NSLog(@"我的邀请码");
    }
    else if (indexPath.row == 7)
    {
        NSLog(@"退出账户");
    }
 
}
@end
