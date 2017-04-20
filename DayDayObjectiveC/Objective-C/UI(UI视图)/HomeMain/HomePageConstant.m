//
//  HomePageConstant.m
//  LuisXKit
//
//  Created by LuisX on 16/9/20.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomePageConstant.h"
#import "STPopup.h"

@implementation HomePageConstant

//改变字符串数字颜色字体
+ (void)setRichNumberWithLabel:(UILabel*)label Color:(UIColor *)color FontSize:(CGFloat)size{
    
    if (label.text == nil) {
        //NSLog(@"过滤空数据");
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:label.text];
    NSString *temp = nil;
    for(int i = 0; i < [attributedString length]; i++){
        
        temp = [label.text substringWithRange:NSMakeRange(i, 1)];
        if([temp isEqualToString:@"0"] || [temp isEqualToString:@"1"] || [temp isEqualToString:@"2"] || [temp isEqualToString:@"3"] || [temp isEqualToString:@"4"] || [temp isEqualToString:@"5"] || [temp isEqualToString:@"6"] || [temp isEqualToString:@"7"] || [temp isEqualToString:@"8"] || [temp isEqualToString:@"9"]|| [temp isEqualToString:@"."] || [temp isEqualToString:@"-"]||[temp isEqualToString:@","] || [temp isEqualToString:@"￥"]){
            
            [attributedString setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, [UIFont systemFontOfSize:size],NSFontAttributeName, nil] range:NSMakeRange(i, 1)];
            
        }
        
    }
    label.attributedText = attributedString;
    
}

+ (void)addDeleteLineWithLabel:(UILabel *)label Color:(UIColor *)color{
    
    if (label.text == nil) {
        //NSLog(@"过滤空数据");
        return;
    }
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:label.text];
    //第一个参数addAttribute:是设置要中线（删除线）还是下划线。
    //第二个参数value：是设置线条的风格：虚线，实现，点线......
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle)  range:NSMakeRange(0, label.text.length)];
    
    [attri addAttribute:NSStrikethroughColorAttributeName value:color range:NSMakeRange(0, label.text.length)];
    [label setAttributedText:attri];
    
}

+ (void)showPopViewControllerWithMagicVC:(UIViewController *)magicVC AddController:(UIViewController *)addController{
    
    STPopupController *mainSTPopupVC = [[STPopupController alloc] initWithRootViewController:magicVC];
    //样式(中心,底部)
    mainSTPopupVC.style = STPopupStyleFormSheet;
    //动画效果
    mainSTPopupVC.transitionStyle = STPopupTransitionStyleSlideVertical;
    //透明
    mainSTPopupVC.containerView.backgroundColor = [UIColor whiteColor];
    //设置圆角
    mainSTPopupVC.containerView.layer.cornerRadius = 10;
    //隐藏导航栏
    mainSTPopupVC.navigationBarHidden = YES;
    [mainSTPopupVC presentInViewController:addController];
}

@end
