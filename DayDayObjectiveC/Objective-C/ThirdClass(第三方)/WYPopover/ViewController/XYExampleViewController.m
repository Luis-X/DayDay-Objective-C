//
//  XYExampleViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/12/29.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "XYExampleViewController.h"
#import "WYPopoverController.h"
@interface XYExampleViewController ()<WYPopoverControllerDelegate>

@end

@implementation XYExampleViewController{
    WYPopoverController *_menuPopoverController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *mainScrollView = [UIScrollView new];
    mainScrollView.backgroundColor = [UIColor whiteColor];
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [self.view addSubview:mainScrollView];
    [mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
        
    }];
    
    UIButton *button = [LuisXKit buttonAddView:mainScrollView Title:@"open" TitleColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:12] CornerRadius:5 BackgroundColor:[UIColor orangeColor]];
    button.frame = CGRectMake(luisx_APP_screen_width - 150, 100, 100, 50);
    [button addTarget:self action:@selector(showMenuPopViewController:) forControlEvents:UIControlEventTouchUpInside];
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
 *  展开气泡菜单
 *
 */
- (void)showMenuPopViewController:(UIButton *)button{
    
    //NSLog(@"展开气泡");
    UIViewController *menuVC = [UIViewController new];
    //menuVC.view.backgroundColor = [UIColor redColor];
    
    _menuPopoverController = [[WYPopoverController alloc] initWithContentViewController:menuVC];
    _menuPopoverController.delegate = self;
    _menuPopoverController.popoverContentSize = CGSizeMake(luisx_APP_screen_width, 100);               //弹出视图大小
#pragma 气泡主题
    _menuPopoverController.theme.usesRoundedArrow = NO;                 //箭头是否圆角
    _menuPopoverController.theme.arrowHeight = 10;                      //箭头高度
    _menuPopoverController.theme.borderWidth = 5;                       //边宽
    _menuPopoverController.theme.outerCornerRadius = 5;                 //外部圆角
    _menuPopoverController.theme.innerCornerRadius = 5;                 //内部圆角
    //_menuPopoverController.theme.fillTopColor = [UIColor blueColor];         //顶部颜色(渐变)
    //_menuPopoverController.theme.fillBottomColor = [UIColor redColor];       //底部颜色(渐变)
    //_menuPopoverController.theme.overlayColor = [UIColor clearColor];   //覆盖颜色
    
    [_menuPopoverController presentPopoverFromRect:button.bounds
                                            inView:button
                          permittedArrowDirections:WYPopoverArrowDirectionUp
                                          animated:YES
                                           options:WYPopoverAnimationOptionFadeWithScale
                                        completion:nil];
    
}

#pragma mark -WYPopoverControllerDelegate
- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller{
    
    return YES;
    
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller{
    
    _menuPopoverController.delegate = nil;
    _menuPopoverController = nil;
    
}

@end
