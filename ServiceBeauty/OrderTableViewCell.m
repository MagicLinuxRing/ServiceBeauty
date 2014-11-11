//
//  OrderTableViewCell.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-10.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell
{
    UIView *_backgroundView;
    UILabel *_OrderNumber;
    UILabel *_Time;
    UIImageView *_timeimageView;
    UIImageView *_arrowsView;
    UILabel *_Name;
    UILabel *_project;
    UILabel *_combo;
    UIView *_line;
    UILabel *_Money;
    UILabel *_sum;
    UIButton *_Cancel;
    UIButton *_pay;
    
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
          
         self.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
        _backgroundView = [[UIView alloc]initWithFrame:CGRectZero];
        _backgroundView.backgroundColor = [UIColor whiteColor];
        _backgroundView.layer.cornerRadius = 5.0f;
        _backgroundView.layer.borderColor = [[UIColor blackColor]CGColor];
        _backgroundView.layer.borderWidth = 0.5f;
        [self addSubview:_backgroundView];
        
        _OrderNumber = [[UILabel alloc]initWithFrame:CGRectZero];
        _OrderNumber.backgroundColor = [UIColor clearColor];
        _OrderNumber.textAlignment = NSTextAlignmentLeft;
        _OrderNumber.textColor = [UIColor colorWithRed:118/255.0f green:2/255.0f blue:17/255.0f alpha:1.0];
        _OrderNumber.font = [UIFont systemFontOfSize:14.0f];
        _OrderNumber.text = @"预约号:";
        [_backgroundView addSubview:_OrderNumber];
        
        _timeimageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _timeimageView.backgroundColor = [UIColor clearColor];
        _timeimageView.image = [UIImage imageNamed:@"time.png"];
        [_backgroundView addSubview:_timeimageView];
        
         _arrowsView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _arrowsView.backgroundColor = [UIColor clearColor];
        _arrowsView.image = [UIImage imageNamed:@"arrows.png"];
        [_backgroundView addSubview:_arrowsView];
        
        
        _Time = [[UILabel alloc]initWithFrame:CGRectZero];
        _Time.backgroundColor = [UIColor clearColor];
        _Time.textAlignment = NSTextAlignmentLeft;
        _Time.textColor = [UIColor grayColor];
        _Time.font = [UIFont systemFontOfSize:14.0f];
        [_backgroundView addSubview:_Time];
        
        _Name = [[UILabel alloc]initWithFrame:CGRectZero];
        _Name.backgroundColor = [UIColor clearColor];
        _Name.textAlignment = NSTextAlignmentLeft;
        _Name.textColor = [UIColor grayColor];
        _Name.font = [UIFont systemFontOfSize:14.0f];
        [_backgroundView addSubview:_Name];
        
        _project = [[UILabel alloc]initWithFrame:CGRectZero];
        _project.backgroundColor = [UIColor clearColor];
        _project.textAlignment = NSTextAlignmentLeft;
        _project.textColor = [UIColor grayColor];
        _project.font = [UIFont systemFontOfSize:14.0f];
        [_backgroundView addSubview:_project];
        
        _combo = [[UILabel alloc]initWithFrame:CGRectZero];
        _combo.backgroundColor = [UIColor clearColor];
        _combo.textAlignment = NSTextAlignmentLeft;
        _combo.textColor = [UIColor grayColor];
        _combo.font = [UIFont systemFontOfSize:14.0f];
        [_backgroundView addSubview:_combo];
        
        _line = [[UIView alloc]initWithFrame:CGRectZero];
        _line.backgroundColor = [UIColor grayColor];
        [_backgroundView addSubview:_line];
        
        
        _Money = [[UILabel alloc]initWithFrame:CGRectZero];
        _Money.backgroundColor = [UIColor clearColor];
        _Money.textAlignment = NSTextAlignmentLeft;
        _Money.textColor = [UIColor blackColor];
        _Money.font = [UIFont systemFontOfSize:18.0f];
        _Money.text = @"金额:";
        [_backgroundView addSubview:_Money];
        
        _sum = [[UILabel alloc]initWithFrame:CGRectZero];
        _sum.backgroundColor = [UIColor clearColor];
        _sum.textAlignment = NSTextAlignmentLeft;
        _sum.textColor = [UIColor colorWithRed:220/255.0f green:48/255.0f blue:105/255.0f alpha:1.0];
        _sum.font = [UIFont systemFontOfSize:18.0f];
        [_backgroundView addSubview:_sum];

        _Cancel = [UIButton buttonWithType:UIButtonTypeCustom];
        _Cancel.backgroundColor = [UIColor colorWithRed:116/255.0f green:115/255.0f blue:114/255.0f alpha:1.0];
        [_Cancel setTitle:@"取消预约" forState:UIControlStateNormal];
        _Cancel.layer.cornerRadius  = 2.0f;
        [_Cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _Cancel.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_Cancel addTarget:self action:@selector(del) forControlEvents:UIControlEventTouchUpInside];
        [_backgroundView addSubview:_Cancel];
        
        _pay = [UIButton buttonWithType:UIButtonTypeCustom];
        _pay.backgroundColor = [UIColor colorWithRed:220/255.0f green:48/255.0f blue:105/255.0f alpha:1.0];
        [_pay setTitle:@"去支付" forState:UIControlStateNormal];
        _pay.layer.cornerRadius = 2.0f;
        [_pay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_pay addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
        _pay.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_backgroundView addSubview:_pay];
        
    }
    return self;
}

