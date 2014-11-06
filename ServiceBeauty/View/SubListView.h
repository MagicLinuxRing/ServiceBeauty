//
//  SubListView.h
//  ServiceBeauty
//
//  Created by king jack on 14/11/2.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubListTableViewCell.h"

@protocol ServiceBeautyDelegate <NSObject>

- (void)backForBeautyService:(NSDictionary *)dic;

@end

@interface SubListView : UIView<UITableViewDataSource,UITableViewDelegate,SetBeautyCakeDelegate>

- (id)initCurrentViewData:(NSMutableArray *)arr;

@property (nonatomic,assign)id<ServiceBeautyDelegate>serviceBeautyDelegate;

@end

@protocol SelectBeautyServiceDelegate <NSObject>

- (void)selectBeautyServicePrice:(NSDictionary *)beautyServiceDic;

@end

@interface SelectBeautyServiceView : UIControl


@property (nonatomic,assign)id<SelectBeautyServiceDelegate>selectBeautyServiceDelegate;
@end