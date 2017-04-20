//
//  AppDelegate.m
//  DayDayObjectiveC
//
//  Created by LuisX on 2017/4/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "Home2ViewController.h"
#import "Home3ViewController.h"
#import "Home4ViewController.h"
#import <JSPatch/JSPatch.h>
#import <FBMemoryProfiler/FBMemoryProfiler.h>
#import "HomeNaViewController.h"

#import "EAIntroView.h"                 //引导图
@interface AppDelegate ()<EAIntroDelegate>

@end

@implementation AppDelegate{
    FBMemoryProfiler *_memoryProfiler;
}

/**
 *
 *  七、当应用程序载入后执行
 *
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建一个window对象,属于AppDelegate的属性
    //UIScreen:      表示屏幕硬件类
    //mainScreen:    获得主屏幕信息
    //bounds:        当前手机屏幕大小
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //热修复线上
    /*
     [JSPatch startWithAppKey:@""];
     [JSPatch sync];
     */
    
    //热修复本地
    [JSPatch testScriptInBundle];
    [JSPatch sync];
    
    //基础知识
    HomeViewController *home1VC = [HomeViewController new];
    UINavigationController *home1NaVC = [[UINavigationController alloc] initWithRootViewController:home1VC];
    
    home1NaVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"基础知识" image:[[UIImage imageNamed:@"luisx_book.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"luisx_book.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //UI
    Home2ViewController *home2VC = [Home2ViewController new];
    UINavigationController *home2NaVC = [[UINavigationController alloc] initWithRootViewController:home2VC];
    home2NaVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"UI" image:[[UIImage imageNamed:@"luisx_ui.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"luisx_ui.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //第三方
    Home3ViewController *home3VC = [Home3ViewController new];
    UINavigationController *home3NaVC = [[UINavigationController alloc] initWithRootViewController:home3VC];
    home3NaVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第三方" image:[[UIImage imageNamed:@"luisx_github.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"luisx_github.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //封装包
    Home4ViewController *home4VC = [Home4ViewController new];
    UINavigationController *home4NaVC = [[UINavigationController alloc] initWithRootViewController:home4VC];
    home4NaVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"封装包" image:[[UIImage imageNamed:@"luisx_kit.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"luisx_kit.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarController *menuTabBarController = [[UITabBarController alloc] init];
    menuTabBarController.viewControllers = @[home1NaVC, home2NaVC, home3NaVC, home4NaVC];
    
    
    //对窗口的根视图控制器进行赋值操作
    //整个UIKit框架中只有一个根视图控制器,属于window的属性
    //视图控制器用来管理界面和处理界面的逻辑类对象
    //程序启动前必须对根视图控制器赋值
    
    self.window.rootViewController = menuTabBarController;
    //将window作为主视图并且显示
    [self.window makeKeyAndVisible];
    
    //[self openFBMemoryProfiler];
    //[self showGuidADViewAddView:menuTabBarController.view];
    return YES;
}

/**
 *  开启FBMemoryProfiler自动检查内存泄漏
 */
- (void)openFBMemoryProfiler{
    
    FBMemoryProfiler *memoryProfiler = [FBMemoryProfiler new];
    [memoryProfiler enable];
    _memoryProfiler = memoryProfiler;
    
}

/**
 *
 *  一、当应用程序将要进入非活动状态执行(在此期间,应用程序不接收消息或事件)
 *
 */
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

/**
 *
 *  三、当应用程序被推送到后台时调用
 *
 */
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

/**
 *
 *  四、当应用程序从后台将要重新回到前台时调用
 *
 */
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

/**
 *
 *  二、当应用程序进入活动状态时执行
 *
 */
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

/**
 *
 *  五、当应用程序要退出时调用(保存数据,退出前清理工作)
 *
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *
 *  六、当应用程序终止前会执行这个方法(内存清理,防止程序被终止)
 *
 */
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    
}

/**
 *
 *  八、打开URL时执行
 *
 */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return YES;
}


- (void)showGuidADViewAddView:(UIView *)view{
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = @"sampleDescription1";
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = @"sampleDescription2";
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = @"sampleDescription3";
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:view.bounds andPages:@[page1,page2,page3]];
    [intro setDelegate:self];
    
    [intro showInView:view animateDuration:0.3];
}
@end
