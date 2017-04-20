//
//  ASTestView.m
//  LuisXKit
//
//  Created by LuisX on 2016/12/16.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "ASTestView.h"

@implementation ASTestView{
    ASTextNode *_titleNode;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addTitleNode:nil];
    }
    return self;
}

- (void)addTitleNode:(NSString *)string{
    
    ASTextNode *titleNode = [[ASTextNode alloc]init];
    NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-bold" size:16.0f] ,NSForegroundColorAttributeName: [UIColor redColor]};
    titleNode.attributedText = [[NSAttributedString alloc]initWithString:@"82430583475894375829347589tfghhsfghklsh" attributes:attrs];
    titleNode.backgroundColor = [UIColor blueColor];
    [self addSubnode:titleNode];
    _titleNode = titleNode;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    
    // when the username / location text is too long,
    // shrink the stack to fit onscreen rather than push content to the right, offscreen
    
    _titleNode.style.flexShrink = YES;
    
    // horizontal stack
    ASStackLayoutSpec *headerStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                                 spacing:10
                                                                          justifyContent:ASStackLayoutJustifyContentStart
                                                                              alignItems:ASStackLayoutAlignItemsCenter
                                                                                children:@[_titleNode]];
    
    // inset the horizontal stack
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:headerStackSpec];
}
@end
