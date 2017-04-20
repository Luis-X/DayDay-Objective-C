//
//  ProductDetailViewController.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/3/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductBannerView.h"
#import "ProductShareBarView.h"
#import "ProductInfoView.h"
#import "ProductActivityView.h"
#import "ProductCommentView.h"
#import "ProductRecommendView.h"
#import "ProductSelectionView.h"

@interface ProductDetailViewController ()<TMMuiLazyScrollViewDataSource>

@end

@implementation ProductDetailViewController{
    TMMuiLazyScrollView *_mainScrollview;
    NSMutableArray * rectArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initialData];
    [self createMainViews];
    [self managerAllModuleRectData];
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

- (void)initialData{
    rectArray  = [NSMutableArray array];
}


- (void)createMainViews{
    
    //1.创建LazyScrollView
    _mainScrollview = [[TMMuiLazyScrollView alloc] initWithFrame:self.view.bounds];
    _mainScrollview.dataSource = self;
    //_mainScrollview.showsVerticalScrollIndicator = YES;
    [self.view addSubview:_mainScrollview];

}


/**
 管理所有模块Rect数据
 */
- (void)managerAllModuleRectData{
    
    //2.装载模块layout
    CGFloat module_x = 5;
    CGFloat module_y = 10;
    CGFloat module_width = CGRectGetWidth(self.view.bounds) - 2 * module_x;
    
    CGRect rect_0 = CGRectMake(module_x, 0, module_width, 320);
    CGRect rect_1 = CGRectMake(module_x, CGRectGetMaxY(rect_0) + 5, module_width, 40);
    CGRect rect_2 = CGRectMake(module_x, CGRectGetMaxY(rect_1) + 5, module_width, 50);           //动态高度 height最小高度
    CGRect rect_3 = CGRectMake(module_x, CGRectGetMaxY(rect_2) + module_y, module_width, 50);
    CGRect rect_4 = CGRectMake(module_x, CGRectGetMaxY(rect_3) + module_y, module_width, 150);
    CGRect rect_5 = CGRectMake(module_x, CGRectGetMaxY(rect_4) + module_y, module_width, 50);
    CGRect rect_6 = CGRectMake(module_x, CGRectGetMaxY(rect_5) + module_y, module_width, 200);
    
    [self allRectArrayAddObjectRect:rect_0];
    [self allRectArrayAddObjectRect:rect_1];
    [self allRectArrayAddObjectRect:rect_2];
    [self allRectArrayAddObjectRect:rect_3];
    [self allRectArrayAddObjectRect:rect_4];
    [self allRectArrayAddObjectRect:rect_5];
    [self allRectArrayAddObjectRect:rect_6];
    
    _mainScrollview.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), CGRectGetMaxY(rect_6));
    
    //3.刷新数据
    [_mainScrollview reloadData];

}

- (void)allRectArrayAddObjectRect:(CGRect)rect{
    [rectArray addObject:[NSValue valueWithCGRect:rect]];
}

#pragma mark - TMMuiLazyScrollViewDataSource
// 返回View个数
- (NSUInteger)numberOfItemInScrollView:(TMMuiLazyScrollView *)scrollView{
    return rectArray.count;
}

// 返回RectModel
- (TMMuiRectModel *)scrollView:(TMMuiLazyScrollView *)scrollView rectModelAtIndex:(NSUInteger)index{
    
    CGRect rect = [[rectArray objectAtIndex:index] CGRectValue];
    TMMuiRectModel *rectModel = [TMMuiRectModel new];
    rectModel.absoluteRect = rect;
    rectModel.muiID = [NSString stringWithFormat:@"%ld",index];
    return rectModel;
    
}

- (UIView *)scrollView:(TMMuiLazyScrollView *)scrollView itemByMuiID:(NSString *)muiID{
    
    NSInteger index = [muiID integerValue];
    CGRect rect = [[rectArray objectAtIndex:index] CGRectValue];
    return [self moduleScrollView:scrollView cellForRowAtIndex:index rect:rect];
    
}

