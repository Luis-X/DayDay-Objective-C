//
//  LuisXRouterManager.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/24.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "LuisXRouterManager.h"

@implementation LuisXRouterManager
/*
 说明:
 根据URL获取相应参数(多参数)
 例如: myapp://post/edit/123?debug=true&foo=bar  处理/:object/:action/:primaryKey 则object为post,action为edit,primaryKey为123
 */

+ (void)showAnyViewControllerWithRouterURL:(NSString *)routerURL AddedNavigationController:(UINavigationController *)navigationController{
    
    [[JLRoutes globalRoutes] addRoute:@"/:object/:action" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSString *object = parameters[@"object"];   //对象
        NSString *action = parameters[@"action"];   //行为
        [self allActionManagementWithNavigationController:navigationController Object:object Action:action];
        return YES;
    }];
    [JLRoutes routeURL:[NSURL URLWithString:routerURL]];
    
}


#pragma mark -处理URL响应事件
/**
 所有事件处理
 
 @param navigationController navigationController
 @param object               对象
 @param action               行为
 */
+ (void)allActionManagementWithNavigationController:(UINavigationController *)navigationController Object:(NSString *)object Action:(NSString *)action{
    
    //NSLog(@"对象:%@\n事件:%@", object, action);
    //////////首页//////////
    if ([object isEqualToString:@"home"]) {
        [LuisXKit navigationController:navigationController pushViewController:[HomeViewController new] HidesBottomBar:YES Animated:YES];
    }
    //////////特卖列表//////////
    if ([object isEqualToString:@"homeMain"]) {
        [LuisXKit navigationController:navigationController pushViewController:[HomeMainViewController new] HidesBottomBar:YES Animated:YES];
    }
    //////////网络监听//////////
    if ([object isEqualToString:@"network"]) {
        [LuisXKit navigationController:navigationController pushViewController:[ReachabilityViewController new] HidesBottomBar:YES Animated:YES];
    }
    //////////加载中//////////
    if ([object isEqualToString:@"waiting"]) {
        [LuisXKit navigationController:navigationController pushViewController:[WaitingViewController new] HidesBottomBar:YES Animated:YES];
    }
    
    //闪屏
    if ([object isEqualToString:@"guideAD"]) {
        GuideADViewController *guideADViewController = [GuideADViewController new];
        [LuisXKit navigationController:navigationController pushViewController:guideADViewController HidesBottomBar:YES Animated:YES];
    }
    
    //Masonry
    if ([object isEqualToString:@"masonry"]) {
    MAViewController *maViewController = [MAViewController new];
    [LuisXKit navigationController:navigationController pushViewController:maViewController HidesBottomBar:YES Animated:YES];
    }
    
    //XLFrom
    if ([object isEqualToString:@"xlFrom"]) {
    CustomXLFormViewController *xlformViewController = [CustomXLFormViewController new];
    [LuisXKit navigationController:navigationController pushViewController:xlformViewController HidesBottomBar:YES Animated:YES];
    }
    
    //AsyncDisplayKit
    if ([object isEqualToString:@"asyncDisplayKit"]) {
    AsyncViewController *asyncViewController = [AsyncViewController new];
    [LuisXKit navigationController:navigationController pushViewController:asyncViewController HidesBottomBar:YES Animated:YES];
    }
    
    //AsyncDisplayKitUI
    if ([object isEqualToString:@"asyncDisplayKitUI"]) {
        AsyncUIViewController *asyncUIViewController = [AsyncUIViewController new];
        [LuisXKit navigationController:navigationController pushViewController:asyncUIViewController HidesBottomBar:YES Animated:YES];
    }
    
    //iCarousel
    if ([object isEqualToString:@"iCarousel"]) {
        iCarouselViewController *icarouselViewController = [iCarouselViewController new];
        [LuisXKit navigationController:navigationController pushViewController:icarouselViewController HidesBottomBar:YES Animated:YES];
    }
    
    //WYPopoverController
    if ([object isEqualToString:@"WYPopoverController"]) {
        XYExampleViewController *xyExampleViewController = [XYExampleViewController new];
        [LuisXKit navigationController:navigationController pushViewController:xyExampleViewController HidesBottomBar:YES Animated:YES];
    }
    
    //GoodsDetailMainViewController
    if ([object isEqualToString:@"goodsDetail"]) {
        GoodsDetailMainViewController *goodsDetailViewController = [GoodsDetailMainViewController new];
        [LuisXKit navigationController:navigationController pushViewController:goodsDetailViewController HidesBottomBar:YES Animated:YES];
    }
    
    //ClassMainViewController
    if ([object isEqualToString:@"goodsClass"]) {
        ClassMainViewController *goodsClassViewController = [ClassMainViewController new];
        [LuisXKit navigationController:navigationController pushViewController:goodsClassViewController HidesBottomBar:YES Animated:YES];
    }
    
    //WebJSViewController
    if ([object isEqualToString:@"webJSBridge"]) {
        WebJSViewController *webJSViewController = [WebJSViewController new];
        [LuisXKit navigationController:navigationController pushViewController:webJSViewController HidesBottomBar:YES Animated:YES];
    }
    
    //ProductDetailViewController
    if ([object isEqualToString:@"product"]) {
        ProductDetailViewController *productDetailViewController = [ProductDetailViewController new];
        [LuisXKit navigationController:navigationController pushViewController:productDetailViewController HidesBottomBar:YES Animated:YES];
    }
    
    //BugVideoViewController
    if ([object isEqualToString:@"bugVideo"]) {
        BugVideoViewController *bugVideoViewController = [BugVideoViewController new];
        [LuisXKit navigationController:navigationController pushViewController:bugVideoViewController HidesBottomBar:YES Animated:YES];
    }
}
@end
