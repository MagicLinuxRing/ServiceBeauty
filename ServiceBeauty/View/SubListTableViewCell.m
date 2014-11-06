//
//  SubListTableViewCell.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/2.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "SubListTableViewCell.h"

@implementation SubListTableViewCell
@synthesize leftBtn;
@synthesize rightBtn;
@synthesize leftLbl;
@synthesize rightLbl;
@synthesize setBeautyCakedelegate;

- (void)createBtn
{
    CGFloat btnWidth = ([[UIScreen mainScreen]bounds].size.width-25)/2;
    self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 5, btnWidth, 110)];
    leftBtn.backgroundColor = [UIColor redColor];
    leftBtn.layer.cornerRadius = 5;
    [leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(15+btnWidth, 5, btnWidth, 110)];
    rightBtn.backgroundColor = [UIColor greenColor];
    rightBtn.layer.cornerRadius = 5;
    [rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
}

- (void)createLbl
{
    self.leftLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, self.leftBtn.frame.size.width, 30)];
    leftLbl.backgroundColor = [UIColor clearColor];
    leftLbl.textColor = [UIColor whiteColor];
    leftLbl.textAlignment = NSTextAlignmentCenter;
    [self.leftBtn addSubview:leftLbl];
    
    self.rightLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, self.rightBtn.frame.size.width, 30)];
    rightLbl.backgroundColor = [UIColor clearColor];
    rightLbl.textColor = [UIColor whiteColor];
    rightLbl.textAlignment = NSTextAlignmentCenter;
    [self.rightBtn addSubview:rightLbl];
}

- (void)btnClick:(UIButton *)btn
{
    if ([btn isEqual:leftBtn])
    {
        if (self.setBeautyCakedelegate && [self.setBeautyCakedelegate respondsToSelector:@selector(setBautyCakeChoise:)])
        {
            [self.setBeautyCakedelegate setBautyCakeChoise:leftLbl.text];
        }
    }
    else
    {
        if (self.setBeautyCakedelegate && [self.setBeautyCakedelegate respondsToSelector:@selector(setBautyCakeChoise:)])
        {
            [self.setBeautyCakedelegate setBautyCakeChoise:rightLbl.text];
        }
    }
}

- (void)setBtnAndLblValue:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]])return;
    [self createBtn];
    [self createLbl];
    
    leftBtn.backgroundColor = [UIColor greenColor];// dic[@"bgLColor"];
    leftLbl.text = dic[@"leftLbl"];
    
    rightBtn.backgroundColor = [UIColor greenColor];// dic[@"bgRColor"];
    rightLbl.text = dic[@"rightLbl"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
