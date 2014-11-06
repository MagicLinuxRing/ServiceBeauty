//
//  ListButton.h
//  ServiceBeauty
//
//  Created by king jack on 14/11/1.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListButton : UIButton


- (id)initBtnWithFrame:(CGRect)btnRect
              andBgImg:(NSString *)imgName;

- (void)initLblWithFrame:(CGRect)rect
                 andName:(NSString *)name
             andFontSize:(CGFloat)size;

@end
