//
//  HomePageConstant.h
//  LuisXKit
//
//  Created by LuisX on 16/9/20.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COLOR_PINK_TEXT [UIColor colorWithRed:0.97 green:0.15 blue:0.41 alpha:1.00]
#define COLOR_GRAY_TEXT [UIColor colorWithRed:0.43 green:0.43 blue:0.43 alpha:1.00]
#define COLOR_RED_TEXT [UIColor colorWithRed:0.96 green:0.22 blue:0.33 alpha:1.00]
@interface HomePageConstant : NSObject
+ (void)setRichNumberWithLabel:(UILabel*)label Color:(UIColor *) color FontSize:(CGFloat)size;
+ (void)addDeleteLineWithLabel:(UILabel *)label Color:(UIColor *)color;
+ (void)showPopViewControllerWithMagicVC:(UIViewController *)magicVC AddController:(UIViewController *)addController;
@end
