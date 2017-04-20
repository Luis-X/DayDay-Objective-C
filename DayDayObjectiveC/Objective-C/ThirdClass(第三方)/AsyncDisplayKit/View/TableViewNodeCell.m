//
//  TableViewNodeCell.m
//  LuisXKit
//
//  Created by LuisX on 2016/12/14.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "TableViewNodeCell.h"
//iOS7没有该字体
//#define FONT_PingFangSC_Light(s)   [UIFont fontWithName:@"PingFangSC-Light" size:(s)]
//#define FONT_PingFangSC_Regular(s) [UIFont fontWithName:@"PingFangSC-Regular" size:(s)]

#define FONT_PingFangSC_Light(s)   [UIFont systemFontOfSize:(s)]
#define FONT_PingFangSC_Regular(s) [UIFont systemFontOfSize:(s)]

@implementation TableViewNodeCell{
    ASTextNode *_titleNode;                 //标题
    ASNetworkImageNode *_goodsImageNode;    //商品图片
    ASImageNode *_goodsTypeTagNode;         //商品类别标签
    ASButtonNode *_goodsTimeTagNode;        //标签
    ASTextNode *_limitNode;                 //限量
    ASTextNode *_specialPriceNode;          //特卖价格
    ASTextNode *_normalPriceNode;           //平时价
    ASButtonNode *_shareButtonNode;         //分享
    ASImageNode *_bottomToolBarNode;        //底部工具条
    ASTextNode *_onLineCountNode;           //上架数目
    ASTextNode *_earningNode;               //收益
    ASTextNode *_lineStatusNode;            //上下架状态
    UISwitch *_lineSwitchButton;            //上下架开关
    ASDisplayNode *_lineSwitchBGNode;       //上下架开关背景(协助UISwitch位置)
    ASNetworkImageNode *_nationalFlagNode;  //国旗
    ASTextNode *_nationalNameNode;          //国家名
    ASImageNode *_goodsEmptyTagNode;        //抢光了
    BOOL _isHaiTao;                          //海淘商品
}

- (instancetype)initWithString:(NSString *)string{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self updateHomePageCellNodeWithModel:string];
    }
    return self;
}

/**
 刷新数据
 */
- (void)updateHomePageCellNodeWithModel:(NSString *)model{
    [self addTitleNode:@"芭尼兰梦幻"];
    [self addMainGoodsImageNode:@"https://www.baidu.com/img/bd_logo1.png"];
    [self addGoodsTimeTagNode:@"10:00 未开枪"];
    [self addLimitNode:@"限量: 200"];
    [self addSpecialPriceNode:@"特卖价:¥175"];
    [self addNormalPriceNode:@"平时:¥243.00"];
    [self addShareButtonNode];
    [self addBottomToolBarNode];
    [self addOnLineCountNode:@"已被1980位店主上架"];
    [self addEarningNode:@"收益:47.5"];
    [self addLineStatusNode:@"上架"];
    [self addLineSwitchBackgroundNode];
    [self addGoodsTypeTagNode:[UIImage imageNamed:@"bg4@2x.png"]];
    [self addNationalFlagNode:nil];
    [self addNationalNameNode:@"Korea 韩国直供"];
    [self addGoodsEmptyTagNode:[UIImage imageNamed:@"GL_Sake@2x.png"]];
}

#pragma mark -海淘商品
//商品类别标签(海淘/特卖)
- (void)addGoodsTypeTagNode:(UIImage *)image{
    
    ASImageNode *imageNode = [LuisXKit nodeImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleToFill];
    imageNode.image = image;
    imageNode.style.layoutPosition = CGPointMake(0, 0);
    imageNode.style.preferredSize = CGSizeMake(30, 30);
    _goodsTypeTagNode = imageNode;
    
}

//国旗
- (void)addNationalFlagNode:(NSString *)imageUrl{
    
    ASNetworkImageNode *networkImageNode = [LuisXKit nodeNetworkImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleAspectFill DefaultImage:[UIImage imageNamed:@"bg3@2x.png"]];
    networkImageNode.style.preferredSize = CGSizeMake(25, 15);
    _nationalFlagNode = networkImageNode;
    
}

