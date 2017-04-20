//
//  ClassMainViewController.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/2/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ClassMainViewController.h"
#import "NewClassTableViewCell.h"
#import "NewClassCollectionViewCell.h"

@interface ClassMainViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ClassMainViewController{
    UIView *_mainBannerView;
    UITableView *_mainTableView;
    UICollectionView *_mainCollectionView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createMainSubviews];
    [self setMainTableViewDefaultRow:0 scrollPosition:UITableViewScrollPositionTop];
}

//默认选中
- (void)setMainTableViewDefaultRow:(NSInteger)row scrollPosition:(UITableViewScrollPosition)scrollPosition{
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:row inSection:0];
    [_mainTableView scrollToRowAtIndexPath:indexpath atScrollPosition:scrollPosition animated:NO];
    [_mainTableView selectRowAtIndexPath:indexpath animated:YES scrollPosition:scrollPosition];
    
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

- (void)createMainSubviews{
    
    [self createMainBannerView];
    [self createMainTableView];
    [self createMainCollectionView];
}

//banner框架
- (void)createMainBannerView{
    
    UIView *bannerView = [UIView new];
    bannerView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:bannerView];
    [bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(220);
        
    }];
    _mainBannerView = bannerView;
    
}

//tableView框架
- (void)createMainTableView{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.alwaysBounceVertical = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[NewClassTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_mainBannerView.mas_bottom);
        make.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(80);
        
    }];
    _mainTableView = tableView;
    
}

//collecitonView框架
- (void)createMainCollectionView{
    
    double item_width = (self.view.frame.size.width - 80 -  (2 * 5) - (2 * 10)) / 3;
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.itemSize = CGSizeMake(item_width, item_width);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.alwaysBounceVertical = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[NewClassCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_mainBannerView.mas_bottom);
        make.left.equalTo(_mainTableView.mas_right);
        make.right.bottom.equalTo(self.view);
        
    }];
    _mainCollectionView = collectionView;
    
}


#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewClassTableViewCell *cell = (NewClassTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
    
}

#pragma mark -UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"类%ld ", indexPath.row);
     [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma mark -UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NewClassCollectionViewCell *cell = (NewClassCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    return cell;
    
}

#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"商品%ld", indexPath.row);
}

@end
