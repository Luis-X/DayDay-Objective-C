//
//  HomeMainViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/9/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomeMainViewController.h"
#import "MainTouchTableTableView.h"
#import "HomePageManageView.h"
#import "HomePageViewController.h"
#import "HomeTableViewHeaderFooterView.h"

#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
static CGFloat const headViewHeight = 0;

@interface HomeMainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic ,strong)MainTouchTableTableView *mainTableView;
@property (nonatomic, strong)HomePageManageView *homePageManageView;
@property (nonatomic, strong)HomeTableViewHeaderFooterView *homeHeaderView;

@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

@end

@implementation HomeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self createMainViews];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:@"leaveTop" object:nil];
    
}

//主框架
- (void)createMainViews {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //主框架
    _mainTableView= [[MainTouchTableTableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    _mainTableView.delegate=self;
    _mainTableView.dataSource=self;
    _mainTableView.showsVerticalScrollIndicator = NO;
    _mainTableView.contentInset = UIEdgeInsetsMake(headViewHeight,0, 0, 0);
    _mainTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_mainTableView];
    
    //头部视图
    _homeHeaderView = [[HomeTableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, -headViewHeight, Main_Screen_Width, headViewHeight)];
    [self.mainTableView addSubview:self.homeHeaderView];
    
}

- (void)acceptMsg:(NSNotification *)notification{
    
    NSDictionary *userInfo = notification.userInfo;
    NSString *canScroll = userInfo[@"canScroll"];
    if ([canScroll isEqualToString:@"1"]) {
        _canScroll = YES;
    }
    
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

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /**
     * 处理联动
     */
    //获取滚动视图y值的偏移量
    CGFloat tabOffsetY = [_mainTableView rectForSection:0].origin.y;
    CGFloat offsetY = scrollView.contentOffset.y;
    
    _isTopIsCanNotMoveTabViewPre = _isTopIsCanNotMoveTabView;
    if (offsetY>=tabOffsetY) {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        _isTopIsCanNotMoveTabView = YES;
    }else{
        _isTopIsCanNotMoveTabView = NO;
    }
    if (_isTopIsCanNotMoveTabView != _isTopIsCanNotMoveTabViewPre) {
        if (!_isTopIsCanNotMoveTabViewPre && _isTopIsCanNotMoveTabView) {
            //NSLog(@"滑动到顶端");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"goTop" object:nil userInfo:@{@"canScroll":@"1"}];
            _canScroll = NO;
        }
        if(_isTopIsCanNotMoveTabViewPre && !_isTopIsCanNotMoveTabView){
            //NSLog(@"离开顶端");
            if (!_canScroll) {
                scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            }
        }
    }
    
}





#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //添加pageView
    [cell.contentView addSubview:self.setPageViewControllers];
    
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return Main_Screen_Height;
}


/*
 * 设置横向滚动Controllers
 */
- (UIView *)setPageViewControllers{
    
    if (!_homePageManageView) {
        
        HomePageViewController * First= [HomePageViewController new];
        HomePageViewController * Second= [HomePageViewController new];
        HomePageViewController * Three= [HomePageViewController new];
        NSArray *controllers = @[First,Second,Three];
        
         _homePageManageView = [[HomePageManageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 64) controllers:controllers  ParentController:self];
       
    }
    
    return _homePageManageView;
}

@end
