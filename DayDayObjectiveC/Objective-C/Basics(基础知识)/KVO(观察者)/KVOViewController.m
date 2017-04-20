//
//  KVOViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/21.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "KVOViewController.h"
#import "Student.h"

@interface KVOViewController ()

@end

@implementation KVOViewController{
    Student *_student;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
 
    [self useKVOExample];

}


- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    //3.移除监听
    [_student removeObserver:self forKeyPath:@"age"];
    
}
#pragma mark //////////自动//////////

- (void)useKVOExample{
 
    _student = [[Student alloc] init];
    _student.name = @"LuisX";
    _student.age = 24;
    //1.注册监听属性
    [_student addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(changeStudentAgeValue:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)changeStudentAgeValue:(UIButton *)button{
    
    _student.age++;
    
}

//2.当监听的属性发生变化时,自动调用此方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"age"] && object == _student) {
        
        NSLog(@"age:%ld", _student.age);
        NSLog(@"old age:%@", [change objectForKey:@"old"]);
        NSLog(@"new age:%@", [change objectForKey:@"new"]);
        
    }
    
}

@end
