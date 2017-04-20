//
//  SJTimeButton.h
//  LuisXKit
//
//  Created by LuisX on 2016/11/11.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SJ_Time_Unit @"秒"
@interface SJTimeButton : UIButton
@property (nonatomic, assign)NSInteger timeDuration;                 //倒计时时长
@property (nonatomic, copy) NSString *normalTitle;                   //标题(正常)
@property (nonatomic, copy) NSString *timeRunningTitle;              //标题(计时中)
@property (nonatomic, strong) UIFont *titleFont;                     //标题字体        默认: 17
@property (nonatomic, strong) UIColor *normalTitleColor;             //标题颜色(正常)   默认: white
@property (nonatomic, strong) UIColor *timeRunningTitleColor;        //标题颜色(计时中)  默认: white
@property (nonatomic, strong) UIColor *normalBackgroundColor;        //标题颜色(正常)   默认: white
@property (nonatomic, strong) UIColor *timeRunningBackgroundColor;   //标题颜色(计时中)  默认: white
@property (nonatomic, strong) UIColor *normalBorderColor;            //边框颜色(正常) 
@property (nonatomic, strong) UIColor *timeRunningBorderColor;       //边框颜色(计时中)
@end
