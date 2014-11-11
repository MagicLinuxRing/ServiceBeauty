//
//  MyOrderViewController.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-6.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "MyOrderViewController.h"
#import "BeautyUtility.h"
#import "OrderTableViewCell.h"

@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIButton    *_TodoButton;
    UIButton    *_DodidButton;
    UITableView *_TodoTableView;
    UITableView *_DodidTableView;
    NSArray     *_TodoArray;
}
@end

@implementation MyOrderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _TodoArray = @[
                                @{
                                  @"OrderNumber": @"8975712138",
                                  @"start_time":@"2014-10-21",
                                  @"name":@"杨晓云",
                                  @"project":@"美容",
                                  @"combo":@"至尊套餐",
                                  @"money":@"￥190",
                                  @"cancel":@"1",
                                  @"pay":@"0",
                                  @"comment":@"0"
                                  },
                                     @{@"OrderNumber": @"8975712139",
                                      @"start_time":@"2014-10-22",
                                      @"name":@"杨晓云",
                                      @"project":@"纤体",
                                      @"combo":@"至尊套餐",
                                      @"money":@"￥200",
                                      @"cancel":@"0",
                                      @"pay":@"0",
                                      @"comment":@"1"
                                      },
                                
                                @{
                                    @"OrderNumber": @"8975712137",
                                    @"start_time":@"2014-10-21",
                                    @"name":@"杨晓云",
                                    @"project":@"纤体",
                                    @"combo":@"至尊套餐",
                                    @"money":@"￥230",
                                    @"cancel":@"0",
                                    @"pay":@"0",
                                    @"comment":@"0"
                                    },
                                
                                @{@"OrderNumber": @"8975712136",
                                  @"start_time":@"2014-10-20",
                                  @"name":@"杨晓云",
                                  @"project":@"纤体",
                                  @"combo":@"标准套餐",
                                  @"money":@"￥200",
                                  @"cancel":@"1",
                                  @"pay":@"0",
                                  @"comment":@"1"
                                  }
            
                                ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"我的订单";
    self.view.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
    
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake(0, 0, 40, 40);
    leftbutton.backgroundColor = [UIColor clearColor];
    [leftbutton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *leftbuttonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = leftbuttonItem;
    [self segmentedview];
    [self todotableview];
}

-(void)todotableview
{
    _TodoTableView = [[UITableView alloc]initWithFrame:CGRectMake((ScreenWidth-300)/2, 64+32+6, 300, ScreenHeight - 64-32-49) style:UITableViewStylePlain];
    _TodoTableView.backgroundColor = [UIColor clearColor];
    _TodoTableView.showsVerticalScrollIndicator = NO;
    _TodoTableView.delegate = self;
    _TodoTableView.dataSource = self;
    _TodoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _TodoTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_TodoTableView];
    
#if !__has_feature(objc_arc)
    [_TodoTableView release];
#endif
}

-(void)dodidtableview
{
    _DodidTableView = [[UITableView alloc]initWithFrame:CGRectMake((ScreenWidth-300)/2, 64+32+6, 300, ScreenHeight - 64-32-49) style:UITableViewStylePlain];
    _DodidTableView.backgroundColor = [UIColor clearColor];
    _DodidTableView.showsVerticalScrollIndicator = NO;
    _DodidTableView.delegate = self;
    _DodidTableView.dataSource = self;
    _DodidTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _DodidTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_DodidTableView];
#if !__has_feature(objc_arc)
    [_DodidTableView release];
#endif
    
}

#pragma mark -Tableview Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _TodoArray.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _TodoTableView) {
        static NSString *CellIdentifier = @"TodoCellId";
        OrderTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:CellIdentifier];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.Cell_Type = ToDoCellType;
            cell.Dic = [_TodoArray objectAtIndex:indexPath.row];
           
        }
        
        return cell;
    }
    else if (tableView == _DodidTableView)
    {
        static NSString *CellIdentifier = @"DidCellId";
        OrderTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:CellIdentifier];
          [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell.Cell_Type = DidDoCellType;
            cell.Dic = [_TodoArray objectAtIndex:indexPath.row];
            
        }
        return cell;
    }
    return 0;
}

#pragma mark -Tableview Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
}

-(void)segmentedview
{
    _DodidButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _DodidButton.frame = CGRectMake(0,64, (ScreenWidth/2)-1, 32);
    _DodidButton.backgroundColor = [UIColor colorWithRed:214/255.0f green:214/255.0f blue:213/255.0f alpha:1.0];
    [_DodidButton setTitle:@"已消费(0)" forState:UIControlStateNormal];
    _DodidButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
     [_DodidButton setTitleColor:[UIColor colorWithRed:90/255.0f green:84/255.0f blue:74/255.0f alpha:1.0]
                        forState:UIControlStateNormal];
    _DodidButton.tag = 100 ;
    [_DodidButton addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_DodidButton];
    
    _TodoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _TodoButton.frame = CGRectMake(ScreenWidth/2,64, (ScreenWidth/2)-1, 32);
    _TodoButton.backgroundColor = [UIColor colorWithRed:214/255.0f green:214/255.0f blue:213/255.0f alpha:1.0];
    [_TodoButton setTitle:@"待消费(0)" forState:UIControlStateNormal];
    _TodoButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [_TodoButton setTitleColor:[UIColor colorWithRed:209/255.0f green:23/255.0f blue:95/255.0f alpha:1.0]
                      forState:UIControlStateNormal];
    _TodoButton.tag = 101 ;
    [_TodoButton addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:_TodoButton];
}

-(void)segmentAction:(UIButton*)sender
{
    switch (sender.tag) {
        case 100:
        {
            NSLog(@"已消费");
         
             [_DodidButton setTitleColor:[UIColor colorWithRed:209/255.0f green:23/255.0f blue:95/255.0f alpha:1.0]
                                forState:UIControlStateNormal];
            
              [_TodoButton setTitleColor:[UIColor colorWithRed:90/255.0f green:84/255.0f blue:74/255.0f alpha:1.0]
                                forState:UIControlStateNormal];
            if (_DodidTableView ==nil) {
                [self dodidtableview];
            }
            _DodidTableView.hidden = NO;
            _TodoTableView.hidden = YES;
        }
            break;
        case 101:
        {
            NSLog(@"待消费");
            [_DodidButton setTitleColor:[UIColor colorWithRed:90/255.0f green:84/255.0f blue:74/255.0f alpha:1.0]
                               forState:UIControlStateNormal];
            
            [_TodoButton setTitleColor:[UIColor colorWithRed:209/255.0f green:23/255.0f blue:95/255.0f alpha:1.0]
                              forState:UIControlStateNormal];
            
            _DodidTableView.hidden = YES;
            _TodoTableView.hidden = NO;
        }
            break;
    }
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
