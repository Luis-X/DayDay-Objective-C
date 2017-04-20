//
//  ErgodicViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/5/24.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "ErgodicViewController.h"

@interface ErgodicViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ErgodicViewController{
    
    NSArray *_arr;
    NSDictionary *_dic;
    NSSet *_set;
    NSArray *_allHomeDataArr;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initailData];
    //[self showCodeExplain];
    [self createMainView];

}

/**
 *  初始化数据
 */
- (void)initailData{
    /**
     *  数据
     */
    _arr = @[@"1", @"2", @"3", @"4", @"5"];
    _dic = @{@"one" : @1,
             @"two" : @2,
             @"three" : @3,
             @"four" : @4,
             @"five" : @5};
    _set = [[NSSet alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    
    _allHomeDataArr = @[@"经典for循环", @"NSEnumerator迭代器", @"for..in", @"Block块的出现"];
}

- (void)createMainView{
    
    UITableView *homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //homeTableView.backgroundColor = [UIColor redColor];
    homeTableView.dataSource = self;
    homeTableView.delegate = self;
    [self.view addSubview:homeTableView];
    [homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
#pragma mark -UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.textLabel.text = [_allHomeDataArr objectAtIndex:indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _allHomeDataArr.count;
    
}

#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //经典for循环
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        [self for_Code];
        
    }
    
    //NSEnumerator迭代器
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        [self NSEnumerator_Code];
        
    }
    
    //for..in
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        [self for_in_Code];
        
    }
    
    //Block块的出现
    if (indexPath.section == 0 && indexPath.row == 3) {
        
        [self block_Code];
        
    }
    
}


#pragma mark    -经典for循环
/**
 优点：简单
 缺点：由于字典和集合内部是无序的，导致我们在遍历字典和集合的时候需要借助一个新的『数组』作为中介来处理，多出了一部分开销。
 */
- (void)for_Code{
    
    ///////////数组//////////
    for (NSInteger i = 0; i < _arr.count; i++) {
        NSString *str = [_arr objectAtIndex:i];
        
        NSLog(@"for 数组:%@", str);
    }
    //输出:   for 数组:1
    //输出:   for 数组:2
    //输出:   for 数组:3
    //输出:   for 数组:4
    //输出:   for 数组:5
    
    ///////////字典//////////
    for (NSInteger i = 0; i < _dic.count; i++) {
        NSString *key = [_dic.allKeys objectAtIndex:i];
        NSString *value = [_dic.allValues objectAtIndex:i];
        //NSString *value = [_dic objectForKey:key];
        
        NSLog(@"for 字典:%@ %@", key, value);
    }
    //输出:   for 字典:one 1
    //输出:   for 字典:five 5
    //输出:   for 字典:three 3
    //输出:   for 字典:two 2
    //输出:   for 字典:four 4
    
    ///////////集合//////////
    NSArray *setArr = [_set allObjects];
    for (NSInteger i = 0; i < setArr.count; i++) {
        NSString *str = [setArr objectAtIndex:i];
        
        NSLog(@"for 集合:%@", str);
    }
    //输出:   for 集合:3
    //输出:   for 集合:1
    //输出:   for 集合:4
    //输出:   for 集合:2
    //输出:   for 集合:5
    
    ///////////反向遍历//////////
    for (NSInteger i = _arr.count; i > 0; i--) {
        NSString *str = [_arr objectAtIndex:(i - 1)];
        NSLog(@"for 倒序%@", str);
    }
    //输出:   for 倒序5
    //输出:   for 倒序4
    //输出:   for 倒序3
    //输出:   for 倒序2
    //输出:   for 倒序1
}





#pragma mark    -Objective-C 1.0___NSEnumerator迭代器
/**
 优点：对于不同的数据类型，遍历的语法相似；内部可以简单的通过reverseObjectEnumerator设置进行反向遍历。
 缺点：代码量稍大。
 */
