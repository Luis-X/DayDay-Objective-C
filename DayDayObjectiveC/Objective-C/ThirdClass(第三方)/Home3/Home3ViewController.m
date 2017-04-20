//
//  Home3ViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/21.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "Home3ViewController.h"

@interface Home3ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation Home3ViewController{
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
    
    _allHomeDataArr = @[@"EAIntroView(引导图)",
                        @"Mastory(自动约束)",
                        @"XLForm(快速列表)",
                        @"AsyncDisplayKit2.0(复杂界面流畅性)",
                        @"复杂界面流畅性",
                        @"Reachability(网络环境监听)",
                        @"iCarousel(滚动视图)",
                        @"WYPopoverController(气泡弹出视图)"
                        ,@"WebViewJavascriptBridge(JS原生交互)"];
    
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
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_GUIDEAD AddedNavigationController:self.navigationController];
    }
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_MASONARY AddedNavigationController:self.navigationController];
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_XLFROM AddedNavigationController:self.navigationController];
    }
    
    if (indexPath.section == 0 && indexPath.row == 3) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_ASYNCDISPLAYKIT AddedNavigationController:self.navigationController];
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_ASYNCDISPLAYKIT_UI AddedNavigationController:self.navigationController];
    }
    if (indexPath.section == 0 && indexPath.row == 5) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_NETWORK AddedNavigationController:self.navigationController];
    }
    if (indexPath.section == 0 && indexPath.row == 6) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_ICAROUSEL AddedNavigationController:self.navigationController];
    }
    if (indexPath.section == 0 && indexPath.row == 7) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTER_XYPOPOVER AddedNavigationController:self.navigationController];
    }
    if (indexPath.section == 0 && indexPath.row == 8) {
        [LuisXRouterManager showAnyViewControllerWithRouterURL:ROUTRE_WEBJS AddedNavigationController:self.navigationController];
    }
    
}
@end
