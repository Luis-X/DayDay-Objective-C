//
//  Home4ViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/18.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "Home4ViewController.h"
#import "HUDViewController.h"
#import "SJImageDownloaderViewController.h"

@interface Home4ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation Home4ViewController{
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
    
    _allHomeDataArr = @[@"弹框", @"HUD", @"批量下载"];
    
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
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
     
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        UIViewController *hudVC = [HUDViewController new];
        [LuisXKit navigationController:self.navigationController pushViewController:hudVC HidesBottomBar:YES Animated:YES];
        
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        SJImageDownloaderViewController *sjImageDownloaderVC = [SJImageDownloaderViewController new];
        [LuisXKit navigationController:self.navigationController pushViewController:sjImageDownloaderVC HidesBottomBar:YES Animated:YES];
        
    }
    
}

@end
