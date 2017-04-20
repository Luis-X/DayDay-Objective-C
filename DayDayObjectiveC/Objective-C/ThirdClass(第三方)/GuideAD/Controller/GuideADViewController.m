//
//  GuideADViewController.m
//  DaRenShop
//
//  Created by LuisX on 16/9/7.
//  Copyright © 2016年 YunRuo. All rights reserved.
//

#import "GuideADViewController.h"
#import "EAIntroView.h"

@interface GuideADViewController ()<EAIntroDelegate>

@end

@implementation GuideADViewController{
    UIView *_rootView;
    EAIntroView *_guideADView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _rootView = self.view;
    [self showIntroWithCrossDissolve];
    
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

- (void)showIntroWithCrossDissolve {
    
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
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:_rootView.bounds andPages:@[page1,page2,page3]];
    [intro setDelegate:self];
    
    [intro showInView:_rootView animateDuration:0.3];
}

#pragma mark -EAIntroDelegate

@end
