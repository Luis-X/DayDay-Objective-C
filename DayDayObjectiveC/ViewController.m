//
//  ViewController.m
//  DayDayObjectiveC
//
//  Created by LuisX on 2017/4/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  ViewController声明周期
 
 一、     viewDidLoad             第一次程序加载视图(只加载一次)
 二、     viewWillAppear          视图即将显示(每次显示都会调用)
 三、     viewDidAppear           视图已经显示
 四、     viewWillDisappear       视图即将消失
 五、     viewDidDisappear        视图已经消失
 
 */

- (instancetype)init{
    
    self = [super init];
    if (self) {
        NSLog(@"init");
    }
    return self;
    
}

/**
 *
 *  加载视图资源并初始化视图
 *
 */
- (void)loadView{
    
    [super loadView];
    NSLog(@"loadView");
    
}

/**
 *  一、第一次程序加载视图
 *
 *  只加载一次
 *  用途: 布局初始化视图,初始化资源
 */
- (void)viewDidLoad {
    
    //调用父类加载视图函数
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"viewDidLoad 第一次程序加载视图!");
    
}

/**
 *  二、视图即将显示
 *
 *  每一次视图显示都会被调用
 */
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear  视图即将显示!");
    
}

/**
 *  三、视图已经显示
 *
 *
 */
- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear   视图已经显示!");
    
}

/**
 *  四、视图即将消失
 *
 *
 */
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear   视图即将消失!");
    
}


/**
 *  五、视图已经消失
 *
 *
 */
- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear    视图已经消失!");
    
}




/**
 *  当系统内存过低时,会发起警告信息
 *  用途: 进行内存释放操作
 */
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"内存过低模拟: HardWare->Simulate Memory Warning");
    
}




//屏幕被点击时调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"屏幕被点击");
    
}

@end
