//
//  HomeViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/21.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomeViewController.h"
#import "ErgodicViewController.h"
#import "A_ViewController.h"
#import "KVCViewController.h"
#import "KVOViewController.h"
#import "RuntimeViewController.h"
#import "ArithmeticViewController.h"
#import "ViewController.h"
#import "NSTimerViewController.h"
#import "DrawViewController.h"
#import "HotViewController.h"
#import "PermissionViewController.h"
#import "StringViewController.h"

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation HomeViewController{
    
    NSArray *_allHomeDataArr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initailData];
    [self createMainViews];
}

- (void)initailData{
    
    _allHomeDataArr = @[@"传值方式总结", @"遍历总结", @"KVC(键值编码)", @"KVO(观察者)", @"Runtime(运行时)", @"算法", @"ViewController生命周期", @"NSTimer定时器", @"Draw绘图", @"热修复", @"系统权限", @"类"];
    
}

- (void)createMainViews{

    UITableView *homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //homeTableView.backgroundColor = [UIColor redColor];
    homeTableView.dataSource = self;
    homeTableView.delegate = self;
    [self.view addSubview:homeTableView];
    [homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
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
    
    //传值
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        A_ViewController *aVC = [A_ViewController new];
        aVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:aVC animated:YES];
        
    }
    
    //遍历
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        ErgodicViewController *ergodicVC = [ErgodicViewController new];
        ergodicVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ergodicVC animated:YES];
    
    }
    
    //KVC
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        KVCViewController *kvcVC = [KVCViewController new];
        kvcVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:kvcVC animated:YES];
        
    }
    
    //KVO
    if (indexPath.section == 0 && indexPath.row == 3) {
        
        KVOViewController *kvcVC = [KVOViewController new];
        kvcVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:kvcVC animated:YES];
        
    }
    
    //Runtime
    if (indexPath.section == 0 && indexPath.row == 4) {
        
        RuntimeViewController *runtimeVC = [RuntimeViewController new];
        runtimeVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:runtimeVC animated:YES];
        
    }

    //算法
    if (indexPath.section == 0 && indexPath.row == 5) {
        
        ArithmeticViewController *arithmeticVC = [ArithmeticViewController new];
        arithmeticVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:arithmeticVC animated:YES];
        
    }
    
    //ViewController生命周期
    if (indexPath.section == 0 && indexPath.row == 6) {
        ViewController *viewController = [ViewController new];
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    //NStimer定时器
    if (indexPath.section == 0 && indexPath.row == 7) {
        NSTimerViewController *timerVC = [NSTimerViewController new];
        timerVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:timerVC animated:YES];
    }

    //Draw绘图
    if (indexPath.section == 0 && indexPath.row == 8) {
        DrawViewController *drawVC = [DrawViewController new];
        drawVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:drawVC animated:YES];
    }

    //热修复
    if (indexPath.section == 0 && indexPath.row == 9) {
        HotViewController *hotVC = [HotViewController new];
        hotVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:hotVC animated:YES];
    }
    
    //系统权限
    if (indexPath.section == 0 && indexPath.row == 10) {
        PermissionViewController *permissionVC = [PermissionViewController new];
        permissionVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:permissionVC animated:YES];
    }
    
    if (indexPath.section == 0 && indexPath.row == 11) {
        StringViewController *vc = [StringViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
