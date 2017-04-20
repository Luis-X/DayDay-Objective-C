//
//  WaitingViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/25.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "WaitingViewController.h"

@interface WaitingViewController ()

@end

@implementation WaitingViewController{
    UIImageView *_loadingImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
   _loadingImageView = [LuisXKit imageViewAddView:self.view ClipsToBounds:NO ContentMode:1];
    _loadingImageView.backgroundColor = [UIColor redColor];
    [_loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    
//    loadingImageView.animationImages = [LuisXKit getBundleImageArrayWithBundleName:@"MVCommonUI" imageName:@"loading" Count:4]; //动画图片数组
//    loadingImageView.animationDuration = 0.4;                                                                               //动画时长
//    loadingImageView.animationRepeatCount = 0;                                                                              //动画重复
//    [loadingImageView startAnimating];                                                                                      //动画开始
//    
//    [self createMainView];
    
    [self startAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endAnimation];
    });
    
}

//开始动画
- (void)startAnimation{
    [self loadingViewOptionsAnimating:YES];
}

//结束动画
- (void)endAnimation{
    [self loadingViewOptionsAnimating:NO];
}

//加载动画
- (void)loadingViewOptionsAnimating:(BOOL)animating{

    if (!animating) {
        [_loadingImageView.layer removeAllAnimations];
        return;
    }
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [_loadingImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
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
    
    
}


@end
