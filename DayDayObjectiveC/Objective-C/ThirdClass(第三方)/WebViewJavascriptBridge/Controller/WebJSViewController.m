//
//  WebJSViewController.m
//  LuisXBook-OC
//
//  Created by LuisX on 2017/2/23.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "WebJSViewController.h"
#import "WebViewJavascriptBridge.h"
@interface WebJSViewController ()
@property (nonatomic, strong)WebViewJavascriptBridge *bridge;
@end

@implementation WebJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [LuisXKit buttonAddView:self.view Title:@"JS交互" TitleColor:[UIColor whiteColor] Font:[UIFont systemFontOfSize:15] CornerRadius:0 BackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(showButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.equalTo(self.view);
        
    }];
    
}

- (void)useWebJavascriptBridge{
    
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:nil];
    //注册
    [self.bridge registerHandler:@"ObjC Echo" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"ObjC Echo called with: %@", data);
        responseCallback(data);
    }];
    //调用
    [self.bridge callHandler:@"JS Echo" data:nil responseCallback:^(id responseData) {
        NSLog(@"ObjC received response: %@", responseData);
    }];
    
    
    
    /*
     *  JS文件中
     */
    
    /*
     //JS方法
     function setupWebViewJavascriptBridge(callback) {
     if (window.WebViewJavascriptBridge) { return callback(WebViewJavascriptBridge); }
     if (window.WVJBCallbacks) { return window.WVJBCallbacks.push(callback); }
     window.WVJBCallbacks = [callback];
     var WVJBIframe = document.createElement('iframe');
     WVJBIframe.style.display = 'none';
     WVJBIframe.src = 'https://__bridge_loaded__';
     document.documentElement.appendChild(WVJBIframe);
     setTimeout(function() { document.documentElement.removeChild(WVJBIframe) }, 0)
     }
     */
    
    /*
     setupWebViewJavascriptBridge(function(bridge) {
     
     // Initialize your app here
        bridge.registerHandler('JS Echo', function(data, responseCallback) {
            console.log("JS Echo called with:", data)
            responseCallback(data)
        })
        bridge.callHandler('ObjC Echo', {'key':'value'}, function responseCallback(responseData) {
            console.log("JS received response:", responseData)
        })
     })
     */
}

/*
 1.导入头文件并声明属性
 2.为(WKWebView, UIWebView, WebView)实例化WebViewJavascriptBridge
 3.Objective-C注册处理, 并调用JS处理
 4.复制并粘贴setupWebViewJavascriptBridge到JS当中
 5.最后,调用setupWebViewJavascriptBridge后使用bridge注册处理,并调用Objective-C处理
 */

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

- (void)showButtonAction:(id)sender{
    
    NSLog(@"123456");
    
}
@end