//国家文本
- (void)addNationalNameNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Regular(14)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _nationalNameNode = textNode;
    
}

//抢光了
- (void)addGoodsEmptyTagNode:(UIImage *)image{
    
    ASImageNode *imageNode = [LuisXKit nodeImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleToFill];
    imageNode.backgroundColor = [UIColor colorWithWhite:1.00 alpha:0.80];
    imageNode.image = image;
    _goodsEmptyTagNode = imageNode;

}

#pragma mark -普通商品
//商品图片
- (void)addMainGoodsImageNode:(NSString *)imageUrl{
    
    ASNetworkImageNode *networkImageNode = [LuisXKit nodeNetworkImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleAspectFill DefaultImage:[UIImage imageNamed:@"bg1@2x.png"]];
    //networkImageNode.URL = [NSURL URLWithString:imageUrl];
    networkImageNode.style.preferredSize = CGSizeMake(100, 100);
    _goodsImageNode = networkImageNode;
    
}

//标题
- (void)addTitleNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Light(16)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 2;
    textNode.style.flexShrink = YES;
    _titleNode = textNode;
    
}

//标签
- (void)addGoodsTimeTagNode:(NSString *)text{
    
    ASButtonNode *buttonNode = [LuisXKit nodeButtonNodeAddNode:self Title:text TitleColor:[UIColor whiteColor] Font:FONT_PingFangSC_Regular(12) CornerRadius:25 / 2 BackgroundColor:[UIColor colorWithRed:0.97 green:0.15 blue:0.41 alpha:1.00] ContentVerticalAlignment:ASAlignmentCenter ContentHorizontalAlignment:ASAlignmentMiddle];
    buttonNode.style.minSize = CGSizeMake(90, 25);
    _goodsTimeTagNode = buttonNode;
    
}

//限量
- (void)addLimitNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Regular(12)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _limitNode = textNode;
    
}

//特卖价
- (void)addSpecialPriceNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Light(14)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _specialPriceNode = textNode;
    
}

//平时价
- (void)addNormalPriceNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Light(12)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _normalPriceNode = textNode;
    
}

//分享
- (void)addShareButtonNode{
    
    ASButtonNode *buttonNode = [ASButtonNode new];
    //buttonNode.backgroundColor = [UIColor orangeColor];
    [buttonNode setImage:[UIImage imageNamed:@"home_share_normal"] forState:ASControlStateNormal];
    [buttonNode setImage:[UIImage imageNamed:@"home_share_selected"] forState:ASControlStateHighlighted];
    [buttonNode setBackgroundImage:[UIImage imageNamed:@"home_share_button"] forState:ASControlStateNormal];
    [buttonNode setBackgroundImage:[UIImage imageNamed:@"home_share_button"] forState:ASControlStateHighlighted];
    buttonNode.imageAlignment = ASButtonNodeImageAlignmentBeginning;
    buttonNode.contentVerticalAlignment = ASAlignmentCenter;
    buttonNode.contentHorizontalAlignment = ASAlignmentMiddle;
    [self addSubnode:buttonNode];
    buttonNode.style.preferredSize = CGSizeMake(43, 36);
    [buttonNode addTarget:self action:@selector(doSomeThings) forControlEvents:ASControlNodeEventTouchUpInside];
    _shareButtonNode = buttonNode;
    
}

//工具条
- (void)addBottomToolBarNode{
    
    ASImageNode *imageNode = [LuisXKit nodeImageNodeAddNode:self ClipsToBounds:NO ContentMode:UIViewContentModeScaleToFill];
    imageNode.image = [UIImage imageNamed:@"home_cell_bottom_bg.png"];
    imageNode.style.height = ASDimensionMake(38);
    _bottomToolBarNode = imageNode;
    
}

//上架数目
- (void)addOnLineCountNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Light(14)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _onLineCountNode = textNode;
    
}

//收益
- (void)addEarningNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Light(14)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    textNode.style.flexShrink = YES;
    _earningNode = textNode;
    
}

