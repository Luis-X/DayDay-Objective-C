//
//  SJScrollPageView.h
//  LuisXKit
//
//  Created by LuisX on 2016/10/27.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJScrollPageView : UIScrollView
+ (instancetype)showScrollPageViewWithFrame:(CGRect)frame FirstPageView:(UIScrollView *)firstPageView SecondPageView:(UIScrollView *)secondPageView;
@property (nonatomic, assign) CGFloat animationDuration;               //动画时长  (默认:0.3)
@property (nonatomic, copy) NSString *headerRefreshTitle;              //下拉标题  (默认: 下拉回到“商品详情”)
@property (nonatomic, copy) NSString *footerRefreshTitle;              //上拉标题  (默认: 上拉查看图文详情)

@end
