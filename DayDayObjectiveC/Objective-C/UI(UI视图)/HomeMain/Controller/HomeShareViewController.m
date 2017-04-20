//
//  HomeShareViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/9/20.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomeShareViewController.h"
#import "STPopup.h"
#import "MenuCollectionView.h"

@interface HomeShareViewController ()<MenuCollectionViewDelegate>

@end

@implementation HomeShareViewController{
    MenuCollectionView *_shareImageCollectionView;
    MenuCollectionView *_menuView;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        //尺寸
        self.contentSizeInPopup = CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, 335);
        self.title = @"SKII护肤洁面霜"
        ;        /*
         //边框颜色
         [STPopupNavigationBar appearance].barTintColor = [UIColor whiteColor];
         //按钮颜色
         [STPopupNavigationBar appearance].tintColor = [UIColor grayColor];
         //标题属性
         [STPopupNavigationBar appearance].titleTextAttributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:18 weight:0.5], NSForegroundColorAttributeName: [UIColor blackColor]};
         */
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    //关闭按钮
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //closeButton.backgroundColor = [UIColor redColor];
    [closeButton setImage:[UIImage imageNamed:@"home_share_close_button"] forState:UIControlStateNormal];
    [self.view addSubview:closeButton];
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.width.height.mas_equalTo(33);
        
    }];
    [closeButton addTarget:self action:@selector(dismissHomeShareViewController) forControlEvents:UIControlEventTouchUpInside];
    
    //标题
    UILabel *titleLabel = [UILabel new];
    //titleLabel.backgroundColor = [UIColor orangeColor];
    titleLabel.text = @"SKII护肤界面霜";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.numberOfLines = 2;
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(closeButton);
        make.right.equalTo(closeButton.mas_left).offset(-10);
        
    }];
    
    //多图滚动
    _shareImageCollectionView = [[MenuCollectionView alloc] initWithFrame:CGRectZero TitleArray:@[@"", @"", @"", @"",@"", @"", @"", @""] IconArray:@[@"goods.jpg", @"goods.jpg", @"goods.jpg", @"goods.jpg",@"goods.jpg", @"goods.jpg", @"goods.jpg", @"goods.jpg"] Space:10 CollectionWidth:self.view.frame.size.width Style:MenuCollectionViewStyleMoreImage];
    _shareImageCollectionView.backgroundImageView.backgroundColor = [UIColor whiteColor];
    _shareImageCollectionView.titleColor = [UIColor blackColor];
    _shareImageCollectionView.titleFont = [UIFont systemFontOfSize:13];
    _shareImageCollectionView.delegate = self;
    [self.view addSubview:_shareImageCollectionView];
    [_shareImageCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.view);
        make.top.equalTo(closeButton.mas_bottom).offset(20);
        
    }];

    
    //固定按钮
    _menuView = [[MenuCollectionView alloc] initWithFrame:CGRectZero TitleArray:@[@"二维码海报", @"商品页面", @"复制链接", @"多图分享"] IconArray:@[@"\U0000e63e", @"\U0000e63b", @"\U0000e63d", @"\U0000e63c"] Space:10 CollectionWidth:self.view.frame.size.width Style:MenuCollectionViewStyleMoreButton];
    _menuView.backgroundImageView.backgroundColor = [UIColor whiteColor];
    _menuView.titleColor = [UIColor blackColor];
    _menuView.titleFont = [UIFont systemFontOfSize:13];
    _menuView.delegate = self;
    [self.view addSubview:_menuView];
    [_menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_shareImageCollectionView.mas_bottom).offset(20);
        make.left.right.equalTo(self.view);
        
    }];
    
}

- (void)dismissHomeShareViewController{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}

#pragma mark -MenuCollectionViewDelegate
- (void)menuCollectionView:(MenuCollectionView *)view didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (view == _menuView) {
        
        if (indexPath.section == 0 && indexPath.row == 0) {
            NSLog(@"二维码海报");
        }
        if (indexPath.section == 0 && indexPath.row == 1) {
            NSLog(@"商品页面");
        }
        if (indexPath.section == 0 && indexPath.row == 2) {
            NSLog(@"复制链接");
        }
        if (indexPath.section == 0 && indexPath.row == 3) {
            NSLog(@"多图分享");
        }
        
    }
    
    if (view == _shareImageCollectionView) {
        NSLog(@"%@", indexPath);
    }
    
}
@end
