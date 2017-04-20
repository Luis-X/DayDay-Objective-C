//
//  ProductActivityView.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/3/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductActivityView.h"

@implementation ProductActivityView{
    UIImageView *_activityImageView;    //活动图
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
    
    _activityImageView = [LuisXKit imageViewAddView:self ClipsToBounds:YES ContentMode:2];
    _activityImageView.userInteractionEnabled = YES;
    _activityImageView.image = [UIImage imageNamed:@"bg1.png"];
    [_activityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self);
        
    }];
    //[_activityImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(activityImageAction:)]];
    
}

@end
