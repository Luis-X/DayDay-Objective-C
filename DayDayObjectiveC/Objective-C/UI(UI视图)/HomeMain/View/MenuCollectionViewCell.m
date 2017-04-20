//
//  MenuCollectionViewCell.m
//  LuisXKit
//
//  Created by LuisX on 16/9/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "MenuCollectionViewCell.h"
#import "SJIconTextButton.h"
@implementation MenuCollectionViewCell{
    UIImageView *_iconImageView;
    UILabel *_titleLabel;
    UILabel *_iconLabel;
    SJIconTextButton *_button;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor redColor];
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews{
    /*
    _titleLabel = [UILabel new];
    //_titleLabel.backgroundColor = [UIColor redColor];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    
    _iconImageView = [UIImageView new];
    //_iconImageView.backgroundColor = [UIColor blueColor];
    _iconImageView.clipsToBounds = YES;
    _iconImageView.contentMode = 1;
    [self.contentView addSubview:_iconImageView];
    
    _iconLabel = [UILabel new];
    //_iconLabel.backgroundColor = [UIColor orangeColor];
    _iconLabel.textAlignment = NSTextAlignmentCenter;
    _iconLabel.font = [UIFont fontWithName:@"iconFont" size:40];
    _iconLabel.textColor = [UIColor whiteColor];
    [_iconImageView addSubview:_iconLabel];
    */
    
   _button = [SJIconTextButton new];
    _button.backgroundColor = [UIColor orangeColor];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    _button.iconFontSize = 40;
    _button.iconSize = CGSizeMake(40, 40);
    //button.iconImageView.image = [UIImage imageNamed:@"luisx_github@2x.png"];
    //button.iconLabel.text = @"\U0000e63c";
    _button.buttonStyle = IconTextButtonStyleTop;
    _button.buttonEdges = UIEdgeInsetsMake(5, 0, 5, 0);
    [self.contentView addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.contentView);
        
    }];
 
    
}

//更新约束
- (void)updateMenuCollectionViewCellLayout{
    

    [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.left.right.equalTo(self.contentView);
        
    }];
    
    [_iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.bottom.equalTo(_titleLabel.mas_top).offset(-5);
        
    }];
    
    [_iconLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(_iconImageView);
        
    }];
}

//更新数据
- (void)updateMenuCollectionViewCellDataWithTitle:(NSString *)title imageName:(NSString *)imageName TitleFont:(UIFont *)titleFont TitleColor:(UIColor *)titleColor{
    /*
    _titleLabel.text = title;
    _iconLabel.text = imageName;
    _iconImageView.image = [UIImage imageNamed:imageName];
    _iconLabel.text = imageName;
    _titleLabel.font = titleFont;
    _titleLabel.textColor = titleColor;
    _iconLabel.textColor = titleColor;
    [self updateMenuCollectionViewCellLayout];
*/
    _button.titleLabel.text = title;
    _button.iconLabel.text = imageName;
    _button.iconImageView.image = [UIImage imageNamed:imageName];
    _button.titleLabel.font = titleFont;
    _button.titleLabel.textColor = titleColor;
    _button.iconLabel.textColor = titleColor;

}
@end
