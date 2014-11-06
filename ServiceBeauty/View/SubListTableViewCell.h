//
//  SubListTableViewCell.h
//  ServiceBeauty
//
//  Created by king jack on 14/11/2.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SetBeautyCakeDelegate <NSObject>

- (void)setBautyCakeChoise:(NSString *)beautyServiceName;

@end

@interface SubListTableViewCell : UITableViewCell
{
    UIButton *leftBtn;
    UIButton *rightBtn;
    
    UILabel *leftLbl;
    UILabel *rightLbl;
}

@property (nonatomic,assign)id<SetBeautyCakeDelegate>setBeautyCakedelegate;

@property (nonatomic,retain)UIButton *leftBtn;
@property (nonatomic,retain)UIButton *rightBtn;
@property (nonatomic,retain)UILabel *leftLbl;
@property (nonatomic,retain)UILabel *rightLbl;

//设置按钮和lable的初始化
- (void)setBtnAndLblValue:(NSDictionary *)dic;

@end
