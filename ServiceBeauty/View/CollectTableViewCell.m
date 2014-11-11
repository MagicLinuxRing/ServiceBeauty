//
//  CollectTableViewCell.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-11.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "CollectTableViewCell.h"

@implementation CollectTableViewCell
{
    UIImageView *_icon;
    UILabel     *_name;
    UIImageView *_star;
    UIImageView *_arrowsView;
    UILabel     *_description;
    UIView      *_line;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _icon = [[UIImageView alloc]initWithFrame:CGRectZero];//CGRectMake(10,12, 75, 75)
        _icon.backgroundColor = [UIColor clearColor];
        _icon.image =[UIImage imageNamed:@"icon.jpg"];
        _icon.layer.cornerRadius = 75/2.0f;
        _icon.layer.borderWidth = 5.0f;
        _icon.layer.masksToBounds = YES;
        _icon.layer.borderColor = [[UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0] CGColor];
        _icon.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_icon];
        
        _name = [[UILabel alloc]initWithFrame:CGRectZero];
        _name.backgroundColor = [UIColor clearColor];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.font = [UIFont systemFontOfSize:18.0f];
        _name.textColor = [UIColor blackColor];
        [self addSubview:_name];
        
        _description = [[UILabel alloc]initWithFrame:CGRectZero];
        _description.backgroundColor = [UIColor clearColor];
        _description.font = [UIFont systemFontOfSize:14.0f];
        _description.textAlignment = NSTextAlignmentCenter;
        _description.numberOfLines = 2;
        _description.textColor = [UIColor grayColor];
        [self addSubview:_description];
        
        _arrowsView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _arrowsView.backgroundColor = [UIColor clearColor];
        _arrowsView.image = [UIImage imageNamed:@"arrows.png"];
        [self addSubview:_arrowsView];
        
        _line = [[UIView alloc]initWithFrame:CGRectZero];
        _line.backgroundColor = [UIColor grayColor];
        [self addSubview:_line];
    }
    return self;
}

-(void)layoutSubviews
{
    _icon.frame = CGRectMake(10, 12, 75, 75);
    float x = _icon.frame.size.width+20.0f;
    float y = _icon.frame.origin.y+5.0f;
    _name.frame = CGRectMake(x, y,100, 18.0f);
    y = y+_name.frame.size.height+20.0f;
    _description.frame = CGRectMake(x,y, 200.0f, 40.0f);
    _arrowsView.frame = CGRectMake(300.0f,(self.frame.size.height-20)/2, 15.0f, 20.0f);
    _line.frame = CGRectMake(x, self.frame.size.height-1.0f, self.frame.size.width-x, 1.0f);
}

-(void)setDic:(NSDictionary *)dic
{
    if (_dic!=dic) {
#if !__has_feature(objc_arc)
        [_dic release];
        [dic retain];
#endif
        _dic = dic;
        _name.text = [_dic valueForKey:@"name"];
        _description.text = [_dic valueForKey:@"description"];
        for (int i = 0; i<[[_dic valueForKey:@"star"] integerValue]; i++)
        {
            _star = [[UIImageView alloc]initWithFrame:CGRectMake(205+i*18.0f, 15.0f, 18.0f, 18.0f)];
            _star.backgroundColor = [UIColor clearColor];
            _star.image = [UIImage imageNamed:@"star"];
            [self addSubview:_star];
        }
    }
}
@end
