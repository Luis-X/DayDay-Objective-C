//
//  ProductShareBarView.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/3/21.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductShareBarView.h"

@implementation ProductShareBarView

- (instancetype)initWithFrame:(CGRect)frame reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)createSubViews{
    [self createShareBarView];
}

/**
 分享bar
 */
- (void)createShareBarView{
    
    //分享
    UIView *shareBackgroundView = [UIView new];
    shareBackgroundView.backgroundColor = COLOR_GOODSDETAIL_REDPINK2;
    [self addSubview:shareBackgroundView];
    [shareBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
        
    }];
    
    //分享按钮
    UIButton *shareButton = [LuisXKit buttonAddView:shareBackgroundView Title:@"分享" TitleColor:[UIColor whiteColor] Font:[UIFont systemFontOfSize:14] CornerRadius:(25 / 2) BackgroundColor:COLOR_GOODSDETAIL_REDPINK3];
    [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(shareBackgroundView).offset(-15);
        make.size.mas_equalTo(CGSizeMake(50, 25));
        make.centerY.equalTo(shareBackgroundView);
        
    }];
    //[shareButton addTarget:self action:@selector(shareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //分享提示
    UILabel *shareMessageLabel = [LuisXKit labelAddView:shareBackgroundView TextColor:COLOR_GOODSDETAIL_GREY8 Font:[UIFont systemFontOfSize:11]];
    shareMessageLabel.numberOfLines = 0;
    shareMessageLabel.text = @"点击分享按钮可以进入素材中心，素材可以支持多图分享！";
    //shareMessageLabel.backgroundColor = [UIColor redColor];
    [shareMessageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(shareBackgroundView);
        make.left.equalTo(shareBackgroundView).offset(20);
        make.right.equalTo(shareButton.mas_left).offset(-45);
        
    }];
    
}
@end
