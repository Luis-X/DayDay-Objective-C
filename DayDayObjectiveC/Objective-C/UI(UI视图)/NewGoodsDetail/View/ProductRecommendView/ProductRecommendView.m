//
//  ProductRecommendView.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/3/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductRecommendView.h"
#import "ProductRecommendCollectionViewCell.h"

@implementation ProductRecommendView{
    UILabel *_titleLabel;
    UICollectionView *_mainRecommendCollectionView;
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
    [self createRecommendCollectionView];
    [self createRecommendTitle];
}

/**
 商品推荐
 */
- (void)createRecommendCollectionView{

    CGFloat collectionView_height = CGRectGetHeight(self.frame) - 40;
    CGFloat collectionView_space = 10;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = collectionView_space;
    layout.sectionInset = UIEdgeInsetsMake(0, collectionView_space, 0, collectionView_space);
    layout.itemSize = CGSizeMake(130, collectionView_height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _mainRecommendCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _mainRecommendCollectionView.backgroundColor = [UIColor whiteColor];
    _mainRecommendCollectionView.dataSource = self;
    _mainRecommendCollectionView.delegate = self;
    [_mainRecommendCollectionView registerClass:[ProductRecommendCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
    [self addSubview:_mainRecommendCollectionView];
    [_mainRecommendCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-10);
        make.height.mas_equalTo(collectionView_height);
        
    }];
    
}

/**
 标题
 */
- (void)createRecommendTitle{
    
    _titleLabel = [LuisXKit labelAddView:self TextColor:COLOR_GOODSDETAIL_BLACK3 Font:[UIFont systemFontOfSize:14]];
    _titleLabel.text = @"更多推荐";
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self);
        make.bottom.equalTo(_mainRecommendCollectionView.mas_top);
        make.left.equalTo(self).offset(10);
        
    }];
    
}


#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
    
}
#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
