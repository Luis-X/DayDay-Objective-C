//
//  GoodsDetailMainViewController.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/1/5.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "GoodsDetailMainViewController.h"
#import "SJScrollPageView.h"
#import "GoodsDetailInfoTableViewCell.h"
#import "GoodsDetailSelectedTableViewCell.h"
#import "GoodsDetailCommentTableViewCell.h"
#import "GoodsDetailRecommendTableViewCell.h"
#import "GoodsDetailActivityTableViewCell.h"
@interface GoodsDetailMainViewController ()<UITableViewDataSource, UITableViewDelegate, GoodsDetailInfoTableViewCellDelegate, GoodsDetailActivityTableViewCellDelegate>

@end

@implementation GoodsDetailMainViewController{
    UITableView *_mainFirstPageView;       //商品页
    UIScrollView *_mainSecondPageView;     //详情页
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"商品详情页";
    
    [self createGoodsPageView];
    [self createDetailPageView];
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

/**
 初始化数据
 */
- (void)initailData{
    
}

/**
 主框架
 */
- (void)createMainView{
    
    SJScrollPageView *mainScrollPageView = [SJScrollPageView showScrollPageViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) FirstPageView:_mainFirstPageView SecondPageView:_mainSecondPageView];
    [self.view addSubview:mainScrollPageView];
    
}

/**
 商品页
 */
- (void)createGoodsPageView{
    
    UIImageView *goodsBrowerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320)];
    goodsBrowerView.backgroundColor = [UIColor whiteColor];
    goodsBrowerView.image = [UIImage imageNamed:@"text.png"];
    goodsBrowerView.contentMode = 3;
    goodsBrowerView.clipsToBounds = YES;
    
    _mainFirstPageView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _mainFirstPageView.tableHeaderView = goodsBrowerView;
    //_mainFirstPageView.backgroundColor = [UIColor blueColor];
    _mainFirstPageView.fd_debugLogEnabled = YES;
    _mainFirstPageView.dataSource = self;
    _mainFirstPageView.delegate = self;
    [_mainFirstPageView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [_mainFirstPageView registerClass:[GoodsDetailInfoTableViewCell class] forCellReuseIdentifier:@"infoCell"];
    [_mainFirstPageView registerClass:[GoodsDetailActivityTableViewCell class] forCellReuseIdentifier:@"activityCell"];
    [_mainFirstPageView registerClass:[GoodsDetailSelectedTableViewCell class] forCellReuseIdentifier:@"selectedCell"];
    [_mainFirstPageView registerClass:[GoodsDetailCommentTableViewCell class] forCellReuseIdentifier:@"commentCell"];
    [_mainFirstPageView registerClass:[GoodsDetailRecommendTableViewCell class] forCellReuseIdentifier:@"recommendCell"];
    
}

/**
 详情页
 */
- (void)createDetailPageView{
    
    _mainSecondPageView = [UIScrollView new];
    //_mainSecondPageView.backgroundColor = [UIColor orangeColor];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //商品信息
    if (indexPath.section == 0 && indexPath.row == 0) {
        GoodsDetailInfoTableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:@"infoCell" forIndexPath:indexPath];
        infoCell.delegate = self;
        return infoCell;
    }
    
    //活动信息
    if (indexPath.section == 1 && indexPath.row == 0) {
        GoodsDetailActivityTableViewCell *activityCell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
        activityCell.delegate = self;
        return activityCell;
    }
    
    //规格选择
    if (indexPath.section == 2 && indexPath.row == 0) {
        GoodsDetailSelectedTableViewCell *selectedCell = [tableView dequeueReusableCellWithIdentifier:@"selectedCell" forIndexPath:indexPath];
        return selectedCell;
    }
    
    //商品推荐
    if (indexPath.section == 3 && indexPath.row == 0) {
        GoodsDetailRecommendTableViewCell *selectedCell = [tableView dequeueReusableCellWithIdentifier:@"recommendCell" forIndexPath:indexPath];
        return selectedCell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
    
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"infoCell" cacheByIndexPath:indexPath configuration:^(id cell) {
            
        }];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"activityCell" cacheByIndexPath:indexPath configuration:^(id cell) {
            
        }];
    }
    
    if (indexPath.section == 2 && indexPath.row == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"selectedCell" cacheByIndexPath:indexPath configuration:^(id cell) {
            
        }];
    }
    
    if (indexPath.section == 3 && indexPath.row == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"recommendCell" cacheByIndexPath:indexPath configuration:^(id cell) {
            
        }];
    }
    return 100;
}

//预加载Cell内容
- (void)setupModelOfCell:(GoodsDetailInfoTableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


#pragma mark -GoodsDetailInfoTableViewCellDelegate
- (void)goodsDetailInfoTableViewCellShareButtonAction{
    NSLog(@"分享商品");
}

#pragma mark -GoodsDetailActivityTableViewCellDelegate
- (void)goodsDetailActivityTableViewCellActivityImageAction{
    NSLog(@"活动链接");
}

@end
