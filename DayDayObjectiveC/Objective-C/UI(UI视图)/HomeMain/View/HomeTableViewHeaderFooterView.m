//
//  HomeTableViewHeaderFooterView.m
//  LuisXKit
//
//  Created by LuisX on 16/9/20.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomeTableViewHeaderFooterView.h"
#import "DataSelectedView.h"
#import "IncomeHeaderView.h"


@implementation HomeTableViewHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    
    IncomeHeaderView *incomHeaderView = [IncomeHeaderView new];
    incomHeaderView.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:incomHeaderView];
    [incomHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(200);
        
    }];
    
    //菜单选择
    MenuCollectionView *menuView = [[MenuCollectionView alloc] initWithFrame:CGRectZero TitleArray:@[@"订单管理", @"家族管理", @"我的店铺", @"邀请好友"] IconArray:@[@"\U0000e631", @"\U0000e632", @"\U0000e634", @"\U0000e633"] Space:20 CollectionWidth:[UIScreen mainScreen].bounds.size.width Style:MenuCollectionViewStyleMoreButton];
     [menuView.backgroundImageView setImage:[UIImage imageNamed:@"home_bitmap"]];
    menuView.backgroundColor = [UIColor clearColor];
    menuView.titleColor = [UIColor whiteColor];
    menuView.titleFont = [UIFont systemFontOfSize:12];
    menuView.delegate = self;
    [self.contentView addSubview:menuView];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(incomHeaderView.mas_bottom).offset(-20);
        make.left.right.equalTo(self.contentView);
        
    }];
    
    /*
    //日期选择
    DataSelectedView *dateToolsView = [DataSelectedView new];
    //dateToolsView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:dateToolsView];
    [dateToolsView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(menuView.mas_bottom);
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(60);
        
    }];
    [dateToolsView updateNowDateWithDate:[NSDate date]];
    */
}

#pragma mark -MenuCollectionViewDelegate
- (void)menuCollectionView:(MenuCollectionView *)view didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSLog(@"订单管理");
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        NSLog(@"家族管理");
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        NSLog(@"我的店铺");
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        NSLog(@"邀请好友");
    }
    
}
@end
