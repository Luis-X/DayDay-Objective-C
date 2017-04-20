//
//  MenuCollectionView.h
//  LuisXKit
//
//  Created by LuisX on 16/9/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IMAGE_ITEM_SIZE CGSizeMake(100, 100)

typedef enum : NSUInteger {
    MenuCollectionViewStyleMoreButton,  //多按钮
    MenuCollectionViewStyleMoreImage,   //横滚图片
} MenuCollectionViewStyle;


@class MenuCollectionView;

@protocol MenuCollectionViewDelegate <NSObject>
@required
- (void)menuCollectionView:(MenuCollectionView *)view didSelectItemAtIndexPath:(NSIndexPath *)indexPath;            //点击回调

@end

@interface MenuCollectionView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>
- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray IconArray:(NSArray *)iconArray Space:(CGFloat)space CollectionWidth:(CGFloat)collectionWidth Style:(MenuCollectionViewStyle)style;
@property (nonatomic, assign)id <MenuCollectionViewDelegate> delegate;

@property (nonatomic, strong)UIImageView *backgroundImageView;      //背景图
@property (nonatomic, strong)UIFont *titleFont;                     //标题字体
@property (nonatomic, strong)UIColor *titleColor;                   //标题颜色
@property (nonatomic, strong)UIColor *iconColor;                    //图标颜色
@end
