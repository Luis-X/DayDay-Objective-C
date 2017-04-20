//
//  NewClassCollectionViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/2/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "NewClassCollectionViewCell.h"

@implementation NewClassCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews{
    
    UILabel *goodsTitleLabel = [LuisXKit labelAddView:self.contentView TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:12]];
    goodsTitleLabel.text = @"商品名称";
    //goodsTitleLabel.backgroundColor = [UIColor redColor];
    goodsTitleLabel.textAlignment = NSTextAlignmentCenter;
    [goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(20);
        
    }];
    
    UIImageView *goodsImageView = [LuisXKit imageViewAddView:self.contentView ClipsToBounds:YES ContentMode:3];
    goodsImageView.backgroundColor = [UIColor grayColor];
    [goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(5);
        make.left.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView).offset(-5);
        make.bottom.equalTo(goodsTitleLabel.mas_top);
        
    }];
    
}
@end
