//
//  BeautyMakeUpFootTableViewCell.h
//  ServiceBeauty
//
//  Created by king jack on 14/11/5.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeautyMakeUpFootTableViewCell : UITableViewCell
{
    UILabel *_serviceStandardLbl;
    UILabel *_serviceNameLbl;
    
    UIImageView *_headImg;
}

- (void)createUIWithDic:(NSDictionary *)dic;
@end
