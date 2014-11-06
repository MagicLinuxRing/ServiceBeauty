//
//  AdvitiseView.h
//  ServiceBeauty
//
//  Created by king jack on 14/11/1.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvitiseView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    
    NSMutableArray *m_imgArr;
}

@property (nonatomic,retain)    NSMutableArray *m_imgArr;

- (void)initImgArrAndUI:(NSMutableArray *)imgArr;

@end
