//
//  OrderTableViewCell.h
//  ServiceBeauty
//
//  Created by Sun on 14-11-10.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellType)
{
    DidDoCellType,
    ToDoCellType
};

@interface OrderTableViewCell : UITableViewCell
@property(nonatomic,assign)CellType Cell_Type;
@property(nonatomic,strong)NSDictionary *Dic;

@end
