//
//  GoodsDetailCommentTableViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsDetailCommentTableViewCell.h"

@implementation GoodsDetailCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
