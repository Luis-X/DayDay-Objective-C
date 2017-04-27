//
//  BugVideoViewController.m
//  DayDayObjective-C
//
//  Created by LuisX on 2017/3/21.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "BugVideoViewController.h"
#import "PaySelectedOptionView.h"
@interface BugVideoViewController ()

@end

@implementation BugVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
    NSArray *normalArray = @[@{PayOptionIcon:@"pay_alipay", PayOptionUnIcon:@"pay_alipay", PayOptionTitle:@"支付宝支付"},
                             @{PayOptionIcon:@"pay_wechat", PayOptionUnIcon:@"pay_wechat", PayOptionTitle:@"微信支付"},
                             @{PayOptionIcon:@"pay_mime", PayOptionUnIcon:@"pay_mime", PayOptionTitle:@"购给利分期支付", PayOptionSubTitle:@"0元手续费，免息购～", PayOptionMessage:@"您的申请", PayOptionMessageAlignment:@2}];
    
    
    PaySelectedOptionView *view = [PaySelectedOptionView new];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.right.equalTo(self.view);
    }];
    [view showOptionContentViewOptions:normalArray defaultIndex:0 index:^(NSInteger index) {
        NSLog(@"%ld", index);
    }];
    
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

@end
