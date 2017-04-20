//
//  GoodsDetailInfoTableViewCell.h
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GoodsDetailInfoTableViewCellDelegate <NSObject>

- (void)goodsDetailInfoTableViewCellShareButtonAction;      //分享

@end

@interface GoodsDetailInfoTableViewCell : UITableViewCell
@property (nonatomic, assign) id <GoodsDetailInfoTableViewCellDelegate> delegate;
@end