//上下架状态
- (void)addLineStatusNode:(NSString *)text{
    
    NSAttributedString *attString = [LuisXKit nodeAttributesStringText:text TextColor:[UIColor blackColor] Font:FONT_PingFangSC_Light(14)];
    ASTextNode *textNode = [LuisXKit nodeTextNodeAddNode:self];
    //textNode.backgroundColor = [UIColor orangeColor];
    textNode.attributedText = attString;
    textNode.maximumNumberOfLines = 1;
    _lineStatusNode = textNode;
    
}

//上下架开关位置
- (void)addLineSwitchBackgroundNode{
    
    ASDisplayNode *displayNode = [LuisXKit nodeDisplayNodeAddNode:self BackgroundColor:[UIColor clearColor]];
    displayNode.style.preferredSize = CGSizeMake(41, 25);       //保证和(switchButton相同)
    displayNode.layerBacked = YES;
    _lineSwitchBGNode = displayNode;
    
}

#pragma mark -UISwitch
//上下架开关
- (void)addLineSwitchButton{
    
    UISwitch *switchButton  = [UISwitch new];
    switchButton.backgroundColor = [UIColor clearColor];
    switchButton.transform = CGAffineTransformMakeScale(0.8, 0.8);                              //缩放比例
    switchButton.tintColor = [UIColor colorWithRed:0.84 green:0.84 blue:0.84 alpha:1.00];       //填充颜色
    switchButton.thumbTintColor = [UIColor whiteColor];                                         //按钮颜色
    switchButton.onTintColor = [UIColor colorWithRed:0.97 green:0.15 blue:0.41 alpha:1.00];     //开启颜色
    [switchButton addTarget:self action:@selector(doSomeThings) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchButton];
    _lineSwitchButton = switchButton;
}


- (void)doSomeThings{
    _lineStatusNode.attributedText = [LuisXKit nodeAttributesStringText:@"213423815098" TextColor:[UIColor blackColor] Font:[UIFont systemFontOfSize:18]];
    NSLog(@"测试事件");
}

#pragma mark - layoutSpecThatFits
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{    
#pragma mark -内容约束
    
    //国旗/国家---(水平约束)
    ASStackLayoutSpec *nationalStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                               spacing:5
                                                                        justifyContent:ASStackLayoutJustifyContentStart
                                                                            alignItems:ASStackLayoutAlignItemsCenter
                                                                              children:@[_nationalFlagNode, _nationalNameNode]];
    //时间标签/限量---(水平约束)
    ASStackLayoutSpec *tagStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                spacing:10
                                                                         justifyContent:ASStackLayoutJustifyContentStart
                                                                             alignItems:ASStackLayoutAlignItemsCenter
                                                                               children:@[_goodsTimeTagNode, _limitNode]];
    //特卖/平时---(水平约束)
    ASStackLayoutSpec *priceStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                            spacing:17
                                                                     justifyContent:ASStackLayoutJustifyContentStart
                                                                         alignItems:ASStackLayoutAlignItemsCenter
                                                                           children:@[_specialPriceNode, _normalPriceNode]];
    //商品内容---(竖直约束)
    ASStackLayoutSpec *contentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                              spacing:5
                                                                       justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                           alignItems:ASStackLayoutAlignItemsStretch
                                                                             children:@[]];
    contentStack.style.flexShrink = YES;
    if (_isHaiTao) {
        contentStack.children = @[nationalStack, _titleNode, priceStack];
    }else{
        contentStack.children = @[tagStack, _titleNode, priceStack];
    }
    
    //商品图类型标签---(绝对约束)
    ASAbsoluteLayoutSpec *typeTagAbsolute = [ASAbsoluteLayoutSpec absoluteLayoutSpecWithSizing:ASAbsoluteLayoutSpecSizingDefault
                                                                                      children:@[_goodsTypeTagNode, _goodsImageNode]];
    
    //商品图抢光了标签---(覆盖约束)
    ASOverlayLayoutSpec *emptyTagOverlay = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:typeTagAbsolute
                                                                                   overlay:_goodsEmptyTagNode];
    //商品图---(水平约束)
    ASStackLayoutSpec *goodsImageContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                        spacing:10
                                                                                 justifyContent:ASStackLayoutJustifyContentStart
                                                                                     alignItems:ASStackLayoutAlignItemsStretch
                                                                                       children:@[emptyTagOverlay, contentStack]];
    goodsImageContentStack.style.flexShrink = YES;
    //商品分享---(水平约束)
    ASStackLayoutSpec *shareContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                   spacing:5
                                                                            justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                                alignItems:ASStackLayoutAlignItemsCenter
                                                                                  children:@[goodsImageContentStack, _shareButtonNode]];
