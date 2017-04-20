//
//  HotViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/8/18.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HotViewController.h"
@interface HotViewController ()

@end

@implementation HotViewController{
    UIButton *_button1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"JSPatch";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createMainView];
    
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

- (void)createMainView{

    //动态展示列表
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"动态展示列表" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        
    }];
    
    
    //调用关联JS文件
    _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button1.backgroundColor = [UIColor orangeColor];
    [_button1 setTitle:@"JSPatch修复" forState:UIControlStateNormal];
    [self.view addSubview:_button1];
    [_button1 addTarget:self action:@selector(showJPViewController) forControlEvents:UIControlEventTouchUpInside];
    [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(button.mas_bottom).offset(20);
        make.centerX.equalTo(button);
        
    }];
}

/**
 *  按钮触发方法
 *
 */
- (void)handleBtn:(id)sender{
    
    //此处使用JSPatch动态添加
        
}

- (void)showJPViewController{
    
    
    
}


@end
