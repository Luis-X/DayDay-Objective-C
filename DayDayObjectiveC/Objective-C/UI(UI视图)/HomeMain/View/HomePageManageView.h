//
//  HomePageManageView.h
//  LuisXKit
//
//  Created by LuisX on 16/9/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataSelectedView.h"

@interface HomePageManageView : UIView <UIScrollViewDelegate, DataSelectedViewDelegate>
@property (nonatomic,strong)NSArray *controllers;
@property (nonatomic,strong)UIScrollView *segmentScrollV;
- (instancetype)initWithFrame:(CGRect)frame controllers:(NSArray *)controllers ParentController:(UIViewController *)parentC;
@end
