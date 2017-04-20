//
//  GoodsDetailRecommendTableViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsDetailRecommendTableViewCell.h"
#import "GoodsRecommendCollectionViewCell.h"

@implementation GoodsDetailRecommendTableViewCell{
    UICollectionView *_mainRecommendCollectionView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    [self createRecommendCollectionView];
}

/**
 商品推荐
 */
- (void)createRecommendCollectionView{
    
    UILabel *recommendLabel = [LuisXKit labelAddView:self.contentView TextColor:COLOR_GOODSDETAIL_BLACK3 Font:[UIFont systemFontOfSize:14]];
    recommendLabel.text = @"更多推荐";
    [recommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        
    }];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    layout.itemSize = CGSizeMake(130, 130);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _mainRecommendCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _mainRecommendCollectionView.backgroundColor = [UIColor whiteColor];
    _mainRecommendCollectionView.dataSource = self;
    _mainRecommendCollectionView.delegate = self;
    [self.contentView addSubview:_mainRecommendCollectionView];
    [_mainRecommendCollectionView registerClass:[GoodsRecommendCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
    
    //更新高度
    [_mainRecommendCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(130);
        make.top.equalTo(recommendLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-10);
        
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodsRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
    
}
#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
