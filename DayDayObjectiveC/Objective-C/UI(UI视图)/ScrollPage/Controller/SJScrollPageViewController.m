//
//  SJScrollPageViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/27.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "SJScrollPageViewController.h"
#import "SJScrollPageView.h"

#define FX_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define FX_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface SJScrollPageViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation SJScrollPageViewController{
    SJScrollPageView *_mainScrollView;        //主ScrollView
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self createClassMainViews];
}

/**
 初始化视图
 */
- (void)createClassMainViews{
    
    //UIScrollView *firScrollView = [UIScrollView new];
    
    UITableView *firtTableView = [UITableView new];
    firtTableView.backgroundColor = [UIColor whiteColor];
    firtTableView.dataSource = self;
    firtTableView.delegate = self;
    [firtTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _mainScrollView = [SJScrollPageView showScrollPageViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) FirstPageView:firtTableView SecondPageView:[UIScrollView new]];
    
    [self.view addSubview:_mainScrollView];
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
    
}

@end
