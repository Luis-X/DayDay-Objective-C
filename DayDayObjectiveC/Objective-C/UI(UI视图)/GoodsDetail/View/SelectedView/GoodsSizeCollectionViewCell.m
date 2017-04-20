//
//  GoodsSizeCollectionViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsSizeCollectionViewCell.h"

@implementation GoodsSizeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    [self createTitleLabel];
}

/**
 标题
 */
- (void)createTitleLabel{
    
    _titleLabel = [LuisXKit labelAddView:self.contentView TextColor:COLOR_GOODSDETAIL_GREY7 Font:[UIFont systemFontOfSize:14]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.layer.cornerRadius = self.frame.size.height / 2;
    _titleLabel.layer.borderWidth = 1.0f;
    _titleLabel.layer.masksToBounds = YES;
    _titleLabel.layer.borderColor = COLOR_GOODSDETAIL_GREY7.CGColor;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.contentView);
        
    }];
    
}

- (void)setIsSelected:(BOOL)isSelected {
    
    if (_isSelected != isSelected) {
        _isSelected = isSelected;
        _titleLabel.layer.borderColor = isSelected ? COLOR_GOODSDETAIL_REDPINK1.CGColor : COLOR_GOODSDETAIL_GREY7.CGColor;
        _titleLabel.textColor = isSelected ? COLOR_GOODSDETAIL_REDPINK1 : COLOR_GOODSDETAIL_GREY7;
    }
    
    
}
@end
