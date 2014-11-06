//
//  AdvitiseView.m
//  ServiceBeauty
//
//  Created by king jack on 14/11/1.
//  Copyright (c) 2014年 kingJ. All rights reserved.
//

#import "AdvitiseView.h"

@implementation AdvitiseView
@synthesize m_imgArr;

- (void)initImgArrAndUI:(NSMutableArray *)imgArr
{
    self.m_imgArr = [NSMutableArray arrayWithArray:imgArr];
    [self initScrollView];
    [self setViewArr:self.m_imgArr];
    
}

- (void)initScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.userInteractionEnabled = YES;
    [self addSubview:_scrollView]; 
}


- (void)setViewArr:(NSMutableArray *)arr
{
    for (int i=0; i<[arr count]; i++)
    {
        NSDictionary *dic = arr[i];
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(self.frame.size.width*i, 0,  self.frame.size.width, 150);
        imgView.backgroundColor = [UIColor clearColor];
        imgView.image = [UIImage imageNamed:dic[@"image"]];
        [_scrollView addSubview:imgView];
    }
    
    NSDictionary *dicImg = [arr objectAtIndex:([arr count]-1)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dicImg[@"image"]]];
    imageView.frame = CGRectMake(0, 0,  self.frame.size.width, 150);
    [_scrollView addSubview:imageView];

    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[arr objectAtIndex:0] objectForKey:@"image"]]];
    imageView1.frame = CGRectMake((self.frame.size.width * ([arr count] )) , 0, self.frame.size.width, 150);
    [_scrollView addSubview:imageView1];
    
    [_scrollView setContentSize:CGSizeMake(self.frame.size.width * ([arr count] + 1), 150)];
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    [_scrollView scrollRectToVisible:CGRectMake(self.frame.size.width,0,self.frame.size.width,150) animated:NO];

    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0,130+64, self.frame.size.width,20)];
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    [_pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    _pageControl.numberOfPages = [arr count];
    _pageControl.currentPage = 0;
    _pageControl.backgroundColor = [UIColor clearColor];
    [_pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_pageControl];
    
    [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = _scrollView.frame.size.width;
    NSInteger page = floor((_scrollView.contentOffset.x - pagewidth/([m_imgArr count]+2))/pagewidth)+1;
    page --;
    _pageControl.currentPage = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pagewidth = _scrollView.frame.size.width;
    int currentPage = floor((_scrollView.contentOffset.x - pagewidth/ ([m_imgArr count]+2)) / pagewidth) + 1;
    if (currentPage == 0)
    {
        [_scrollView scrollRectToVisible:CGRectMake( self.frame.size.width * [m_imgArr count],0, self.frame.size.width,150) animated:NO]; // 序号0 最后1页
    }
    else if (currentPage == ([m_imgArr count]+1))
    {
        [_scrollView scrollRectToVisible:CGRectMake( self.frame.size.width,0, self.frame.size.width,150) animated:NO]; // 最后+1,循环第1页
    }
}

// pagecontrol 选择器的方法
- (void)turnPage
{
    NSInteger page = _pageControl.currentPage;
    [_scrollView scrollRectToVisible:CGRectMake( self.frame.size.width*(page+1),0, self.frame.size.width,150) animated:NO];
}

// 定时器 绑定的方法
- (void)runTimePage
{
    NSInteger page = _pageControl.currentPage;
    page++;
    page = page > ([m_imgArr count]-1) ? 0 : page ;
    _pageControl.currentPage = page;
    [self turnPage];
}

@end