#pragma mark - module
- (UIView *)moduleScrollView:(TMMuiLazyScrollView *)scrollView cellForRowAtIndex:(NSInteger)index rect:(CGRect)rect{
    
    //横幅
    if (index == 0) {
        ProductBannerView *bannerView = (ProductBannerView *)[scrollView dequeueReusableItemWithIdentifier:@"banner"];
        if (!bannerView) {
            bannerView = [[ProductBannerView alloc] initWithFrame:rect reuseIdentifier:@"banner"];
        }
        bannerView.frame = rect;
        bannerView.backgroundColor = [self randomColor];
        [scrollView addSubview:bannerView];
        return bannerView;
    }
    //分享
    if (index == 1) {
        ProductShareBarView *shareBarView = (ProductShareBarView *)[scrollView dequeueReusableItemWithIdentifier:@"shareBar"];
        if (!shareBarView) {
            shareBarView = [[ProductShareBarView alloc] initWithFrame:rect reuseIdentifier:@"shareBar"];
        }
        shareBarView.frame = rect;
        shareBarView.backgroundColor = [self randomColor];
        [scrollView addSubview:shareBarView];
        return shareBarView;
    }
    //信息
    if (index == 2) {
        ProductInfoView *infoView = (ProductInfoView *)[scrollView dequeueReusableItemWithIdentifier:@"info"];
        if (!infoView){
            infoView = [[ProductInfoView alloc] initWithFrame:rect reuseIdentifier:@"info"];
        }
        infoView.frame = rect;
        infoView.backgroundColor = [self randomColor];
        [scrollView addSubview:infoView];
        [infoView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)]];
        return infoView;
    }
    //活动
    if (index == 3) {
        ProductActivityView *activityView = (ProductActivityView *)[scrollView dequeueReusableItemWithIdentifier:@"activity"];
        if (!activityView) {
            activityView = [[ProductActivityView alloc] initWithFrame:rect reuseIdentifier:@"activity"];
        }
        activityView.frame = rect;
        activityView.backgroundColor = [self randomColor];
        [scrollView addSubview:activityView];
        return activityView;
    }
    //评论
    if (index == 4) {
        ProductCommentView *commentView = (ProductCommentView *)[scrollView dequeueReusableItemWithIdentifier:@"comment"];
        if (!commentView) {
            commentView = [[ProductCommentView alloc] initWithFrame:rect reuseIdentifier:@"comment"];
        }
        commentView.frame = rect;
        commentView.backgroundColor = [self randomColor];
        [scrollView addSubview:commentView];
        return commentView;
    }
//    //选品
//    if (index == 5) {
//        ProductSelectionView *selectionView = (ProductSelectionView *)[scrollView dequeueReusableItemWithIdentifier:@"selection"];
//        if (!selectionView) {
//            selectionView = [[ProductSelectionView alloc] initWithFrame:rect reuseIdentifier:@"selection"];
//        }
//        
//        selectionView.backgroundColor = [self randomColor];
//        [scrollView addSubview:selectionView];
//        return selectionView;
//    }
//    //推荐
//    if (index == 6) {
//        ProductRecommendView *recommendView = (ProductRecommendView *)[scrollView dequeueReusableItemWithIdentifier:@"recommend"];
//        if (!recommendView) {
//            recommendView = [[ProductRecommendView alloc] initWithFrame:rect reuseIdentifier:@"recommend"];
//        }
//        recommendView.frame = rect;
//        recommendView.backgroundColor = [self randomColor];
//        [scrollView addSubview:recommendView];
//        return recommendView;
//    }

    return nil;
}


#pragma mark - Private
- (UIColor *) randomColor{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
}

#pragma mark - Action
- (void)click:(UIGestureRecognizer *)recognizer{
    
    ProductInfoView *label = (ProductInfoView *)recognizer.view;
    NSLog(@"Click - %@",label.muiID);
    
}


@end
