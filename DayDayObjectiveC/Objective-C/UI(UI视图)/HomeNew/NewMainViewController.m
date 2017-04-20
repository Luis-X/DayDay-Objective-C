//
//  NewMainViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/9/30.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "NewMainViewController.h"
#import "MainTableViewCell.h"

@interface NewMainViewController ()<UITableViewDataSource, UITableViewDelegate>
@end

@implementation NewMainViewController{
    UITableView *_mainTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //主框架
    _mainTableView= [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _mainTableView.delegate=self;
    _mainTableView.dataSource=self;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.backgroundColor = [UIColor orangeColor];
    [_mainTableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_mainTableView];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.bottom.right.equalTo(self.view);
        
    }];
    
    _mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
    
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 668;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
@end