- (void)NSEnumerator_Code{
    
    ///////////数组//////////
    NSEnumerator *arrEnumerator = [_arr objectEnumerator];
    NSString *str;
    while ((str = [arrEnumerator nextObject]) != nil) {
        NSLog(@"NSEnumerator 数组:%@", str);
    }
    //输出:   NSEnumerator 数组:1
    //输出:   NSEnumerator 数组:2
    //输出:   NSEnumerator 数组:3
    //输出:   NSEnumerator 数组:4
    //输出:   NSEnumerator 数组:5
    
    ///////////字典//////////
    NSEnumerator *dicEnumerator = [_dic keyEnumerator];
    NSString *key;
    while ((key = [dicEnumerator nextObject]) != nil) {
        NSString *value = [_dic objectForKey:key];
        NSLog(@"NSEnumerator 字典:%@ %@", key, value);
    }
    //输出:   NSEnumerator 字典:one 1
    //输出:   NSEnumerator 字典:five 5
    //输出:   NSEnumerator 字典:three 3
    //输出:   NSEnumerator 字典:two 2
    //输出:   NSEnumerator 字典:four 4
    
    ///////////集合//////////
    NSEnumerator *setEnumerator = [_set objectEnumerator];
    NSString *setStr;
    while ((setStr = [setEnumerator nextObject]) != nil) {
        NSLog(@"NSEnumerator 集合:%@", setStr);
    }
    //输出:   NSEnumerator 集合:3
    //输出:   NSEnumerator 集合:1
    //输出:   NSEnumerator 集合:4
    //输出:   NSEnumerator 集合:2
    //输出:   NSEnumerator 集合:5
    
    ///////////倒序//////////
    NSEnumerator *arrReverseEnumerator = [_arr reverseObjectEnumerator];
    NSString *str2;
    while ((str2 = [arrReverseEnumerator nextObject]) != nil) {
        NSLog(@"NSEnumerator 倒序:%@", str2);
    }
    //输出:   NSEnumerator 倒序:5
    //输出:   NSEnumerator 倒序:4
    //输出:   NSEnumerator 倒序:3
    //输出:   NSEnumerator 倒序:2
    //输出:   NSEnumerator 倒序:1
}






#pragma mark    -Objective-C 2.0___for..in
/**
 优点：1）语法简洁；
 2）效率最高；
 缺点：无法获得当前遍历操作所针对的下标。
 */
- (void)for_in_Code{
    
    ///////////数组//////////
    for (NSString *str in _arr) {
        NSLog(@"for..in 数组:%@", str);
    }
    //输出:   for..in 数组:1
    //输出:   for..in 数组:2
    //输出:   for..in 数组:3
    //输出:   for..in 数组:4
    //输出:   for..in 数组:5
    
    ///////////字典//////////
    for (NSString *key in _dic) {
        NSString *value = [_dic objectForKey:key];
        
        NSLog(@"for..in 字典:%@ %@", key, value);
    }
    //输出:   for..in 字典:one 1
    //输出:   for..in 字典:five 5
    //输出:   for..in 字典:three 3
    //输出:   for..in 字典:two 2
    //输出:   for..in 字典:four 4
    
    ///////////集合//////////
    for (NSString *str in _set) {
        NSLog(@"for..in 集合:%@", str);
    }
    //输出:   for..in 集合:3
    //输出:   for..in 集合:1
    //输出:   for..in 集合:4
    //输出:   for..in 集合:2
    //输出:   for..in 集合:5
    
    ///////////倒序//////////
    for (NSString *str in [_arr reverseObjectEnumerator]) {
        NSLog(@"for..in 倒序%@", str);
    }
    //输出:   for..in 倒序5
    //输出:   for..in 倒序4
    //输出:   for..in 倒序3
    //输出:   for..in 倒序2
    //输出:   for..in 倒序1
}







#pragma mark    -Block块的出现__简洁干练的遍历
/**
 优点：1）遍历时可以直接从block中获得需要的所有信息，包括下标、值等。特别相对于字典而言，不需要做多余的编码即可同时获得key和value的值。
 　　　2）能够直接修改block中key或者obj的类型为真实类型，可以省去类型转换的工作。
 　　　3）可以通过NSEnumerationConcurrent枚举值开启并发迭代功能。
 说明：基于Block的遍历方式在实现反向遍历的时候也非常简单，使用enumerateObjectsWithOptions方法，传递NSEnumerationReverse作为参数即可，在处理遍历操作的时候推荐基于Block的遍历方式
 */
- (void)block_Code{
    
    ///////////数组//////////
    [_arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"enumerateBlock 数组:%@ 下标:%lu", obj, (unsigned long)idx);
    }];
    //输出:   enumerateBlock 数组:1 下标:0
    //输出:   enumerateBlock 数组:2 下标:1
    //输出:   enumerateBlock 数组:3 下标:2
    //输出:   enumerateBlock 数组:4 下标:3
    //输出:   enumerateBlock 数组:5 下标:4
    
    ///////////字典//////////
    [_dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"enumerateBlock 字典:%@ %@", key, obj);
    }];
    //输出:   enumerateBlock 字典:one 1
    //输出:   enumerateBlock 字典:five 5
    //输出:   enumerateBlock 字典:three 3
    //输出:   enumerateBlock 字典:two 2
    //输出:   enumerateBlock 字典:four 4
    
    ///////////集合//////////
    [_set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"enumerateBlock 集合:%@", obj);
    }];
    //输出:   enumerateBlock 集合:3
    //输出:   enumerateBlock 集合:1
    //输出:   enumerateBlock 集合:4
    //输出:   enumerateBlock 集合:2
    //输出:   enumerateBlock 集合:5
    
    ///////////倒序//////////
    [_arr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"enumerateBlock 倒序%@", obj);
    }];
    //输出:   enumerateBlock 倒序5
    //输出:   enumerateBlock 倒序4
    //输出:   enumerateBlock 倒序3
    //输出:   enumerateBlock 倒序2
    //输出:   enumerateBlock 倒序1
}
@end