#pragma mark -工具条约束
    
    //收益/上架状态/上架按钮---(水平约束)
    ASStackLayoutSpec *bottomToolRightStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                      spacing:5
                                                                               justifyContent:ASStackLayoutJustifyContentEnd
                                                                                   alignItems:ASStackLayoutAlignItemsCenter
                                                                                     children:@[_earningNode, _lineStatusNode, _lineSwitchBGNode]];
    bottomToolRightStack.style.flexGrow = YES;
    //工具条内容---(水平约束)
    ASStackLayoutSpec *bottomToolContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                        spacing:10
                                                                                 justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                                     alignItems:ASStackLayoutAlignItemsCenter
                                                                                       children:@[_onLineCountNode, bottomToolRightStack]];
    //工具条内容边框---(边框约束)
    ASInsetLayoutSpec *bottomToolContentInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(8, 10, 0, 13)
                                                                                       child:bottomToolContentStack];
    //工具条---(边框约束)
    ASInsetLayoutSpec *bottomToolInset = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 10)
                                                                                       child:_bottomToolBarNode];
    //工具条背景
    ASBackgroundLayoutSpec *bottomToolBackgroud = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:bottomToolInset
                                                                                             background:bottomToolContentInset];
#pragma mark -内容/工具条(整体约束)
    //整体内容---(竖直约束)
    ASStackLayoutSpec *allContentStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                                 spacing:5
                                                                          justifyContent:ASStackLayoutJustifyContentSpaceBetween
                                                                              alignItems:ASStackLayoutAlignItemsStretch
                                                                                children:@[shareContentStack, bottomToolBackgroud]];
    //整体边框---(边框约束)
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 0)
                                                  child:allContentStack];
}

#pragma mark -layout
- (void)layout{
    [super layout];
    _lineSwitchButton.frame = _lineSwitchBGNode.frame;
}

#pragma mark -didLoad
- (void)didLoad{
    [super didLoad];
    [self addLineSwitchButton];
    _isHaiTao = NO;
    [self setRichNumberWithTextNode:_specialPriceNode Color:[UIColor redColor] FontSize:14];
}


//改变字符串数字颜色字体
- (void)setRichNumberWithTextNode:(ASTextNode *)textNode Color:(UIColor *)color FontSize:(CGFloat)size{
    
    if (textNode.attributedText == nil) {
        //NSLog(@"过滤空数据");
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:textNode.attributedText];
    NSString *temp = nil;
    for(int i = 0; i < [attributedString length]; i++){
        
        temp = [[textNode.attributedText string] substringWithRange:NSMakeRange(i, 1)];
        if([temp isEqualToString:@"0"] || [temp isEqualToString:@"1"] || [temp isEqualToString:@"2"] || [temp isEqualToString:@"3"] || [temp isEqualToString:@"4"] || [temp isEqualToString:@"5"] || [temp isEqualToString:@"6"] || [temp isEqualToString:@"7"] || [temp isEqualToString:@"8"] || [temp isEqualToString:@"9"]|| [temp isEqualToString:@"."] || [temp isEqualToString:@"-"]||[temp isEqualToString:@","] || [temp isEqualToString:@"¥"]){
            
            [attributedString setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, [UIFont systemFontOfSize:size],NSFontAttributeName, nil] range:NSMakeRange(i, 1)];
            
        }
        
    }
    textNode.attributedText = attributedString;
    
}
@end
