//
//  Flower.h
//  LuisXKit
//
//  Created by LuisX on 16/6/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flower : NSObject
- (void)showName;
- (void)showOtherName:(NSString *)otherName;
+ (void)showPrice;
+ (void)showOtherPrice:(NSString *)otherPrice;
@end
