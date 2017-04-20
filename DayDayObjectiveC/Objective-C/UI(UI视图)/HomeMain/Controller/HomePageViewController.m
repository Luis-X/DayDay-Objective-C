//
//  HomePageViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/9/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageTableViewCell.h"
#import "HomeTableViewHeaderFooterView.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "HomeShareViewController.h"
#import "HomePageConstant.h"

@interface HomePageViewController ()<UITableViewDelegate, UITableViewDataSource, HomePageTableViewCellDelegate>

@end

@implementation HomePageViewController{
    HomeTableViewHeaderFooterView *_homeTableViewHeader;
    UITableView *_mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self createMainTableView];
    
}

//主框架
- (void)createMainTableView{
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _mainTableView.backgroundColor = [UIColor whiteColor];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.fd_debugLogEnabled = NO;
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mainTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_mainTableView];
    [_mainTableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_mainTableView registerClass:[HomeTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.bottom.right.equalTo(self.view);
        
    }];
    
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

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
    
}
#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(id cell) {
        //[self setupModelOfCell:cell AtIndexPath:indexPath];
        
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
}

#warning 重点(自适应高度必须实现)
//预加载Cell内容
- (void)setupModelOfCell:(HomePageTableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath{
    //cell.model = [_allDataArr objectAtIndex:indexPath.row];
}

- (void)showHomeShareViewController{
    
    HomeShareViewController *homeShareVC = [HomeShareViewController new];
    [HomePageConstant showPopViewControllerWithMagicVC:homeShareVC AddController:self];
    
}

#pragma mark -HomePageTableViewCellDelegate
- (void)homeTableViewCellShareEvent{
    
    [self showHomeShareViewController];
    
}

@end
