//
//  CenterCopyWritingCollectionViewCell.h
//  LuisXKit
//
//  Created by LuisX on 16/9/8.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CenterCopyWritingCollectionViewCellDelegate <NSObject>
@optional
- (void)chooseCellWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath;           //选中indexPath

@end

@interface CenterCopyWritingCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)NSIndexPath *cellIndexPath;
@property (nonatomic, assign) id <CenterCopyWritingCollectionViewCellDelegate> delegate;
- (void)updateSelectedButtonSatausIsSelected:(BOOL)isSelected;
@end
