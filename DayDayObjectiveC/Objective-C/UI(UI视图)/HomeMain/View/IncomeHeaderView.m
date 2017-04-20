//
//  IncomeHeaderView.m
//  LuisXKit
//
//  Created by LuisX on 16/9/20.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "IncomeHeaderView.h"

@implementation IncomeHeaderView

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
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews{
    
    UIImageView *backgroundImageView = [UIImageView new];
    backgroundImageView.backgroundColor = [UIColor redColor];
    backgroundImageView.clipsToBounds = YES;
    backgroundImageView.contentMode = 3;
    [backgroundImageView setImage:[UIImage imageNamed:@"home_top_bg"]];
    [self addSubview:backgroundImageView];
    [backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.bottom.right.equalTo(self);
        
    }];
    
    //累计收益
    UILabel *incomeWord = [UILabel new];
    //incomeWord.backgroundColor = [UIColor redColor];
    incomeWord.text = @"累计收益:";
    incomeWord.textColor = [UIColor whiteColor];
    incomeWord.font = [UIFont systemFontOfSize:16];
    [backgroundImageView addSubview:incomeWord];
    [incomeWord mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(backgroundImageView).offset(10);
        make.centerX.equalTo(backgroundImageView);
        
    }];
    //职级
    UILabel *levelLabel = [UILabel new];
    //levelLabel.backgroundColor = [UIColor redColor];
    levelLabel.text = @"职级: 系主任";
    levelLabel.textColor = [UIColor whiteColor];
    levelLabel.font = [UIFont systemFontOfSize:12];
    [backgroundImageView addSubview:levelLabel];
    [levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(backgroundImageView).offset(-20);
        make.centerY.equalTo(incomeWord);
        
    }];
    //收益金额
    UILabel *incomeMoneyLabel = [UILabel new];
    //incomeMoneyLabel.backgroundColor = [UIColor orangeColor];
    incomeMoneyLabel.text = @"￥16889.34";
    incomeMoneyLabel.textColor = [UIColor whiteColor];
    incomeMoneyLabel.font = [UIFont systemFontOfSize:38];
    [backgroundImageView addSubview:incomeMoneyLabel];
    [incomeMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(incomeWord.mas_bottom).offset(10);
        make.centerX.equalTo(backgroundImageView);
        
    }];
    //今日收益
    UILabel *todayIncomeLabel = [UILabel new];
    //todayIncomeLabel.backgroundColor = [UIColor redColor];
    todayIncomeLabel.text = @"今日收益: 1834.03";
    todayIncomeLabel.textColor = [UIColor whiteColor];
    todayIncomeLabel.font = [UIFont systemFontOfSize:14];
    [backgroundImageView addSubview:todayIncomeLabel];
    [todayIncomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(incomeMoneyLabel.mas_bottom).offset(16);
        make.centerX.equalTo(backgroundImageView);
        
    }];
    //底部工具条
    UIView *midBarView = [UIView new];
    midBarView.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.20];
    [backgroundImageView addSubview:midBarView];
    [midBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(backgroundImageView);
        make.left.right.equalTo(backgroundImageView);
        make.height.mas_equalTo(64);
        
    }];
    //今日销售额
    UILabel *todaySaleMoneyLabel = [UILabel new];
    //todaySaleMoneyLabel.backgroundColor = [UIColor orangeColor];
    todaySaleMoneyLabel.text = @"今日销售额: 123323.33";
    todaySaleMoneyLabel.textColor = [UIColor whiteColor];
    todaySaleMoneyLabel.font = [UIFont systemFontOfSize:16];
    [midBarView addSubview:todaySaleMoneyLabel];
    [todaySaleMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(midBarView).offset(10);
        make.centerY.equalTo(midBarView).offset(- 20 / 2);
        
    }];
    //家族新增
    UILabel *familyNewLabel = [UILabel new];
    //familyNewLabel.backgroundColor = [UIColor orangeColor];
    familyNewLabel.text = @"家族新增: 85234人";
    familyNewLabel.textColor = [UIColor whiteColor];
    familyNewLabel.font = [UIFont systemFontOfSize:16];
    familyNewLabel.numberOfLines = 2;
    [midBarView addSubview:familyNewLabel];
    [familyNewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.greaterThanOrEqualTo(todaySaleMoneyLabel.mas_right).offset(5);
        make.right.equalTo(midBarView).offset(-10);
        make.centerY.equalTo(midBarView).offset(-20 / 2);
        
    }];

}
@end
