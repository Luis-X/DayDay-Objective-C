//
//  ProductBannerView.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/3/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductBannerView.h"

@implementation ProductBannerView

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
    UIImageView *goodsBrowerView = [UIImageView new];
    goodsBrowerView.backgroundColor = [UIColor whiteColor];
    goodsBrowerView.image = [UIImage imageNamed:@"text.png"];
    goodsBrowerView.contentMode = 3;
    goodsBrowerView.clipsToBounds = YES;
    [self addSubview:goodsBrowerView];
    [goodsBrowerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self);
        
    }];
}
@end
