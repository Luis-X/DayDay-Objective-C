
require('UILabel, UIColor, UIFont, UIScreen, UIImageView, UIImage')

var screenWidth = UIScreen.mainScreen().bounds().width;
var screenHeight = UIScreen.mainScreen().bounds().height;

defineClass('NewViewController: UIViewController', {
    
    viewDidLoad: function() {
        self.super().viewDidLoad();
        self.view().setBackgroundColor(UIColor.whiteColor());
            
        var size = 120;
        var imgView = UIImageView.alloc().initWithFrame({x: (screenWidth - size)/2, y: 150, width: size, height: size});
        //imgView.setBackgroundColor(UIColor.redColor());
        //注意:使用JSPatch调用工程中的资源
        imgView.setImage(UIImage.imageNamed('apple.png'));
        self.view().addSubview(imgView);
            
        var label = UILabel.alloc().initWithFrame({x: 0, y: 310, width: screenWidth, height: 30});
        label.setText("NewViewController");
        label.setTextAlignment(1);
        label.setFont(UIFont.systemFontOfSize(25));
        self.view().addSubview(label);
    },
            
})