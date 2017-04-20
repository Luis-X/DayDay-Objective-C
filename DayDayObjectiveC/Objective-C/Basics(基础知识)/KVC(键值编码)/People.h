//
//  People.h
//  LuisXKit
//
//  Created by LuisX on 16/6/21.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

@interface People : NSObject{
    
    NSString *name;
    Address *address;
    NSInteger number;
    NSArray *morePeople;    //添加集合类型属性
    
}

@end
