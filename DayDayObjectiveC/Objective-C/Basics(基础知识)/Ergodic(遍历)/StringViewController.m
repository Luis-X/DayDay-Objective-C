//
//  StringViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/5/31.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "StringViewController.h"

@interface StringViewController ()

@end

@implementation StringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //////////数组属性//////////
    NSArray *array = @[@1, @2, @3, @4, @5, @6];
    NSLog(@"元素个数:       %ld", array.count);
    NSLog(@"首个元素:       %@", array.firstObject);
    NSLog(@"尾个元素:       %@", array.lastObject);
    NSLog(@"描述:          %@", array.description);
    NSLog(@"数组排序提示:   %@", array.sortedArrayHint);
    //输出:   元素个数:       6
    //输出:   首个元素:       1
    //输出:   尾个元素:       6
    //输出:   描述:          (1,2,3,4,5,6)
    //输出:   数组排序提示:    <b179379e 62f36e3c 136da6da c4e6dd78 75601517 26da4cb5>
    

  
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
