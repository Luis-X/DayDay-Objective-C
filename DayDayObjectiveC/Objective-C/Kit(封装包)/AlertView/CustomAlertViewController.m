//
//  CustomAlertViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "CustomAlertViewController.h"
#define bigWid [UIScreen mainScreen].bounds.size.width
#define bigHei [UIScreen mainScreen].bounds.size.height
@interface CustomAlertViewController ()

@end

@implementation CustomAlertViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //为了弹出框效果,我们当然要把背景透明
    self.view.backgroundColor = [UIColor clearColor];
    //这里开始都是布局代码  可以根据界面效果阅读,不读也没什么影响  我这里定义了两个宏一个bigWid 一个bigHei 分别是屏幕的宽和高
    UIView *myView = [UIView new];
    myView.frame = CGRectMake(15, bigHei-175, bigWid-30, 160);
    myView.backgroundColor = [UIColor whiteColor];
    myView.layer.cornerRadius = 5;
    [self.view addSubview:myView];
    
    //分享微信 和朋友圈按钮
    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [bt1 setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [bt1 setTitle:@"分享给好友" forState:UIControlStateNormal];
    bt1.titleLabel.font = [UIFont systemFontOfSize:10];
    [bt1 setTitleEdgeInsets:UIEdgeInsetsMake(40, 0, -40, 0)];
    bt1.tintColor = [UIColor grayColor];
    bt1.frame = CGRectMake(40, 30, 50, 50);
    [bt1 sizeToFit];
    [myView addSubview:bt1];
    
    UIButton *bt2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [bt2 setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [bt2 setTitle:@"朋友圈分享" forState:UIControlStateNormal];
    bt2.titleLabel.font = [UIFont systemFontOfSize:10];
    [bt2 setTitleEdgeInsets:UIEdgeInsetsMake(40, 0, -40, 0)];
    bt2.tintColor = [UIColor grayColor];
    bt2.frame = CGRectMake(bigWid/2-35, 30, 50, 50);
    [bt2 sizeToFit];
    [myView addSubview:bt2];
    
    
    
    UIButton *bt3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [bt3 setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [bt3 setTitle:@"收藏" forState:UIControlStateNormal];
    
    bt3.titleLabel.font = [UIFont systemFontOfSize:10];
    [bt3 setTitleEdgeInsets:UIEdgeInsetsMake(40, 0, -40, 0)];
    bt3.tintColor = [UIColor grayColor];
    bt3.frame = CGRectMake(bigWid - 110, 30, 50, 50);
    [myView addSubview:bt3];
    
    
    
    //分割线
    UIView *deView = [[UIView alloc]initWithFrame:CGRectMake(0, 120, bigWid - 30, 1)];
    deView.backgroundColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    [myView addSubview:deView];
    
    //取消按钮
    UIButton *cancellBt = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancellBt setTitle:@"取消" forState:UIControlStateNormal];
    cancellBt.frame = CGRectMake(15, 120, bigWid - 60, 40);
    [myView addSubview:cancellBt];
    [cancellBt addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

}

//返回按钮
- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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
