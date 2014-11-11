//
//  CollectViewController.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-11.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "CollectViewController.h"
#import "BeautyUtility.h"
#import "CollectTableViewCell.h"
@interface CollectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_collectTableview;
    NSArray *_collectArray;
}
@end

@implementation CollectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      _collectArray = @[
                       @{
                         @"id":  @"",
                       @"name":  @"杨晓芸",
                     @"avatar":  @"",
                @"description":  @"专业美容师，经验丰富,专业美容师，经验丰富,专业美容师，经验丰富,专业美容师，经验丰富,专业美容师，经验丰富",
                       @"star":  @"4"
                         },
                       @{
                         @"id":  @"",
                       @"name":  @"李小路",
                     @"avatar":  @"",
                @"description":  @"专业美容师，经验丰富",
                       @"star":  @"5"
                           }
                       ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"我的收藏";
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake(0, 0, 40, 40);
    leftbutton.backgroundColor = [UIColor clearColor];
    [leftbutton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftbuttonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = leftbuttonItem;
    [self tableview];
}

-(void)tableview
{
    _collectTableview = [[UITableView alloc]initWithFrame:CGRectMake(0,0,ScreenWidth , ScreenHeight-49) style:UITableViewStylePlain];
    _collectTableview.backgroundColor = [UIColor clearColor];
    _collectTableview.dataSource = self;
    _collectTableview.delegate = self;
    _collectTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _collectTableview.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_collectTableview];
#if !__has_feature(objc_arc)
    [_collectTableview release];
#endif
    
}

#pragma -mark tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _collectArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier= @"CellId";
    CollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CollectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.dic = [_collectArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma -mark tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