-(void)layoutSubviews
{
    if (_Cell_Type == DidDoCellType)
    {
        _backgroundView.frame = CGRectMake(0, 0, self.frame.size.width, (self.frame.size.height - 10));
        float x = 5.0f;
        float y = 12.0f;
        _OrderNumber.frame = CGRectMake(5.0f, 12.0f, 130, 15.0f);
        x = x+_OrderNumber.frame.size.width+10;
        _timeimageView.frame = CGRectMake(x, y, 15.0f, 15.0f);
        x = x+_timeimageView.frame.size.width+2.0f;
        _Time.frame = CGRectMake(x, y, 100, 15.0f);
        y = y+_OrderNumber.frame.size.height+10;
        float z = 5.0f;
        _Name.frame = CGRectMake(z, y,50, 15.0f);
        z = z+_Name.frame.size.width+10.0f;
        _project.frame = CGRectMake(z, y,30, 15.0f);
        z = z+_project.frame.size.width+10.0f;
        _combo.frame = CGRectMake(z,y,60.0f, 15.0f);
        y = y+_combo.frame.size.height+10.0f;
        _line.frame = CGRectMake(4.0f,y,292, 1.0f);
        float a = 5.0f;
        y = y+11.0f;
        _Money.frame = CGRectMake(a, y, 50.0f, 18.0f);
        a = a+_Money.frame.size.width+10.0f;
        _sum.frame = CGRectMake(a, y, 60.0f, 18.0f);
        a = a+_sum.frame.size.width+100.0f;
        _pay.frame = CGRectMake(a, y-6.0f,70.0f, 28.0f);
        _arrowsView.frame = CGRectMake(270.0f, 27.0f, 15.0f, 20.0f);
    }
    else if (_Cell_Type == ToDoCellType)
    {
        _backgroundView.frame = CGRectMake(0, 0, self.frame.size.width, (self.frame.size.height - 10));
        float x = 5.0f;
        float y = 12.0f;
        _OrderNumber.frame = CGRectMake(5.0f, 12.0f, 130, 15.0f);
        x = x+_OrderNumber.frame.size.width+10;
        _timeimageView.frame = CGRectMake(x, y, 15.0f, 15.0f);
        x = x+_timeimageView.frame.size.width+2.0f;
        _Time.frame = CGRectMake(x, y, 100, 15.0f);
        y = y+_OrderNumber.frame.size.height+10;
        float z = 5.0f;
        _Name.frame = CGRectMake(z, y,50, 15.0f);
        z = z+_Name.frame.size.width+10.0f;
        _project.frame = CGRectMake(z, y,30, 15.0f);
        z = z+_project.frame.size.width+10.0f;
        _combo.frame = CGRectMake(z,y,60.0f, 15.0f);
        y = y+_combo.frame.size.height+10.0f;
        _line.frame = CGRectMake(4.0f,y,292, 1.0f);
        float a = 5.0f;
        y = y+11.0f;
        _Money.frame = CGRectMake(a, y, 50.0f, 18.0f);
        a = a+_Money.frame.size.width+10.0f;
        _sum.frame = CGRectMake(a, y, 60.0f, 18.0f);
        a = a+_sum.frame.size.width+30.0f;
        _Cancel.frame = CGRectMake(a,y-6.0f, 80, 28.0f);
        a = a+_Cancel.frame.size.width+10.0f;
        _pay.frame = CGRectMake(a, y-6.0f, 50.0f, 28.0f);
        _arrowsView.frame = CGRectMake(270.0f, 27.0f, 15.0f, 20.0f);
    }
}
-(void)setDic:(NSDictionary *)Dic
{
    if (_Dic!=Dic) {
#if !__has_feature(objc_arc)
        [_Dic release];
        [Dic retain];
#endif
        _Dic = Dic;
        _OrderNumber.text = [NSString stringWithFormat:@"预约号: %@",[_Dic valueForKey:@"OrderNumber"]];
        _Time.text = [_Dic valueForKey:@"start_time"];
        _Name.text = [_Dic valueForKey:@"name"];
        _project.text = [_Dic valueForKey:@"project"];
        _combo.text = [_Dic valueForKey:@"combo"];
        _sum.text = [_Dic valueForKey:@"money"];
        
        if (_Cell_Type == ToDoCellType) {
            if ([[_Dic valueForKey:@"cancel"]integerValue]) {
                _Cancel.hidden = NO;
            }
            else
            {
                _Cancel.hidden = YES;
            }
        }
        else if (_Cell_Type == DidDoCellType)
        {
            if ([[_Dic valueForKey:@"comment"]integerValue]) {
                [_pay setTitle:@"已评论" forState:UIControlStateNormal];
                [_pay setTitleColor:[UIColor colorWithRed:220/255.0f green:48/255.0f blue:105/255.0f alpha:1.0]
                           forState:UIControlStateNormal];
                _pay.backgroundColor = [UIColor clearColor];
            }
            else
            {
                [_pay setTitle:@"评论" forState:UIControlStateNormal];
                _pay.backgroundColor = [UIColor colorWithRed:68/255.0f green:59/255.0f blue:47.0/255.0f alpha:1.0];
                [_pay setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
            }
        }

    }
 
}

-(void)del
{
    NSLog(@"取消");
}

-(void)pay
{
    if (_Cell_Type == ToDoCellType) {
        NSLog(@"支付");
    }
    else if(_Cell_Type == DidDoCellType && ![[_Dic valueForKey:@"comment"]integerValue])
    {
        NSLog(@"评论");
    }
}
@end
