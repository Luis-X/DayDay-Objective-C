//
//  PaySelectedOptionView.h
//  DayDayObjectiveC
//
//  Created by LuisX on 2017/4/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PayOptionIcon               @"select_icon"      //选中icon
#define PayOptionUnIcon             @"unselect_icon"    //未选中icon
#define PayOptionTitle              @"title"            //标题
#define PayOptionSubTitle           @"sub_title"        //副标题
#define PayOptionMessage            @"message"          //描述（有该字段则不可勾选）
#define PayOptionMessageAlignment   @"messageAlignment" //对齐（NSTextAlignment）
typedef void (^SelectedIndex)(NSInteger index);

@interface PaySelectedOptionView : UIView
- (void)showOptionContentViewOptions:(NSArray *)options defaultIndex:(NSInteger)defaultIndex index:(SelectedIndex)index;
@end
