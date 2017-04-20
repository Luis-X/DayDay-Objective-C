//
//  KVCViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/21.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "KVCViewController.h"
#import "People.h"
#import "Address.h"

@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //[self useKVCExample1];
    //[self useKVCExample2];
    //[self useKVCExample3];
    //[self useKVCExample4];
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

/**
 *  KVC，即是指 NSKeyValueCoding，一个非正式的 Protocol，提供一种机制来间接访问对象的属性。KVO 就是基于 KVC 实现的关键技术之一。
 */

/**
 *  1.使用KVC
 */
- (void)useKVCExample1{
    
    People *people = [[People alloc] init];
    //使用KVC赋值
    [people setValue:@"LuisX" forKey:@"name"];
    //使用KVC取值
    NSString *name = [people valueForKey:@"name"];
    NSLog(@"%@", name);
    //输出:   LuisX
    
}

/**
 *  2.键路径访问
 */
- (void)useKVCExample2{
 
#pragma     方式一:  使用setValue...forKey赋值   valueForKeyPath取值
    People *people = [[People alloc] init];
    [people setValue:@"LuisX" forKey:@"name"];
    NSString *name = [people valueForKey:@"name"];
    NSLog(@"%@", name);
    //输出:   LuisX
    
    Address *address = [[Address alloc] init];
    [address setValue:@"10010" forKey:@"code"];
    [people setValue:address forKey:@"address"];
    NSString *code1 = [people valueForKeyPath:@"address.code"];
    NSLog(@"方式1:%@", code1);
    //输出:   方式1:10010
    
#pragma     方式二:  使用setValue...forKeyPath赋值   valueForKeyPath取值
    [people setValue:@"10010" forKeyPath:@"address.code"];
    NSString *code2 = [people valueForKeyPath:@"address.code"];
    NSLog(@"方式2:%@", code2);
    //输出:   方式2:10010
}

/**
 *  自动封装基本数据类型
 */
- (void)useKVCExample3{
    
    People *people = [[People alloc] init];
    [people setValue:@"88" forKey:@"number"];
    NSString *number = [people valueForKey:@"number"];      //NSInteger类型转NSString
    NSLog(@"%@", number);
    
}

/**
 *  操作集合
 */
- (void)useKVCExample4{
    
    People *people = [[People alloc] init];
    [people setValue:@"LuisX" forKey:@"name"];
    NSString *name = [people valueForKey:@"name"];
    NSLog(@"%@", name);
    //输出:   LuisX

    
    People *p1 = [[People alloc] init];
    People *p2 = [[People alloc] init];
    People *p3 = [[People alloc] init];
    [p1 setValue:@"65" forKey:@"number"];
    [p2 setValue:@"77" forKey:@"number"];
    [p3 setValue:@"99" forKey:@"number"];
    NSArray *array = [NSArray arrayWithObjects:p1, p2, p3, nil];
    [people setValue:array forKey:@"morePeople"];
    
    NSLog(@"数组中元素的number值:%@", [people valueForKeyPath:@"morePeople.number"]);
    NSLog(@"元素个数:%@", [people valueForKeyPath:@"morePeople.@count"]);
    NSLog(@"元素最大:%@", [people valueForKeyPath:@"morePeople.@max.number"]);
    NSLog(@"元素最小:%@", [people valueForKeyPath:@"morePeople.@min.number"]);
    NSLog(@"元素平均:%@", [people valueForKeyPath:@"morePeople.@avg.number"]);
}
@end
