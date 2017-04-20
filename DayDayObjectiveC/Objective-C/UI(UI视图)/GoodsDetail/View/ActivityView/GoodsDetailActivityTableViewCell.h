//
//  GoodsDetailActivityTableViewCell.h
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GoodsDetailActivityTableViewCellDelegate <NSObject>

- (void)goodsDetailActivityTableViewCellActivityImageAction;    //活动事件

@end

@interface GoodsDetailActivityTableViewCell : UITableViewCell
@property (nonatomic, assign) id <GoodsDetailActivityTableViewCellDelegate> delegate;
@end
