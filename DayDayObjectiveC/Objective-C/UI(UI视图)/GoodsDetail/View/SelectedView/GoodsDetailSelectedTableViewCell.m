//
//  GoodsDetailSelectedTableViewCell.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsDetailSelectedTableViewCell.h"
#import "GoodsSizeCollectionViewCell.h"
#import "GoodsSizeCollectionReusableView.h"
#import "GoodsSizeSelectedModel.h"

@implementation GoodsDetailSelectedTableViewCell{
    UICollectionView *_chooseCollectionView;
    NSMutableArray *_allModelDataArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialData];
        [self createSubViews];
    }
    return self;
    
}

- (void)initialData{
    NSArray *array = @[@"19朵玫瑰礼盒", @"19朵红玫瑰礼盒+百合", @"33朵红玫瑰礼盒", @"33朵红玫瑰礼盒(三世情缘)", @"33朵香槟玫瑰礼盒(生日推荐)", @"38朵红玫瑰心连心礼盒(一见倾心)", @"19朵红玫瑰礼盒(热卖推荐)", @"19朵粉玫瑰礼盒(热卖推荐)", @"19朵混色玫瑰礼盒"];
    _allModelDataArr = [NSMutableArray array];
    
    for (NSString *title in array) {
        
        GoodsSizeSelectedModel *model = [GoodsSizeSelectedModel new];
        model.selected = NO;
        model.sizeName = title;
        [_allModelDataArr addObject:model];
        
    }
    
}

- (void)createSubViews{

    [self createChooseCollectionView];
    [self createNumberChooseView];
    
}


/**
 商品属性选择
 */
- (void)createChooseCollectionView{
    
    UICollectionViewLeftAlignedLayout *layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    layout.headerReferenceSize = CGSizeMake(375, 42);
    _chooseCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 0) collectionViewLayout:layout];
    _chooseCollectionView.backgroundColor = [UIColor whiteColor];
    _chooseCollectionView.dataSource = self;
    _chooseCollectionView.delegate = self;
    [self.contentView addSubview:_chooseCollectionView];
    [_chooseCollectionView registerClass:[GoodsSizeCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
    [_chooseCollectionView registerClass:[GoodsSizeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    //更新高度
    [_chooseCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo([_chooseCollectionView.collectionViewLayout collectionViewContentSize].height);
        
    }];

}

/**
 数量选择
 */
- (void)createNumberChooseView{
    
    UIView *numberSelectedView = [UIView new];
    numberSelectedView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:numberSelectedView];
    [numberSelectedView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_chooseCollectionView.mas_bottom).offset(10);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(50);
        
    }];
    
    UILabel *numberWordLabel = [LuisXKit labelAddView:self TextColor:COLOR_GOODSDETAIL_BLACK3 Font:[UIFont systemFontOfSize:14]];
    numberWordLabel.text = @"选择数量";
    [numberWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(numberSelectedView);
        make.left.equalTo(numberSelectedView).offset(10);
        
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
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _allModelDataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodsSizeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    GoodsSizeSelectedModel *model = [_allModelDataArr objectAtIndex:indexPath.row];
    cell.titleLabel.text = model.sizeName;
    cell.isSelected = model.selected;
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        GoodsSizeCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return headerView;
    }
    return nil;
    
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
   GoodsSizeSelectedModel *model = [_allModelDataArr objectAtIndex:indexPath.row];
    model.selected = YES;
    [collectionView reloadData];
}

#pragma mark -UICollectionViewDelegateLeftAlignedLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsSizeSelectedModel *model = [_allModelDataArr objectAtIndex:indexPath.row];
    NSString *textString = model.sizeName;
    CGFloat cell_width = [self settingCollectionViewItemWidthBoundingWithText:textString];
    return CGSizeMake(cell_width, 25);
}

//计算文字宽度
- (CGFloat)settingCollectionViewItemWidthBoundingWithText:(NSString *)text{
    //1,设置内容大小  其中高度一定要与item一致,宽度度尽量设置大值
    CGSize size = CGSizeMake(MAXFLOAT, 20);
    //2,设置计算方式
    //3,设置字体大小属性   字体大小必须要与label设置的字体大小一致
    NSDictionary *attributeDic = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    CGRect frame = [text boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin attributes:attributeDic context:nil];
    //4.添加左右间距
    return frame.size.width + 15;
}
@end
