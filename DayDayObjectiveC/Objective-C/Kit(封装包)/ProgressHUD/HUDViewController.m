//
//  HUDViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HUDViewController.h"
#import "CustomAlertViewController.h"
#import "SJIconTextButton.h"
#import "SJTimeButton.h"
@interface HUDViewController ()

@end

@implementation HUDViewController{
    SJIconTextButton *_button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createMainViews];
}

- (void)createMainViews{
    
    /*
    //UILabel
    UILabel *textLabel = [LuisXKit labelAddView:self.view TextColor:[UIColor redColor] Font:FONT_SYSTEM_SIZE(20)];
    textLabel.text = @"123";
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        
    }];
   

    
    //UIImageView
    UIImageView *imageView = [LuisXKit imageViewAddView:self.view ClipsToBounds:YES ContentMode:1];
    imageView.image = [UIImage imageNamed:@"apple.png"];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    */
    /*
    //UIButton
    UIButton *button = [LuisXKit buttonAddView:self.view Title:@"显示" TitleColor:[UIColor redColor] Font:luisx_FONT_system_size(20) CornerRadius:5 BackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(showHUDProgress) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 50));
        
    }];
    
    //UITextField
    UITextField *textField = [LuisXKit textfieldAddView:self.view Placeholder:@"请输入" TextColor:[UIColor redColor] Font:luisx_FONT_system_size(20)];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view.mas_centerY).offset(20);
        make.size.mas_equalTo(CGSizeMake(200, 50));
        
    }];
    */
    /*
    //自定义HUD
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(300, 400));
        
    }];
    [LuisXKit showCustomHUDAddedTo:luisx_APP_keyWindow CustomView:view AnimationType:MBProgressHUDAnimationZoomOut CornerRadius:5 Margin:0 Offset:CGPointZero bezelViewColor:luisx_COLOR_white_alpha(1) BackgroundColor:luisx_COLOR_black_alpha(0.3)];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [LuisXKit hiddenMBProgressHUDForView:luisx_APP_keyWindow];
        
    });
    */
    
    _button = [[SJIconTextButton alloc] initWithFrame:CGRectMake(0, 100, 80, 100)];
    _button.backgroundColor = [UIColor orangeColor];
    _button.titleLabel.text = @"微信登录";
    _button.iconImageView.image = [UIImage imageNamed:@"luisx_github@2x.png"];
    _button.iconLabel.text = @"\U0000e63c";
    _button.buttonStyle = IconTextButtonStyleLeft;
    _button.buttonEdges = UIEdgeInsetsMake(20, 0, 20, 0);
    _button.iconFontSize = 25;
    [self.view addSubview:_button];
    [_button addTarget:self action:@selector(showHUDProgress) forControlEvents:UIControlEventTouchUpInside];
    
    
    SJTimeButton *timeButton = [SJTimeButton buttonWithType:UIButtonTypeCustom];
    timeButton.frame = CGRectMake(0, 0, 100, 50);
    timeButton.backgroundColor = [UIColor redColor];
//    timeButton.normalTitle = @"获取验证码";
//    timeButton.timeRunningTitle = @"已发送";
//    timeButton.timeDuration = 10;
//    timeButton.titleFont = [UIFont systemFontOfSize:14];
//    timeButton.normalTitleColor = [UIColor blackColor];
//    timeButton.normalBorderColor = [UIColor blackColor];
//    timeButton.normalBackgroundColor = [UIColor whiteColor];
//    timeButton.timeRunningTitleColor = [UIColor grayColor];
//    timeButton.timeRunningBorderColor = [UIColor grayColor];
//    timeButton.timeRunningBackgroundColor = [UIColor whiteColor];
//    timeButton.layer.borderWidth = 3;
//    timeButton.layer.cornerRadius = 5;
    [self.view addSubview:timeButton];
    
    [timeButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 50));
        
    }];
    //待修
    [timeButton addTarget:self action:@selector(showHUDProgress) forControlEvents:UIControlEventTouchUpInside];
    
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

- (void)showHUDProgress{

    //[LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_WAITING AddedNavigationController:self.navigationController];
    //[LuisXKit showWindowsProgressHUDText:@"请稍后..."];
    
//    if ([self getSkipPhoneBindingStatus]) {//进入首页
//        NSLog(@"进入首页");
//    }else{//绑定手机号
//        NSLog(@"绑定手机号");
//        [self skipPhoneBindingStep:YES];
//    }


}

/**
 是否开启跳过绑定手机号,以后不再进入该步骤
 */
- (void)skipPhoneBindingStep:(BOOL)step{
    [[NSUserDefaults standardUserDefaults] setBool:step forKey:@"skipPhoneBinding"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


/**
 获取跳过绑定状态
 */
- (BOOL)getSkipPhoneBindingStatus{
    BOOL skipPhoneBinding = [[NSUserDefaults standardUserDefaults] boolForKey:@"skipPhoneBinding"];
    return skipPhoneBinding;
}
@end
