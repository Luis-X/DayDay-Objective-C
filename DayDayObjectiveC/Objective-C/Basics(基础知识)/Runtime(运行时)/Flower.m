//
//  Flower.m
//  LuisXKit
//
//  Created by LuisX on 16/6/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "Flower.h"

@implementation Flower

- (void)showName{
    NSLog(@"LuisX");
}

- (void)showOtherName:(NSString *)otherName{
    NSLog(@"%@", otherName);
}

+ (void)showPrice{
    NSLog(@"100");
}

+ (void)showOtherPrice:(NSString *)otherPrice{
    NSLog(@"%@", otherPrice);
}
@end
