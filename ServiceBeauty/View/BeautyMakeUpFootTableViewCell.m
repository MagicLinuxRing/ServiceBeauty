//
//  BeautyMakeUpFootTableViewCell.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/5.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "BeautyMakeUpFootTableViewCell.h"

@implementation BeautyMakeUpFootTableViewCell
@synthesize beautyDic;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 70, 70)];
    _headImg.backgroundColor = [UIColor clearColor];
    [_headImg.layer setCornerRadius:CGRectGetHeight([_headImg bounds]) / 2];
    _headImg.layer.masksToBounds = YES;
    _headImg.layer.borderWidth = 5;
    _headImg.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    _serviceStandardLbl = [[UILabel alloc]initWithFrame:CGRectMake(110, 20, 150, 30)];
    _serviceStandardLbl.textAlignment = NSTextAlignmentLeft;
    _serviceStandardLbl.backgroundColor = [UIColor clearColor];
    _serviceStandardLbl.font = [UIFont fontWithName:@"Arial" size:20];
    _serviceStandardLbl.textColor = [UIColor blackColor];
    
    _serviceNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(110, 60, 200, 30)];
    _serviceNameLbl.textAlignment = NSTextAlignmentLeft;
    _serviceNameLbl.backgroundColor = [UIColor clearColor];
    _serviceNameLbl.font = [UIFont fontWithName:@"Arial" size:20];
    _serviceNameLbl.textColor = [UIColor darkGrayColor];
    
    [self.contentView addSubview:_serviceStandardLbl];
    [self.contentView addSubview:_serviceNameLbl];
    [self.contentView addSubview:_headImg];
}

- (void)createUIWithDic:(NSDictionary *)dic
{
    self.beautyDic = dic;
    
    _headImg.layer.contents = (id)[[UIImage imageNamed:dic[@"image"]] CGImage];
    _serviceNameLbl.text = dic[@"serviceName"];
    _serviceStandardLbl.text = dic[@"standard"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _headImg.layer.contents = (id)[[UIImage imageNamed:self.beautyDic[@"image"]] CGImage];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
