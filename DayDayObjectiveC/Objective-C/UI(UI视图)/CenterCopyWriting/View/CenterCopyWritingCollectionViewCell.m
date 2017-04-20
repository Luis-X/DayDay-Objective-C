//
//  CenterCopyWritingCollectionViewCell.m
//  LuisXKit
//
//  Created by LuisX on 16/9/8.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "CenterCopyWritingCollectionViewCell.h"

@implementation CenterCopyWritingCollectionViewCell{
    UIButton *_selectedButton;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
        
    }
    return self;
    
}

- (void)createSubViews{
    
    //图片
    UIImageView *picImageView = [UIImageView new];
    [picImageView setImage:[UIImage imageNamed:@"title1"]];
    picImageView.contentMode = 1;
    picImageView.clipsToBounds = YES;
    picImageView.userInteractionEnabled = YES;
    //picImageView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:picImageView];
    [picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.top.left.bottom.right.equalTo(self.contentView);
        
    }];
    
    //勾选
    _selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _selectedButton.backgroundColor = [UIColor grayColor];
    [picImageView addSubview:_selectedButton];
    [_selectedButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.mas_equalTo(30);
        make.right.bottom.equalTo(picImageView).offset(-5);
        
    }];
    [_selectedButton addTarget:self action:@selector(selectedButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

/**
 *  勾选/取消
 *
 */
- (void)selectedButtonAction:(id)sender{
    
    [self.delegate chooseCellWithSelectedIndexPath:_cellIndexPath];
    
}

/**
 *  更新勾选状态
 *
 */
- (void)updateSelectedButtonSatausIsSelected:(BOOL)isSelected{
    
    if (isSelected) {
        
        //已勾选状态
        _selectedButton.backgroundColor = [UIColor redColor];
        return;
        
    }
        //未勾选状态
        _selectedButton.backgroundColor = [UIColor grayColor];

}
@end
