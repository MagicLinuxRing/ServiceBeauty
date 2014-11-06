//
//  SubListView.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/2.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "SubListView.h"

@interface SubListView()<UIGestureRecognizerDelegate,SelectBeautyServiceDelegate>
{
    NSString *_currentBeautyServiceName;
    UITableView *_tableView;
    SelectBeautyServiceView *_selectView;
}

@property (nonatomic,retain)NSMutableArray *beautyListArr;

@end

@implementation SubListView
@synthesize beautyListArr;
@synthesize serviceBeautyDelegate;

//开始接收当前视图的所有的数据
- (id)initCurrentViewData:(NSMutableArray *)arr
{
    self = [super init];
    if (self)
    {
        self.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-44);
        self.beautyListArr = arr;
        [self createTableView];
    }
    return self;

}

- (void)createTableView
{
    UITableView *t_tableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
    t_tableView.backgroundColor = [UIColor clearColor];
    t_tableView.dataSource = self;
    t_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    t_tableView.showsHorizontalScrollIndicator = NO;
    t_tableView.showsVerticalScrollIndicator = NO;
    t_tableView.delegate = self;
    t_tableView.backgroundView = nil;
    [self addSubview:t_tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"beautyListName";
    
    SubListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[SubListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.setBeautyCakedelegate = self;
    
    [cell setBtnAndLblValue:self.beautyListArr[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.beautyListArr count];
}

#pragma mark setBautylistDelegate
- (void)setBautyCakeChoise:(NSString *)beautyServiceName
{
    _selectView = [[SelectBeautyServiceView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeFromSublistView:)];
    tap.delegate = self;
    [_selectView addGestureRecognizer:tap];
    _selectView.selectBeautyServiceDelegate = self;
    _selectView.backgroundColor = [UIColor darkGrayColor];
    _selectView.alpha = 0.8;
    [[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:_selectView];
}

- (void)removeFromSublistView:(UITapGestureRecognizer *)gesture
{
    [_selectView removeFromSuperview];
}

#pragma mark selectBeautyServicePrice

- (void)selectBeautyServicePrice:(NSDictionary *)dic
{
    if (self.serviceBeautyDelegate && [self.serviceBeautyDelegate respondsToSelector:@selector(backForBeautyService:)])
    {
        [self.serviceBeautyDelegate backForBeautyService:dic];
    }
}

@end

@interface SelectBeautyServiceView()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView        *_pickerView;
    UIView              *_bgView;
    NSMutableArray      *_beautyListArr;
    NSArray             *_priceArr;
    NSInteger           currentIndex;
}
@end

@implementation SelectBeautyServiceView
@synthesize selectBeautyServiceDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createData];
        [self createBgView];
    }
    return self;
}

- (void)createData
{
    _beautyListArr = [[NSMutableArray alloc]init];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"标准",@"type",@"100元",@"price",nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"豪华",@"type",@"150元",@"price",nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"尊贵",@"type",@"180元",@"price",nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"至尊",@"type",@"200元",@"price",nil];
    
    _beautyListArr = [NSMutableArray arrayWithObjects:dic1,dic2,dic3,dic4, nil];
}

- (void)createBgView
{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(40, 240, [[UIScreen mainScreen]bounds].size.width-80, 260)];
    _bgView.layer.cornerRadius = 5;
    _bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView];
    
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, _bgView.frame.size.width, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font = [UIFont boldSystemFontOfSize:20];
    lbl.text = @"请选择";
    lbl.textColor = [UIColor blackColor];
    [_bgView addSubview:lbl];
    
    [self createPickerView];
    
    UIButton *okBtn = [[UIButton alloc]initWithFrame:CGRectMake(65, _bgView.frame.size.height - 40, _bgView.frame.size.width-130, 30)];
    okBtn.backgroundColor = [UIColor lightGrayColor];
    [okBtn setTitle:@"确认" forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(selectBeautyService) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:okBtn];
}

- (void)selectBeautyService
{
    if (selectBeautyServiceDelegate && [selectBeautyServiceDelegate respondsToSelector:@selector(selectBeautyServicePrice:)])
    {
        [self removeFromSuperview];
        [selectBeautyServiceDelegate selectBeautyServicePrice:nil];
    }
}

- (void)createPickerView
{
    _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(10, 20, self.frame.size.width-20, self.frame.size.height - 60)];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    
    [_bgView addSubview:_pickerView];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_beautyListArr count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [_beautyListArr[row] objectForKey:@"type"];
    }
    else
        return [[_beautyListArr objectAtIndex:row] objectForKey:@"price"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        [pickerView selectRow:row inComponent:1 animated:YES];
    }
    else
    {
        [pickerView selectRow:row inComponent:0 animated:YES];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIView *myView=[[UIView alloc] init];
    
    //指定视图frame
    myView.frame=CGRectMake(0, 0, 150, 30);
    
    UILabel *labelOnComponent=[[UILabel alloc] init];
    
    labelOnComponent.frame=myView.frame;
    labelOnComponent.tag=200;

    labelOnComponent.backgroundColor = [UIColor clearColor];
    labelOnComponent.font = [UIFont boldSystemFontOfSize:20];
    if (component == 0)
    {
        labelOnComponent.text = [[_beautyListArr objectAtIndex:row] objectForKey:@"type"];
    }
    else
    {
        labelOnComponent.text = [[_beautyListArr objectAtIndex:row] objectForKey:@"price"];
    }
    
    [myView addSubview:labelOnComponent];
    
    return myView;
}


@end






