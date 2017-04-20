//
//  NewClassTableViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/2/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "NewClassTableViewCell.h"

@implementation NewClassTableViewCell{
    UILabel *_titleLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
    
}

- (void)createSubviews{
    
    _titleLabel = [LuisXKit labelAddView:self.contentView TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:15]];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"食品饮料";
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.bottom.right.equalTo(self.contentView);
        
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    _titleLabel.textColor = selected ? [UIColor redColor] : [UIColor blackColor];
    self.backgroundColor = selected ? [UIColor grayColor] : [UIColor whiteColor];
}

@end
