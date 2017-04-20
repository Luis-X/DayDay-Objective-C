//
//  HomePageTableViewCell.h
//  LuisXKit
//
//  Created by LuisX on 16/9/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomePageTableViewCellDelegate <NSObject>
@required

- (void)homeTableViewCellShareEvent;

@end
@interface HomePageTableViewCell : UITableViewCell
@property (nonatomic, assign) id <HomePageTableViewCellDelegate> delegate;
@end
