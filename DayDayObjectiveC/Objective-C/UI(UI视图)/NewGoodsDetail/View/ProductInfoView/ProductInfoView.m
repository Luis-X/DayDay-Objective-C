//
//  ProductInfoView.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/3/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductInfoView.h"

@implementation ProductInfoView{
    UIView *_contentView;
    UILabel *_titleLabel;
    UILabel *_priceLabel;
    UILabel *_originalPriceLabel;
}

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
    
    [self createContentView];
    [self createTitleLabel];
    [self createPriceLabel];
    [self createOriginalPriceLabel];
}

/**
 标题
 */
- (void)createTitleLabel{
    
    _titleLabel = [LuisXKit labelAddView:self TextColor:COLOR_GOODSDETAIL_BLACK1 Font:[UIFont systemFontOfSize:16]];
    _titleLabel.text = @"[尚妆]日单便携收纳袋款运动擦汗毛巾 (两色可选) 玫红色";
    _titleLabel.numberOfLines = 0;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_contentView).offset(15);
        make.left.equalTo(_contentView).offset(20);
        make.right.equalTo(_contentView).offset(-20);
        
    }];
    
}

/**
 现价
 */
- (void)createPriceLabel{
    
    _priceLabel = [LuisXKit labelAddView:_contentView TextColor:COLOR_GOODSDETAIL_REDPINK1 Font:[UIFont systemFontOfSize:24]];
    _priceLabel.text = [NSString stringWithFormat:@"¥234"];
    //[GoodsDetailConstant setSpecialSymbolWithLabel:_mlbPrice Color:COLOR_GOODSDETAIL_REDPINK1 FontSize:15];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleLabel.mas_bottom).offset(8);
        make.left.equalTo(_contentView).offset(20);
        make.bottom.equalTo(_contentView).offset(-15);
        
    }];
    
}

/**
 原价
 */
- (void)createOriginalPriceLabel{
    
    _originalPriceLabel = [LuisXKit labelAddView:_contentView TextColor:COLOR_GOODSDETAIL_GREY7 Font:[UIFont systemFontOfSize:12]];
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

- (void)createContentView{
    _contentView = [UIView new];
    //_contentView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.equalTo(self);
        
    }];
}


/**
 动态修改高度
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat layout_height = _contentView.frame.size.height;     //约束高度
    CGFloat default_height = self.frame.size.height;            //默认高度
    CGRect frame = self.frame;
    frame.size.height = (default_height >= layout_height) ? default_height : layout_height;
    self.frame = frame;
    
}


@end
