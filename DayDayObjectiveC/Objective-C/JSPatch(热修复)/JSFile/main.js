/**
 *  利用JSPatch创建Push新ViewController
 */

defineClass('HotViewController', {
            
    handleBtn: function(sender) {
            
    var tableViewCtrl = JPTableViewController.alloc().init()
    tableViewCtrl.setHidesBottomBarWhenPushed(YES);
    self.navigationController().pushViewController_animated(tableViewCtrl, YES)
    //console.log('Push新视图成功')

    }
            
})

/*
require('UIColor, UITableView, UITableViewCell')
defineClass('JPTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>', {
            
    viewDidLoad: function() {
        //注意:
        //调用super使用 self.super()
        self.super().viewDidLoad()
        self.view().setBackgroundColor(UIColor.whiteColor())
        //注意:
        //CGRect使用{x:,y:,width:,height:}代替
        //OC中的枚举值使用具体的值代替
        var mainTableView = UITableView.alloc().initWithFrame_style({x: 0, y: 0, width:self.view().frame().width, height:self.view().frame().height}, 1);
        mainTableView.setDataSource(self);
        mainTableView.setDelegate(self);
        //mainTableView.setBackgroundColor(UIColor.redColor())
        mainTableView.registerClass_forCellReuseIdentifier(UITableViewCell.class(), "cell");
        self.view().addSubview(mainTableView);

    },
//MARK-----UITableViewDataSource
    tableView_numberOfRowsInSection: function(tableView, section) {
            
        return 10;
            
    },
    tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            
        var cell = tableView.dequeueReusableCellWithIdentifier_forIndexPath("cell", indexPath);
        return cell;
            
    },
//MARK-----UITableViewDelegate
    tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
        
        self.showAlertViewWithMessage(indexPath.row())
    },
    showAlertViewWithMessage: function(message) {
        //注意:
        //格式转换
        var alertVC = require('UIAlertController').alertControllerWithTitle_message_preferredStyle("Alert", String(message), 1);
        var action = require('UIAlertAction').actionWithTitle_style_handler("OK", 0, block('UIAlertAction*', function(action) {
                console.log(message)
        }));
        alertVC.addAction(action);
        self.presentViewController_animated_completion(alertVC, YES, block(function() {
                                                                               
        }));
            
    }
    
})
*/


/**
 *  使用include引用其他js文件
 */
//注意:
//main.js所在路径为根路径
//include引用时填写相对路径
include('JPViewController.js')
require('UIColor')
defineClass('HotViewController', {
            
    showJPViewController: function() {
        //注意此处的NewViewController和JPViewController.js文件中的定义要一致
            /*
        var vc = NewViewController.alloc().init();
        self.navigationController().pushViewController_animated(vc, YES)
             */
        var button1 = self.valueForKey("_button1")
        button1.setBackgroundColor(UIColor.redColor())
        console.log('成功')
    }
            
})

require('LuisXKit')
defineClass('TableViewNodeCell', {
            
    addMainGoodsImageNode: function() {
            console.log('成功')
    //var displayNode = SJUIKit.nodeDisplayNodeAddNode_BackgroundColor(self, UIColor.clearColor());
    //_goodsImageNode = displayNode;
    //_goodsImageNode.style().setMaxSize(CGSizeMake(80, 80));
        
    },
//    addMainGoodsImageNode: function(imageUrl) {
//            
//    var networkImageNode = LuisXKit.nodeNetworkImageNodeAddNode_ClipsToBounds_ContentMode_DefaultImage(self, false, 3, UIImage.imageNamed("bg1@2x.png()"));
//            //networkImageNode.URL() = [NSURL URLWithString:imageUrl];
//        //networkImageNode.style().setPreferredSize(CGSizeMake(50, 50));
//            //_goodsImageNode = networkImageNode;
//        //var data = self.valueForKey("_goodsImageNode")     //get member variables
//        //self.setValue_forKey(networkImageNode, "_goodsImageNode")     //set member variables
//    console.log('成功')
//    },
            
})
