//
//  ValueManager.h
//  LuisXKit
//
//  Created by LuisX on 16/6/14.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValueManager : NSObject
+ (ValueManager *)shareValueManager;
@property (nonatomic, copy) NSString *strValue;
@end
