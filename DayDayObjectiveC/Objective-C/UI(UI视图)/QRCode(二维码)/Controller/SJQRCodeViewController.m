//
//  SJQRCodeViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/8/30.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "SJQRCodeViewController.h"
#import "LBXScanWrapper.h"

#define SJ_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SJ_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SJQRCodeViewController ()

@end

@implementation SJQRCodeViewController{
    UIImageView *_qrImgView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    //二维码
    CGFloat view_bounds = 250;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((SJ_SCREEN_WIDTH - view_bounds) / 2, (SJ_SCREEN_HEIGHT - view_bounds) / 2, view_bounds, view_bounds)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.shadowOffset = CGSizeMake(0, 2);
    view.layer.shadowRadius = 2;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.5;
    [self.view addSubview:view];

    //放置二维码图片
    _qrImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    //_qrImgView.backgroundColor = [UIColor redColor];
    [view addSubview:_qrImgView];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"生成" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(80);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-20);
        
    }];
    [button addTarget:self action:@selector(createQRCodeView) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)createQRCodeView{
    
   _qrImgView.image = nil;
   _qrImgView.image = [LBXScanWrapper createQRWithString:@"www.baidu.com" size:_qrImgView.bounds.size];
    
}

@end
