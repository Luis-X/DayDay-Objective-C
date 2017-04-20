//
//  GoodsDetailInfoTableViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsDetailInfoTableViewCell.h"

@implementation GoodsDetailInfoTableViewCell{
    UILabel *_titleLabel;
    UILabel *_priceLabel;
    UILabel *_originalPriceLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    
    [self createTitleLabel];
    [self createPriceLabel];
    [self createOriginalPriceLabel];
    [self createShareBarView];
    
}

/**
 标题
 */
- (void)createTitleLabel{
    
    _titleLabel = [LuisXKit labelAddView:self.contentView TextColor:COLOR_GOODSDETAIL_BLACK1 Font:[UIFont systemFontOfSize:16]];
    _titleLabel.text = @"[尚妆]日单便携收纳袋款运动擦汗毛巾 (两色可选) 玫红色";
    _titleLabel.numberOfLines = 0;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        
    }];
    
}

/**
 现价
 */
- (void)createPriceLabel{
    
    _priceLabel = [LuisXKit labelAddView:self.contentView TextColor:COLOR_GOODSDETAIL_REDPINK1 Font:[UIFont systemFontOfSize:24]];
    _priceLabel.text = [NSString stringWithFormat:@"¥234"];
    //[GoodsDetailConstant setSpecialSymbolWithLabel:_mlbPrice Color:COLOR_GOODSDETAIL_REDPINK1 FontSize:15];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLabel.mas_bottom).offset(8);
        make.left.equalTo(self.contentView).offset(20);
        
    }];
    
}

/**
 原价
 */
- (void)createOriginalPriceLabel{
    
    _originalPriceLabel = [LuisXKit labelAddView:self.contentView TextColor:COLOR_GOODSDETAIL_GREY7 Font:[UIFont systemFontOfSize:12]];
    _originalPriceLabel.text = [NSString stringWithFormat:@"¥423"];
    [_originalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.greaterThanOrEqualTo(_titleLabel.mas_bottom).offset(8);
        make.left.equalTo(_priceLabel.mas_right).offset(10);
        make.bottom.equalTo(_priceLabel).offset(-5);
        
    }];
    
    //删除线
    UIView *deleteLine = [UIView new];
    deleteLine.backgroundColor = COLOR_GOODSDETAIL_GREY7;
    [_originalPriceLabel addSubview:deleteLine];
    [deleteLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(_originalPriceLabel);
        make.left.equalTo(_originalPriceLabel).offset(-2);
        make.right.equalTo(_originalPriceLabel).offset(2);
        make.height.mas_equalTo(1);
        
    }];
}

/**
 分享bar
 */
- (void)createShareBarView{
    
    //分享
    UIView *shareBackgroundView = [UIView new];
    shareBackgroundView.backgroundColor = COLOR_GOODSDETAIL_REDPINK2;
    [self.contentView addSubview:shareBackgroundView];
    [shareBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_priceLabel.mas_bottom).offset(15);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.contentView).offset(-15);
        
    }];
    
    //分享按钮
    UIButton *shareButton = [LuisXKit buttonAddView:shareBackgroundView Title:@"分享" TitleColor:[UIColor whiteColor] Font:[UIFont systemFontOfSize:14] CornerRadius:(25 / 2) BackgroundColor:COLOR_GOODSDETAIL_REDPINK3];
    [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(shareBackgroundView).offset(-15);
        make.size.mas_equalTo(CGSizeMake(50, 25));
        make.centerY.equalTo(shareBackgroundView);
        
    }];
    [shareButton addTarget:self action:@selector(shareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -Action
- (void)shareButtonAction:(id)sender{
    [self.delegate goodsDetailInfoTableViewCellShareButtonAction];
}
@end
