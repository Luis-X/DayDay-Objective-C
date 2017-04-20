//
//  DataSelectedView.h
//  LuisXKit
//
//  Created by LuisX on 16/9/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataSelectedViewDelegate <NSObject>
@required

- (void)dataSelectedGoToday;        //今日
- (void)dataSelectedGoLastDay;      //下一天
- (void)dataSelectedGoNextDay;      //前一天

@end

@interface DataSelectedView : UIView
- (void)updateNowDateWithDate:(NSDate *)date;
@property (nonatomic, assign) id <DataSelectedViewDelegate> delegate;
@end
