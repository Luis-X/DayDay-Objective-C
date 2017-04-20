//
//  ArithmeticViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/6/28.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "ArithmeticViewController.h"

@interface ArithmeticViewController ()

@end

@implementation ArithmeticViewController{
    NSMutableArray *_exampleArr;
    UIImageView *_myImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 只在NSDefaultRunLoopMode下执行(刷新图片)
    [_myImageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"1.jpg"] afterDelay:2.0 inModes:@[NSDefaultRunLoopMode]];
    
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initailData];
    
    //[self bubblingSort:_exampleArr];
    //[self selectedSort:_exampleArr];
    //[self quickSort:_exampleArr];
    //[self insertSort:_exampleArr];
    [self heapSort:_exampleArr start:0 end:_exampleArr.count - 1];
}



- (void)initailData{
    
    _exampleArr = [NSMutableArray arrayWithObjects:@5, @3, @8, @6, @4, nil];
    
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
 *  1.冒泡排序
 *  2.选择排序
 *  3.插入排序
 *  4.快速排序
 *  5.堆排序
 */

#pragma mark -冒泡排序
/**
 
 核心思想:  通过与相邻元素的比较和交换，把小的数交换到最前面
 5, 3, 8, 6, 4  (开始)

 第一趟
 3, 5, 8, 6, 4 （5和3交换）
 3, 5, 8, 6, 4 （5和8不用交换）
 3, 5, 6, 8, 4 （8和6交换）
 3, 5, 6, 4, 8 （8和4交换）
 第二趟
 3, 5, 6, 4, 8 （3和5不用交换）
 3, 5, 6, 4, 8 （5和6不用交换）
 3, 5, 4, 6, 8 （6和4交换）
 第三趟
 3, 5, 4, 6, 8 （3和5不用交换）
 3, 4, 5, 6, 8 （5和4交换）
 第四趟
 3, 4, 5, 6, 8  (3和4不用交换)
 */

- (void)bubblingSort:(NSMutableArray *)array{
    
    for (int i = 0; i < array.count - 1; ++i) {
        for (int j = 0; j < array.count - i - 1; ++j) {
            if (array[j] > array[j + 1]) {
                NSNumber *temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
    
    //NSLog(@"冒泡排序后：%@",array);
    //输出:   冒泡排序后：(3, 4, 5, 6, 8)

}

#pragma mark -选择排序
/**
 
 核心思想:  通过与相邻元素的比较和交换，把小的数交换到最前面
 5, 3, 8, 6, 4  (开始)
 
 第一趟
 3, 5, 8, 6, 4 （5和3交换）
 3, 5, 8, 6, 4 （3和8不用交换）
 3, 5, 8, 6, 4 （3和6不用交换）
 3, 5, 8, 6, 4 （3和4不用交换）
 第二趟
 3, 5, 8, 6, 4  (5和8不用交换)
 3, 5, 8, 6, 4  (5和6不用交换)
 3, 4, 8, 6, 5  (5和4交换)
 第三趟
 3, 4, 6, 8, 5  (8和6交换)
 3, 4, 5, 8, 6  (6和5交换)
 第四趟
 3, 4, 5, 6, 8  (8和6交换)
 */
- (void)selectedSort:(NSMutableArray *)array{
    
    for (int i = 0; i < array.count; ++i) {
        for (int j = i + 1; j < array.count; ++j) {
            if (array[i] > array[j]) {
                NSNumber *temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    
    NSLog(@"选择排序后：%@",array);
    //输出:   选择排序后：(3, 4, 5, 6, 8)

}

#pragma mark -快速排序
/**
 
 核心思想: 冒泡+二分+分治
 5, 3, 8, 6, 4  (开始)
 
 第一趟(基准: 5)
 4, 3, 8, 6, 4 (小)
 4, 3, 8, 6, 8 (大)
 4, 3, 8, 6, 8 (小)
 4, 3, 8, 6, 8 (大)
 4, 3, 5, 6, 8 (中间)
 第二趟(基准: 4)
 3, 3, 5, 6, 8 (小)
 3, 3, 5, 6, 8 (大)
 3, 4, 5, 6, 8 (中间)
 第三趟(基准: 6)
 3, 4, 5, 6, 8 (小)
 3, 4, 5, 6, 8 (大)
 3, 4, 5, 6, 8 (中间)

 */

- (void)quickSort:(NSMutableArray *)array{

    int end = [[NSNumber numberWithInteger:array.count - 1] intValue];
    [self quickSort:array start:0 end:end];
    NSLog(@"选择排序后：%@", array);
    //输出:   选择排序后：(3, 4, 5, 6, 8)
    
}

- (void)quickSort:(NSMutableArray *)array start:(int)start end:(int)end{
    
    //递归结束
    if (start >= end){
        return;
    }
    int index = [self indexQuickSort:array left:start right:end];
    [self quickSort:array start:start end:index - 1];
    [self quickSort:array start:index + 1 end:end];
    
}

- (int)indexQuickSort:(NSMutableArray *)array left:(int)left right:(int)right{

    NSNumber *keyValue = array[left];       //基准值
    while (left < right) {
        while (left < right && array[right] >= keyValue) {
            right--;
        }
        array[left] = array[right];         //小的换到左边
        while (left < right && array[left] <= keyValue) {
            left++;
        }
        array[right] = array[left];         //大的换到右边
    }
    array[left] = keyValue;                 //基准换到中间
    return left;
    
}

#pragma mark -插入排序
/**
 
 核心思想: 找到合适位置插入元素,插入位置后移
 5, 3, 8, 6, 4  (开始)
 
 第一趟
 3, 5, 8, 6, 4 （3插入 下标0位置）
 第二趟
 3, 5, 8, 6, 4 （3插入 下标2位置）
 第三趟
 3, 5, 6, 8, 4 （6插入 下标2位置）
 第四趟
 3, 4, 5, 6, 8 （4插入 下标1位置）

 */

- (void)insertSort:(NSMutableArray *)array{
    
    for (int i = 1; i < array.count; i++) {
        int j = i;
        NSNumber *insertValue = array[i];
        while (j > 0 && insertValue < array[j - 1]) {
            array[j] = array[j - 1];
            j--;
        }
        array[j] = insertValue;
    }
    NSLog(@"插入排序后：%@", array);
    //输出:   选择排序后：(3, 4, 5, 6, 8)
    
}

#pragma mark -堆排序
- (void)heapSort:(NSMutableArray *)array start:(int)start end:(int)end{
    
    NSNumber *temp = array[start];
    for (int i = 2 * start + 1; i <= end; i = 2) {
        
        if (i < end && array[i] < array[i + 1]) {
            i++;
        }
        if (temp >= array[i]) {
            break;
        }
        array[start] = array[i];
        start = i;
        
    }
    array[start] = temp;
    NSLog(@"%@", array);
    
    
    
}
@end
