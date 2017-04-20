//
//  NSTimerViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/7/11.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "NSTimerViewController.h"

@interface NSTimerViewController ()

@property (strong, nonatomic)NSTimer *timer;

@end

@implementation NSTimerViewController{
    NSTimer *_timer;
}
//属性和成员变量同步(成员变量和属性映射起来)
@synthesize timer = _timer;


/**
 *  可以每隔固定时间发送一个消息
 *  通过此消息来调用相应的时间函数
 *  通过此函数可以在固定时间来完成一个固定时间间隔的任务
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 80, 40);
    [button setTitle:@"启动定时器" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *buttonStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStop.frame = CGRectMake(100, 200, 80, 40);
    [buttonStop setTitle:@"停止定时器" forState:UIControlStateNormal];
    [buttonStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //销毁定时器
    if (_timer.isValid) {
        [_timer invalidate];
        _timer = nil;
        NSLog(@"viewDidDisappear    销毁定时器!");
    }
    
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

- (void)pressStart{
    
    //NSTimer的类方法创建一个定时器并且启动这个定时器
    //参数1:  每隔多少秒调用定时器函数
    //参数2:  实现定时器函数的对象(指针)
    //参数3:  定时器函数对象
    //参数4:  可以传入定时器函数中一个参数,无参数传nil
    //参数5:  定时器是否重复操作
    //返回值:  返回一个新建好的定时器对象
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:@"小明参数" repeats:YES];
    
}

- (void)pressStop{
    
    if (_timer != nil) {
        //停止定时器,使定时器失效
        [_timer invalidate];
    }
    
}


//可以将定时器本身作为参数传递
- (void)updateTimer:(NSTimer *)timer{
    
    NSLog(@"Timer 并非百分百准确!!!   %@", timer.userInfo);
    
}

@end
















