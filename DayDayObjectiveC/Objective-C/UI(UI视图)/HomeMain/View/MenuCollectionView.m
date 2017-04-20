//
//  MenuCollectionView.m
//  LuisXKit
//
//  Created by LuisX on 16/9/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "MenuCollectionView.h"
#import "MenuCollectionViewCell.h"

@implementation MenuCollectionView{
    NSArray *_dataTitleArr;
    NSArray *_dataIconArr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray IconArray:(NSArray *)iconArray Space:(CGFloat)space CollectionWidth:(CGFloat)collectionWidth Style:(MenuCollectionViewStyle)style{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _dataTitleArr = titleArray;
        _dataIconArr = iconArray;
        [self createSubViewsWithNum:titleArray.count Space:space CollectionWidth:collectionWidth Style:style];
        
    }
    return self;
    
}


- (void)createSubViewsWithNum:(NSInteger)num Space:(CGFloat)space CollectionWidth:(CGFloat)collectionWidth Style:(MenuCollectionViewStyle)style{
    
    //背景图
    _backgroundImageView = [UIImageView new];
    //_backgroundImageView.backgroundColor = [UIColor whiteColor];
    _backgroundImageView.userInteractionEnabled = YES;
    _backgroundImageView.clipsToBounds = YES;
    _backgroundImageView.contentMode = 3;
    [self addSubview:_backgroundImageView];
    [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.bottom.right.equalTo(self);
        
    }];
    
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = space;
    flowLayout.minimumLineSpacing = space;
    flowLayout.sectionInset = UIEdgeInsetsMake(space, space, space, space);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    if (style == MenuCollectionViewStyleMoreButton) {
        flowLayout.itemSize = [self getItemSizeCollectionWidth:collectionWidth Num:num Space:space];
    }
    if (style == MenuCollectionViewStyleMoreImage) {
        flowLayout.itemSize = IMAGE_ITEM_SIZE;
    }
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor clearColor];
//    collectionView.showsHorizontalScrollIndicator = NO;
//    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[MenuCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_backgroundImageView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.right.equalTo(_backgroundImageView);
        make.height.mas_equalTo(flowLayout.itemSize.height + (space * 2));
        
    }];
    
}
#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataTitleArr.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuCollectionViewCell *cell = (MenuCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell updateMenuCollectionViewCellDataWithTitle:[_dataTitleArr objectAtIndex:indexPath.row] imageName:[_dataIconArr objectAtIndex:indexPath.row] TitleFont:_titleFont TitleColor:_titleColor];
    
    return cell;
    
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self.delegate menuCollectionView:self didSelectItemAtIndexPath:indexPath];
    
}


/**
 *  根据宽度,水平数量,间距返回item宽度(必要条件屏幕边缘有间距)
 *
 *  @param width collectionView宽度
 *  @param num   item数量
 *  @param space 间距
 *
 *  @return item的宽度
 */
- (CGSize)getItemSizeCollectionWidth:(CGFloat)collectionWidth Num:(NSInteger)num Space:(CGFloat)space{
    
    if (num <= 0) {
        return CGSizeZero;
    }
    CGFloat itemWidth = (collectionWidth - (num + 1) * (space + 1)) / num;
    return CGSizeMake(itemWidth, itemWidth);
    
}
@end
