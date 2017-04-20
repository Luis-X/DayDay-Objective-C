/*
//修复达人店SJWebView导致iOS10 cookie无法同步
require('UIWebView, UIColor');
defineClass('SJWebView', {
    initWithFrame: function(frame) {
        if (self = self.super().initWithFrame(frame)) {
            if (!self.realWebView()) {
                var webView = UIWebView.alloc().initWithFrame({x: 0, y: 0, width: frame.width, height: frame.height});
                webView.setDelegate(self);
                self.setRealWebView(webView);
                self.setIsWebViewContent(YES);
                self.setWebviewScrollview(webView.scrollView());
                webView.setBackgroundColor(UIColor.colorWithRed_green_blue_alpha(245.0/255.0, 245.0/255.0, 245.0/255.0, 1));
                self.addSubview(self.realWebView());
                console.log('JSPatch==成功1');
            }
        }
        return self;
    },
});
*/

/*
//修复LoginViewController优先判断收益店主
require('NSDictionary, BaseModel, PhoneBindingConstant, PhoneBindingViewController');
defineClass('LoginViewController: BaseViewController <PhoneBindingViewControllerDelegate>', {
    doAccountWXIsHaveShop_IsBindWx_withResult: function(haveShop, isBindWx, result) {
        var mResult = NSDictionary.dictionaryWithDictionary(result);
        self.setMResult(mResult);
            if (haveShop) { //有店铺---(强制绑定手机号码)
                var model = BaseModel.initBaseModel();
                model.parseFromDic(result);
                // 先判断是否有达人店店铺 再进行判断手机绑定
                var mstrisCommonweal = model.mdicData().objectForKey('isCommonweal');
                    if (mstrisCommonweal == '1') {
                        var slf = self
                        PhoneBindingConstant.networkPhoneBindingIsBindingStatus(block('BOOL,NSString*', function(success, message) { //已绑定手机号码---(进入首页)
                            if (success) {//已绑定手机号码---(进入首页)
                                slf.saveUserInfoMation(result);
                            }else{//未绑定手机号---(进入绑定手机号页)
                                var phoneBindingVC = PhoneBindingViewController.alloc().init();
                                phoneBindingVC.setDelegate(slf);
                                slf.navigationController().pushViewController_animated(phoneBindingVC, YES);
                            }
                        }));
                    }else{
                        self.openPayVersionDaRenShopApp();
                    }
            }else{//无店铺---(开店或逛逛)
                self.goToOptionalTypeViewController();
            }
    },
    phoneBindingMobileNumberSuccess: function() {
        self.loginSuccessSystemToHomeMain();
    },
    phoneBindingMobileSkipSuccess: function() {
        self.loginSuccessSystemToHomeMain();
    },
});

defineClass('AccountSMSCodeView', {
    checkMobileNumberWithNumber: function(number) {
    //不显示手机号验证提示
    },
});
*/

