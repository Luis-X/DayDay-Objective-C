//
//  MAViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/9/8.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "MAViewController.h"
#import "CSGrowingTextView.h"

@interface MAViewController ()<UITextViewDelegate>

@end

@implementation MAViewController{
    CSGrowingTextView *_titleTextView;
    UITextView *_textView;
    UIView *_messageStatusView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self createMainView];
}

- (void)createMainView{
    
    /*
    _textView = [UITextView new];
    //_textView.delegate = self;
    _textView.text = @"蕴含OLAY独有细胞透白复合物,从细胞源头抑制黑色素形成.\n核心的突破性细胞美白导入技术,能让更多活性成分迅速渗入肌肤, 作用于亿万细胞,使肌肤白皙透亮.\nOLAY水感透白系列的产品介绍 适合人群：\n适合各种肌肤日常使用,特别适用于肤色暗沉的肌肤.\n获得殊荣：\n2011年度悦己杂志编辑推荐大奖";
    _textView.backgroundColor = [UIColor orangeColor];
    _textView.scrollEnabled = NO;
    [self.view addSubview:_textView];

    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        //make.height.mas_equalTo(200);
    }];
    */
    
    
    _messageStatusView = [UIView new];
    _messageStatusView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_messageStatusView];
    [_messageStatusView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        
    }];
    
    [_messageStatusView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(change)]];
    

    
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


- (void)change{
    
    
    [UIView animateWithDuration:1 animations:^{
        [_messageStatusView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        [_messageStatusView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        //repeat!

    }];

    
}
@end
