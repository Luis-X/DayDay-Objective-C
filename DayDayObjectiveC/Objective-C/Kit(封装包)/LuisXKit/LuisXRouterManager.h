//
//  LuisXRouterManager.h
//  LuisXKit
//
//  Created by LuisX on 2016/10/24.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JLRoutes.h>
//路由表包含Controller
#import "HomeViewController.h"
#import "HomeMainViewController.h"
#import "ReachabilityViewController.h"
#import "WaitingViewController.h"
#import "GuideADViewController.h"
#import "MAViewController.h"
#import "CustomXLFormViewController.h"
#import "AsyncViewController.h"
#import "AsyncUIViewController.h"
#import "iCarouselViewController.h"
#import "XYExampleViewController.h"
#import "GoodsDetailMainViewController.h"
#import "ClassMainViewController.h"
#import "WebJSViewController.h"
#import "ProductDetailViewController.h"
#import "BugVideoViewController.h"

@interface LuisXRouterManager : NSObject
#define HOST_ROUTER @"tiantian://"                                                                                  //协议
#define ROUTER_URL_STRING(object, action)  [NSString stringWithFormat:@"%@%@/%@", HOST_ROUTER, (object), (action)]  //跳转
//注册跳转
#define ROUTER_HOME             ROUTER_URL_STRING(@"home", nil)
#define ROUTER_NETWORK          ROUTER_URL_STRING(@"network", nil)
#define ROUTER_WAITING          ROUTER_URL_STRING(@"waiting", nil)
#define ROUTER_GUIDEAD          ROUTER_URL_STRING(@"guideAD", nil)
#define ROUTER_MASONARY         ROUTER_URL_STRING(@"masonry", nil)
#define ROUTER_XLFROM           ROUTER_URL_STRING(@"xlFrom", nil)
#define ROUTER_ASYNCDISPLAYKIT  ROUTER_URL_STRING(@"asyncDisplayKit", nil)
#define ROUTER_ASYNCDISPLAYKIT_UI  ROUTER_URL_STRING(@"asyncDisplayKitUI", nil)
#define ROUTER_ICAROUSEL        ROUTER_URL_STRING(@"iCarousel", nil)
#define ROUTER_XYPOPOVER        ROUTER_URL_STRING(@"WYPopoverController", nil)
#define ROUTER_GOODSDETAIL        ROUTER_URL_STRING(@"goodsDetail", nil)
#define ROUTER_GOODSCLASS        ROUTER_URL_STRING(@"goodsClass", nil)
#define ROUTRE_WEBJS            ROUTER_URL_STRING(@"webJSBridge", nil)
#define ROUTRE_PRODUCT            ROUTER_URL_STRING(@"product", nil)
#define ROUTRE_BUGVIDEO            ROUTER_URL_STRING(@"bugVideo", nil)
+ (void)showAnyViewControllerWithRouterURL:(NSString *)routerURL AddedNavigationController:(UINavigationController *)navigationController;
@end
