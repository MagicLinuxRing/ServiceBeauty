//
//  ListButton.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/1.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "ListButton.h"

@implementation ListButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initBtnWithFrame:(CGRect)btnRect
              andBgImg:(NSString *)imgName
{
    self = [super init];
    if (self)
    {
        self.frame = btnRect;
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5;
        [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    return self;
}

- (void)initLblWithFrame:(CGRect)rect andName:(NSString *)name andFontSize:(CGFloat)size
{
    UILabel *lbl = [[UILabel alloc]initWithFrame:rect];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = name;
    lbl.font = [UIFont fontWithName:@"Arial" size:20];
    lbl.textColor = [UIColor whiteColor];
    [self addSubview:lbl];
}

@end
