//
//  RuntimeViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "RuntimeViewController.h"
#import "Flower.h"
#import <objc/message.h>



@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //[self runtimeExample];
    [self runtimeExample1];
    //[self runtimeExample2];
    //[self runtimeExample3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**
 *  发送消息
 *  
 *  1.调用实例方法
 *  2.调用类方法
 */
- (void)runtimeExample{
    
    Flower *flower = [Flower new];
    //////////调用实例方法//////////
    [flower showName];
    [flower showOtherName:@"FX"];
    //本质(使用RunTime):对象发送消息
    //objc_msgSend(flower, @selector(showName));
    //objc_msgSend(flower, @selector(showOtherName:), @"FX");
    //输出:   LuisX
    //输出:   FX
    //输出:   LuisX
    //输出:   FX
    
    //////////调用类方法//////////
    [Flower showPrice];
    [Flower showOtherPrice:@"200"];
    //本质(使用RunTime):类发送消息
    //objc_msgSend([Flower class], @selector(showPrice));
    //objc_msgSend([Flower class], @selector(showOtherPrice:), @"200");
    //输出:   100
    //输出:   200
    //输出:   100
    //输出:   200
}

/**
 *  交换方法
 */
- (void)runtimeExample1{
    
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    
}

/**
 *  动态添加方法
 *  需要注销Flower中的声明showName方法
 */
- (void)runtimeExample2{
    
    // 给系统NSObject类动态添加属性name
    
//    NSObject *objc = [[NSObject alloc] init];
//    objc.name = @"XXX";
//    NSLog(@"%@",objc.name);
    
}

/**
 *  给分类添加属性
 */
- (void)runtimeExample3{
    
    
}
@end

#pragma mark -方法交换
@implementation UIImage (FXImage)

/**
 *  加载分类到内存时调用
 *
 *  1.获取imageWithName方法地址
 *  2.获取imageWithName方法地址
 *  3.交换方法地址，相当于交换实现方式
 *
 */
+ (void)load{
    
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(imageWithName, imageName);
    
}

/**
 *  自定义imageWithName方法
 *
 *  1.既能加载图片,又能打印
 *  2.此时调用imageWithName相当于调用imageName(二者已经交换)
 *
 *  注意:不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super.
 */
+ (instancetype)imageWithName:(NSString *)name{
    
    UIImage *image = [self imageWithName:name];
    if (image == nil) {
        NSLog(@"图片为空");
    }
    return image;
    
}

@end

// 定义关联的key
static const char *key = "name";

@implementation NSObject (Property)

- (NSString *)name{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, key);
}

- (void)setName:(NSString *)name{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
