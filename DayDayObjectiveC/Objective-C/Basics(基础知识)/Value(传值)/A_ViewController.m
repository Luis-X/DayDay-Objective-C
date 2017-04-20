//
//  A_ViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/14.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "A_ViewController.h"
#import "B_ViewController.h"
#import "C_ViewController.h"
#import "ValueManager.h"

@interface A_ViewController ()<B_ViewControllerDelegate>

@end

@implementation A_ViewController


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //2.销毁通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"noticeSendValue" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //[self propertySendValue];
    //[self waySendValue];
    //[self useProtocolSendValue];
    //[self blockSendValue];
    //[self useDataHandelSendValue];
    //[self useNoticeSendValue];

    //[self useNSUserDefaultsSendValue];
    
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
 *  属性传值
 *  通过属性直接给下一界面传值
 */
- (void)propertySendValue{
    
    B_ViewController *BVC = [B_ViewController new];
    BVC.bString = @"A";
    [self.navigationController pushViewController:BVC animated:YES];
    
}

/**
 *  方法传值
 */
- (void)waySendValue{
    
    B_ViewController *BVC = [[B_ViewController alloc] initWithOne:@"A" Two:99.9];
    [self.navigationController pushViewController:BVC animated:YES];
    
}


/**
 *  代理传值
 */
- (void)useProtocolSendValue{
    
    B_ViewController *BVC = [B_ViewController new];
    BVC.myDelegate = self;
    [self.navigationController pushViewController:BVC animated:YES];
    
}
#pragma mark -B_ViewControllerDelegate
/**
 *  实现代理方法
 */
- (void)protocolSendValue:(NSString *)value{
    NSLog(@"%@", value);
}

/**
 *  Block传值
 */
- (void)blockSendValue{
    
    B_ViewController *BVC = [B_ViewController new];
    [self.navigationController pushViewController:BVC animated:YES];
    //3.结果
    BVC.valueBlock = ^(NSString *string){
        NSLog(@"B界面→A界面:%@", string);
    };
}

//单例传值
- (void)useDataHandelSendValue{
    
    ValueManager *valueManager = [ValueManager shareValueManager];
    valueManager.strValue = @"Singleton";
    
    C_ViewController *CVC = [C_ViewController new];
    [self.navigationController pushViewController:CVC animated:YES];
    
}


/**
 *  通知传值
 */
- (void)useNoticeSendValue{
    //1.注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptNotification:) name:@"noticeSendValue" object:nil];
    C_ViewController *CVC = [C_ViewController new];
    [self.navigationController pushViewController:CVC animated:YES];

}
- (void)acceptNotification:(NSNotification*)notification{
    
    NSLog(@"%@",  notification.userInfo);
    //输出:   {name = text;}
    
}

/**
 *  NSUserDefaults传值
 */
- (void)useNSUserDefaultsSendValue{
    C_ViewController *CVC = [C_ViewController new];
    [self.navigationController pushViewController:CVC animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults" forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
@end
