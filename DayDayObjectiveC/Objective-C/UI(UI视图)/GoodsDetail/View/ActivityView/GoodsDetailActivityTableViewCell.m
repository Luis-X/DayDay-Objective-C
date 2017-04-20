//
//  GoodsDetailActivityTableViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsDetailActivityTableViewCell.h"

@implementation GoodsDetailActivityTableViewCell{
    UIImageView *_activityImageView;    //活动图
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    
    _activityImageView = [LuisXKit imageViewAddView:self.contentView ClipsToBounds:YES ContentMode:2];
    _activityImageView.userInteractionEnabled = YES;
    _activityImageView.image = [UIImage imageNamed:@"bg1.png"];
    [_activityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.contentView);
        make.height.mas_equalTo(56);
        
    }];
    [_activityImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(activityImageAction:)]];
    
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
- (void)activityImageAction:(id)sender{
    [self.delegate goodsDetailActivityTableViewCellActivityImageAction];
}
@end
