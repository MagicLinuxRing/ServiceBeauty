//
//  AccountTableViewCell.m
//  ServiceBeauty
//
//  Created by Sun on 14-11-6.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "AccountTableViewCell.h"

@implementation AccountTableViewCell
{
    UIImageView   * icon;
    UILabel       * title;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        icon = [[UIImageView alloc]initWithFrame:CGRectMake(12.0f, (40-45/2)/2, 45/2, 45/2)];
        icon.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:icon];
        
        title = [[UILabel alloc]initWithFrame:CGRectMake(12.0f+45/2+12.0f, (40.0f-15.0f)/2, 100, 15.0f)];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = NSTextAlignmentLeft;
        title.textColor = [UIColor colorWithRed:151/255.0f green:151/255.0f blue:151/255.0f alpha:1.0];
        title.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:title];
        
#if !__has_feature(objc_arc)
        [icon release];
        [title release];
#endif
    }
    return self;
}

-(void)setImage:(NSString *)image
{
    if (_image!=image) {
#if !__has_feature(objc_arc)
        [_image release];
        _image = [image retain];
#endif
        _image = image;
        icon.image = [UIImage imageNamed:_image];
    }
}

-(void)setText:(NSString *)text
{
    if (_text!=text) {
#if !__has_feature(objc_arc)
        [_text release];
        _text = [text retain];
#endif
        _text = text;
        title.text = _text;
    }
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
