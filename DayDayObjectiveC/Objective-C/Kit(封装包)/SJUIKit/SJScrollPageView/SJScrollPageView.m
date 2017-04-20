//
//  SJScrollPageView.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/27.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "SJScrollPageView.h"
#import "MJRefresh.h"

@interface SJScrollPageView ()
@property (nonatomic, strong) UIScrollView *topPageView;       //第一页
@property (nonatomic, strong) UIScrollView *bottomPageView;    //第二页
@end

@implementation SJScrollPageView{
    MJRefreshBackNormalFooter *_footer;
    MJRefreshNormalHeader *_header;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createSJScrollViews];
    }
    return self;
    
}

/**
 上下拉分页
 
 @param frame           frame
 @param firstPageView   第一页
 @param secondPageView  第二页
 */
+ (instancetype)showScrollPageViewWithFrame:(CGRect)frame FirstPageView:(UIScrollView *)firstPageView SecondPageView:(UIScrollView *)secondPageView{
    
    SJScrollPageView *sjScrollPageView = [[SJScrollPageView alloc] initWithFrame:frame];
    sjScrollPageView.topPageView = firstPageView;
    sjScrollPageView.bottomPageView = secondPageView;
    [sjScrollPageView configureRefreshPageControl];
    sjScrollPageView.animationDuration = 0.3f;
    sjScrollPageView.headerRefreshTitle = @"下拉回到“商品详情”";
    sjScrollPageView.footerRefreshTitle = @"上拉查看图文详情";
    return sjScrollPageView;
    
}

 //主框架
- (void)createSJScrollViews{
    self.backgroundColor = [UIColor whiteColor];
    self.contentSize = CGSizeMake(CGRectGetWidth(self.frame), (CGRectGetHeight(self.frame) * 2));
    self.pagingEnabled = YES;
    self.scrollEnabled = NO;
}

//第一页
- (void)setTopPageView:(UIScrollView *)topPageView{
    if (_topPageView != topPageView) {
        _topPageView = topPageView;
        
        _topPageView.frame = self.bounds;
        //_topPageView.backgroundColor = [UIColor redColor];
        [self addSubview:_topPageView];
    }
}

//第二页
- (void)setBottomPageView:(UIScrollView *)bottomPageView{
    if (_bottomPageView != bottomPageView) {
        _bottomPageView = bottomPageView;
        
        _bottomPageView.frame = CGRectMake(0, CGRectGetMaxY(self.frame), CGRectGetWidth(self.frame), _topPageView.frame.size.height);
        //_bottomPageView.backgroundColor = [UIColor greenColor];
        [self addSubview:_bottomPageView];
    }
}

//下拉标题
- (void)setHeaderRefreshTitle:(NSString *)headerRefreshTitle{
    if (_headerRefreshTitle != headerRefreshTitle) {
        _headerRefreshTitle = headerRefreshTitle;
        
        [_header setTitle:_headerRefreshTitle forState:MJRefreshStateIdle];
        [_header setTitle:_headerRefreshTitle forState:MJRefreshStatePulling];
        [_header setTitle:_headerRefreshTitle forState:MJRefreshStateRefreshing];
    }
}

//上拉标题
- (void)setFooterRefreshTitle:(NSString *)footerRefreshTitle{
    if (_footerRefreshTitle != footerRefreshTitle) {
        _footerRefreshTitle = footerRefreshTitle;
        
        [_footer setTitle:_footerRefreshTitle forState:MJRefreshStateIdle];
        [_footer setTitle:_footerRefreshTitle forState:MJRefreshStatePulling];
        [_footer setTitle:_footerRefreshTitle forState:MJRefreshStateRefreshing];
    }
}
#pragma mark -上下拉切换分页
- (void)configureRefreshPageControl{
    // 1.设置 (第一页) 上拉显示
    _footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self moveToSecondPageView];
    }];
    _footer.automaticallyHidden = NO; // 关闭自动隐藏(若为YES，cell无数据时，不会执行上拉操作)
    _topPageView.mj_footer = _footer;
    
    
    // 2.设置 (第二页) 下拉显示
    _header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self moveToFirstPageView];
    }];
    _header.lastUpdatedTimeLabel.hidden = YES;
    _bottomPageView.mj_header = _header;
    
}

//切换至第一页
- (void)moveToFirstPageView{
    
    [UIView animateWithDuration:self.animationDuration delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.contentOffset = CGPointZero;
    } completion:^(BOOL finished) {
        [_bottomPageView.mj_header endRefreshing];
    }];
    
}
//切换至第二页
- (void)moveToSecondPageView{
    
    [UIView animateWithDuration:self.animationDuration delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.contentOffset = CGPointMake(0, CGRectGetHeight(_topPageView.frame));
    } completion:^(BOOL finished) {
        [_topPageView.mj_footer endRefreshing];
    }];
    
}


@end
