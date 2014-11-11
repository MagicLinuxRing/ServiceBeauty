//
//  BeautyMakeUpFootViewController.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/5.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "BeautyMakeUpFootViewController.h"
#import "BeautyMakeUpFootTableViewCell.h"

@interface BeautyMakeUpFootViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_standardServiceArr;
}
@end

@implementation BeautyMakeUpFootViewController

- (id)initWithBeatySerViceName:(NSString *)serviceName
{
    self = [super init];
    if (self)
    {
        self.title = serviceName;
        [self createDic];
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)createDic
{
    NSDictionary *dic1 = [NSDictionary  dictionaryWithObjectsAndKeys:@"1.jpg",@"image",
                          @"基础 180¥",@"standard",@"焕发青春靓丽光彩",@"serviceName", nil];
    
    NSDictionary *dic2 = [NSDictionary  dictionaryWithObjectsAndKeys:@"1.jpg",@"image",
                          @"豪华 180¥",@"standard",@"焕发青春靓丽光彩",@"serviceName", nil];
    
    NSDictionary *dic3 = [NSDictionary  dictionaryWithObjectsAndKeys:@"1.jpg",@"image",
                          @"尊贵 180¥",@"standard",@"焕发青春靓丽光彩",@"serviceName", nil];
    
    NSDictionary *dic4 = [NSDictionary  dictionaryWithObjectsAndKeys:@"1.jpg",@"image",
                          @"新娘甲 180¥",@"standard",@"焕发青春靓丽光彩",@"serviceName", nil];
    
    _standardServiceArr = [[NSMutableArray alloc]initWithObjects:dic1,dic2,dic3,dic4, nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *t_tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    t_tableView.backgroundColor = [UIColor clearColor];
    t_tableView.dataSource = self;
    t_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    t_tableView.showsHorizontalScrollIndicator = NO;
    t_tableView.showsVerticalScrollIndicator = NO;
    t_tableView.delegate = self;
    t_tableView.backgroundView = nil;
    [self.view addSubview:t_tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"beautyListName";
    
    BeautyMakeUpFootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[BeautyMakeUpFootTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    [cell createUIWithDic:_standardServiceArr[indexPath.row]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_standardServiceArr count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
