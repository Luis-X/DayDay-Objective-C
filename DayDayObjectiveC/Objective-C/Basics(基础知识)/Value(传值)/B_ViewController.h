//
//  B_ViewController.h
//  LuisXKit
//
//  Created by LuisX on 16/6/14.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <UIKit/UIKit.h>

//1.声明协议方法
@protocol B_ViewControllerDelegate <NSObject>

- (void)protocolSendValue:(NSString *)value;

@end


typedef void(^ValueBlock)(NSString *);

@interface B_ViewController : UIViewController
@property (nonatomic, copy) ValueBlock valueBlock;

//1.定义属性用来接收传过来值
@property (nonatomic, copy) NSString *bString;
//2.声明初始化方法
- (instancetype)initWithOne:(NSString *)one Two:(CGFloat)two;

//2.指定代理人
@property (nonatomic, weak) id <B_ViewControllerDelegate> myDelegate;
@end
