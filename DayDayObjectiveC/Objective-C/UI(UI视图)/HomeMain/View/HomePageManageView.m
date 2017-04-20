//
//  HomePageManageView.m
//  LuisXKit
//
//  Created by LuisX on 16/9/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomePageManageView.h"

@implementation HomePageManageView{
    NSInteger currcetIndex;             //当前页
    DataSelectedView *_dateToolsView;   //日期指示
    NSDate *_currectDate;               //当前日期
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame controllers:(NSArray *)controllers  ParentController:(UIViewController *)parentC{
    
    if (self = [super initWithFrame:frame] ){
        
        _currectDate = [NSDate date];
        
        //日期指示
        _dateToolsView = [[DataSelectedView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 60)];
        _dateToolsView.delegate = self;
        [_dateToolsView updateNowDateWithDate:_currectDate];
        //_dateToolsView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_dateToolsView];
        
        //多个横向滚动Controller
        self.controllers = controllers;
        self.segmentScrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 60, frame.size.width, frame.size.height - 60)];
        self.segmentScrollV.contentSize = CGSizeMake(frame.size.width * self.controllers.count, 0);
        self.segmentScrollV.delegate = self;
        self.segmentScrollV.showsHorizontalScrollIndicator = NO;
        self.segmentScrollV.pagingEnabled = YES;
        self.segmentScrollV.bounces = NO;
        [self addSubview:self.segmentScrollV];
        for (int i = 0; i < self.controllers.count; i++){
            
            UIViewController * contr = [self.controllers objectAtIndex:i];
            [self.segmentScrollV addSubview:contr.view];
            contr.view.frame = CGRectMake(i * frame.size.width, 0, frame.size.width, frame.size.height - 60);
            [parentC addChildViewController:contr];
            [contr didMoveToParentViewController:parentC];
            
        }
        
    }
    
    return self;
}


//移动至index页
- (void)moveToCurrectViewControllerWithIndex:(NSInteger)index{
    
    [self.segmentScrollV setContentOffset:CGPointMake((index) * self.frame.size.width, 0) animated:YES];
    
}

//更新页码/日期
- (void)updateCurrectIndexWithScrollView:(UIScrollView *)scrollView{
    
    if (scrollView == self.segmentScrollV) {
        
        currcetIndex = (self.segmentScrollV.contentOffset.x / self.frame.size.width);
        [_dateToolsView updateNowDateWithDate:[_currectDate dateByAddingDays:currcetIndex]];
        //NSLog(@"%ld页 日期:%@", currcetIndex, [_currectDate dateByAddingDays:currcetIndex]);
        
    }
    
}

#pragma mark -UIScrollViewDelegate
//滚动结束
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self updateCurrectIndexWithScrollView:scrollView];
}

//拖拽结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updateCurrectIndexWithScrollView:scrollView];
}

#pragma mark -DataSelectedViewDelegate
- (void)dataSelectedGoToday{
    //NSLog(@"切换_今天");
    [self moveToCurrectViewControllerWithIndex:0];
}

- (void)dataSelectedGoNextDay{
    //NSLog(@"切换_后一天");
    [self moveToCurrectViewControllerWithIndex:++currcetIndex];
}

- (void)dataSelectedGoLastDay{
    //NSLog(@"切换_前一天");
    [self moveToCurrectViewControllerWithIndex:--currcetIndex];
}

@end
