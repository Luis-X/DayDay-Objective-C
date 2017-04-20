//
//  C_ViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/14.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "C_ViewController.h"
#import "ValueManager.h"

@interface C_ViewController ()

@end

@implementation C_ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    

    //[self useSingletonGetValue];
    //[self useNoticeSendValue];
    
    [self useNSUserDefaultsGetValue];
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
//单例取值
- (void)useSingletonGetValue{
    ValueManager *valueManager = [ValueManager shareValueManager];
    NSLog(@"%@", valueManager.strValue);
}


//通知传值
- (void)useNoticeSendValue{
    //3.发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noticeSendValue" object:self userInfo:@{@"name": @"text"}];
    
}

- (void)useNSUserDefaultsGetValue{
    
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"name"]);
    
}
@end
