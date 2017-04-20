//
//  B_ViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/14.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "B_ViewController.h"

@interface B_ViewController ()

@end

@implementation B_ViewController

//1.自定义初始化方法
- (instancetype)initWithOne:(NSString *)one Two:(CGFloat)two{
    
   self = [super init];
    if (self) {
        
        //NSLog(@"%@ %.2f", one, two);
  
        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.myDelegate protocolSendValue:@"B"];
    
    //传值
    if (self.valueBlock) {
        self.valueBlock(@"B");
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


@end
