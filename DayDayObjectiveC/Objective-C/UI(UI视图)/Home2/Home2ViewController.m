//
//  Home2ViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/21.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "Home2ViewController.h"
#import "SJQRCodeViewController.h"
#import "TZImagePickerController.h"
#import "CenterCopyWritringViewController.h"
#import "HomePageViewController.h"
#import "TYTabButtonPagerController.h"
#import "HomeMainViewController.h"
#import "NewMainViewController.h"
#import "SJScrollPageViewController.h"
@interface Home2ViewController ()<UITableViewDataSource, UITableViewDelegate, TZImagePickerControllerDelegate, TYPagerControllerDataSource, TYPagerControllerDelegate>

@end

@implementation Home2ViewController{
    NSArray *_allHomeDataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initailData];
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

- (void)initailData{
    
    _allHomeDataArr = @[@"二维码合成", @"图像选择", @"中央文案", @"首页新版", @"视图", @"分页", @"Loading", @"商品详情优化",  @"分类", @"lazy商品详情优化", @"支付面板"];
    
}


- (void)createMainView{

    UITableView *homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //homeTableView.backgroundColor = [UIColor redColor];
    homeTableView.dataSource = self;
    homeTableView.delegate = self;
    [self.view addSubview:homeTableView];
    [homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark -UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [_allHomeDataArr objectAtIndex:indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _allHomeDataArr.count;
    
}

#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //二维码合成
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        SJQRCodeViewController *sjQRCodeVC = [SJQRCodeViewController new];
        sjQRCodeVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sjQRCodeVC animated:YES];
        
    }
    
     if (indexPath.section == 0 && indexPath.row == 1) {
         [self showSelectedTZImagePickerController];
     }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        [self showCenterCopyWritingViewController];
        
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        
        NewMainViewController *newMainVC = [NewMainViewController new];
        newMainVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:newMainVC animated:YES];

    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        
        HomeMainViewController *new = [HomeMainViewController new];
        new.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:new animated:YES];
        
    }
    if (indexPath.section == 0 && indexPath.row == 5) {
        
        SJScrollPageViewController *scrollPageVC = [SJScrollPageViewController new];
        scrollPageVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:scrollPageVC animated:YES];
        
    }
    if (indexPath.section == 0 && indexPath.row == 6) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_WAITING AddedNavigationController:self.navigationController];
    }
    
    if (indexPath.section == 0 && indexPath.row == 7) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_GOODSDETAIL AddedNavigationController:self.navigationController];
    }
    
    if (indexPath.section == 0 && indexPath.row == 8) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_GOODSCLASS AddedNavigationController:self.navigationController];
    }
    
    if (indexPath.section == 0 && indexPath.row == 9) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTRE_PRODUCT AddedNavigationController:self.navigationController];
    }
    
    if (indexPath.section == 0 && indexPath.row == 10) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTRE_BUGVIDEO AddedNavigationController:self.navigationController];
    }
    
}

#pragma mark - TYPagerControllerDataSource

- (NSInteger)numberOfControllersInPagerController
{
    return 3;
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index{
    
    HomePageViewController *homePageVC = [HomePageViewController new];
    return homePageVC;
    
}


#pragma mark -图片多选
/**
 *  多选图片
 */
- (void)showSelectedTZImagePickerController{
    //多选最大张数
    //每行显示照片数
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:3 delegate:self];
    /*
     //在这里设置imagePickerVc的外观
     imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
     imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
     imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
     */
    //选择原生图片
    imagePickerVc.isSelectOriginalPhoto = YES;
    //显示拍照按钮
    imagePickerVc.allowTakePicture = YES;
    //允许选择视频
    imagePickerVc.allowPickingVideo = NO;
    //允许选择图片
    imagePickerVc.allowPickingImage = YES;
    //允许选择原生图片
    imagePickerVc.allowPickingOriginalPhoto = NO;
    //图片修改时间升序
    //imagePickerVc.sortAscendingByModificationDate = YES;
    
    __weak typeof(self) weakSelf = self;
    //获取用户选择照片
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        NSLog(@"%@", photos);
        
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

#pragma mark -TZImagePickerControllerDelegate
//取消
- (void)imagePickerControllerDidCancel:(TZImagePickerController *)picker {
    // NSLog(@"cancel");
}

//选择好了图片，如果assets非空，则用户选择了原图。
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets{
}

//用户选择好了视频
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset {
    
}

#pragma mark -中央文案
- (void)showCenterCopyWritingViewController{
    
    CenterCopyWritringViewController *centerCopyWritingVC = [CenterCopyWritringViewController new];
    centerCopyWritingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:centerCopyWritingVC animated:YES];
    
}
@end
