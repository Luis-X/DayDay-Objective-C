//
//  ValueManager.m
//  LuisXKit
//
//  Created by LuisX on 16/6/14.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "ValueManager.h"

@implementation ValueManager

+ (ValueManager *)shareValueManager{
    
    static ValueManager *shareValueManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareValueManager = [ValueManager new];
    });
    return shareValueManager;
    
}
@end
