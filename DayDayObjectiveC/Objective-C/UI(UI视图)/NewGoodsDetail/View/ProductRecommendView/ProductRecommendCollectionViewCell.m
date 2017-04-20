//
//  ProductRecommendCollectionViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/3/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductRecommendCollectionViewCell.h"

@implementation ProductRecommendCollectionViewCell{
    UIImageView *imageView;     //商品图
    UILabel *titleLabel;        //标题
    UILabel *priceLabel;        //价格
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self creteSubviews];
    }
    return self;
}

- (void)creteSubviews{
    
    [self createImageView];
    [self createTitleLabel];
    [self createPriceLabel];
    
}

/**
 商品图
 */
- (void)createImageView{
    
}

/**
 标题
 */
- (void)createTitleLabel{
    
}

/**
 价格
 */
- (void)createPriceLabel{
    
}

@end
