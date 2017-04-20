//
//  GoodsSizeCollectionReusableView.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsSizeCollectionReusableView.h"

@implementation GoodsSizeCollectionReusableView{
    UILabel *_titleLabel;
}
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
    
}

- (void)createSubviews{
   
    _titleLabel = [LuisXKit labelAddView:self TextColor:COLOR_GOODSDETAIL_BLACK3 Font:[UIFont systemFontOfSize:14]];
    _titleLabel.text = @"选择规格";
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).offset(10);
        
    }];
    
}
@end
