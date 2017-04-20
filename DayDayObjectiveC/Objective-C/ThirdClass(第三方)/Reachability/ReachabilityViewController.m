//
//  ReachabilityViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/24.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "ReachabilityViewController.h"
#import <Reachability.h>

@interface ReachabilityViewController ()

@end

@implementation ReachabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self networkReachabilityWithHostname:@"www.baidu.com"];
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

- (void)networkReachabilityWithHostname:(NSString *)hostName{
    Reachability* reach = [Reachability reachabilityWithHostname:hostName];
    reach.reachableBlock = ^(Reachability*reach){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"可连接!");
            [LuisXKit showWindowsOnlyTextHUDText:@"网络连接正常"];
        });
    };
    
    reach.unreachableBlock = ^(Reachability*reach){
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"不可连接!");
            [LuisXKit showWindowsOnlyTextHUDText:@"网络连接断开"];
        });
    };
    [reach startNotifier];

}
@end
