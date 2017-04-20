//
//  AsyncViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/11/15.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "AsyncViewController.h"
#import "TableViewNodeCell.h"
#import "ASTestView.h"
@interface AsyncViewController ()<ASTableDataSource, ASTableDelegate>

@end

@implementation AsyncViewController{
    ASTableNode *_mainTableNode;
    ASTextNode *_textNode;
}

#pragma mark -必须实现initWithNode

- (instancetype)init
{
    _mainTableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    self = [super initWithNode:_mainTableNode];
    
    if (self) {
        _mainTableNode.dataSource = self;
        _mainTableNode.delegate = self;
    }
    
    return self;
}

- (void)addTableNode{
    _mainTableNode.backgroundColor = [UIColor orangeColor];
    _mainTableNode.frame = _mainTableNode.bounds;
    [self.node addSubnode:_mainTableNode];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     //Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //[self exampleUIView];
    [self exampleUILabel];
    //[self exampleUITextViewAndUITextField];
    [self exampleUIButton];
   // [self exampleUIImageView];
   // [self exampleASTestView];
//    _mainTableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
  //  [_mainTableNode reloadData];
}

- (void)exampleASTestView{

    ASTestView *asTestView = [[ASTestView alloc] init];
    asTestView.frame = CGRectMake(100, 100, 100, 100);
    asTestView.backgroundColor = [UIColor orangeColor];
    [self.node addSubnode:asTestView];
    
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

#pragma mark -UIView
- (void)exampleUIView{
    
    
    ASDisplayNode *nodeView = [LuisXKit nodeDisplayNodeAddNode:self.node BackgroundColor:[UIColor orangeColor]];
    //nodeView.hidden = YES;
    nodeView.borderWidth = 1;
    nodeView.borderColor = [UIColor redColor].CGColor;
    nodeView.cornerRadius = 50;
    nodeView.clipsToBounds = YES;
    [nodeView.view mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    
}

#pragma mark -UILabel
- (void)exampleUILabel{
    
    //只支持富文本显示
    ASTextNode *nodeLabel = [LuisXKit nodeTextNodeAddNode:self.node];
    nodeLabel.backgroundColor = [UIColor orangeColor];
    nodeLabel.attributedText = [LuisXKit nodeAttributesStringText:@"123" TextColor:[UIColor redColor] Font:[UIFont systemFontOfSize:14]];
    [nodeLabel.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(100, 20));
        
    }];
    _textNode = nodeLabel;
    
}

#pragma mark -UIButton
- (void)exampleUIButton{
    //文本
    ASButtonNode *nodeButton = [LuisXKit nodeButtonNodeAddNode:self.node Title:@"标题" TitleColor:[UIColor redColor] Font:[UIFont systemFontOfSize:14] CornerRadius:10 BackgroundColor:[UIColor orangeColor] ContentVerticalAlignment:ASVerticalAlignmentCenter ContentHorizontalAlignment:ASHorizontalAlignmentMiddle];
    nodeButton.frame = CGRectMake(0, 200, 100, 100);
    [nodeButton addTarget:self action:@selector(nodeButtonAction) forControlEvents:ASControlNodeEventTouchUpInside];

    //图文
    ASButtonNode *nodeButton2 = [LuisXKit nodeButtonNodeAddNode:self.node Title:@"123" TitleColor:[UIColor redColor] Font:[UIFont systemFontOfSize:14] Image:[UIImage imageNamed:@"luisx_ui@2x.png"] ImageAlignment:ASButtonNodeImageAlignmentBeginning CornerRadius:5 BackgroundColor:[UIColor orangeColor] ContentVerticalAlignment:ASVerticalAlignmentCenter ContentHorizontalAlignment:ASHorizontalAlignmentMiddle];
    nodeButton2.frame = CGRectMake(0, 300, 100, 100);
    [nodeButton2 addTarget:self action:@selector(nodeButtonAction) forControlEvents:ASControlNodeEventTouchUpInside];
}

//事件
- (void)nodeButtonAction{
    NSLog(@"按钮");
    _textNode.attributedText = [LuisXKit nodeAttributesStringText:@"1342423423423423423" TextColor:[UIColor redColor] Font:[UIFont systemFontOfSize:14]];
}

#pragma mark -UIImageView
- (void)exampleUIImageView{
    
    //普通图片
    ASImageNode *nodeImageView = [LuisXKit nodeImageNodeAddNode:self.node ClipsToBounds:YES ContentMode:UIViewContentModeScaleAspectFill];
    nodeImageView.backgroundColor = [UIColor lightGrayColor];
    nodeImageView.image = [UIImage imageNamed:@"bg1@2x.png"];
    [nodeImageView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];
    
    //网络图片
    ASNetworkImageNode *nodeNetworkImageView = [LuisXKit nodeNetworkImageNodeAddNode:self.node ClipsToBounds:YES ContentMode:UIViewContentModeScaleAspectFill DefaultImage:[UIImage imageNamed:@"bg1@2x.png"]];
    nodeNetworkImageView.backgroundColor = [UIColor orangeColor];
    nodeNetworkImageView.URL = [NSURL URLWithString:@"http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg"];
    [nodeNetworkImageView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
    }];

    
}

#pragma mark -UITextView / UITextField
- (void)exampleUITextViewAndUITextField{
    //ASEditableTextNode
}

#pragma mark -UITableView
- (void)exampleUITableView{
    //ASTableView 实质上是一个 ScrollView ，其中添加有指定数的 ASDisplayNode，在屏幕滚动时，离屏的ASDisplayNode内容会被暂时释放，在屏或接近在屏的ASDisplayNode会被提前加载。因此，ASTableView 不存在 Cell 复用的问题，也不存在任何 Cell 复用。
    
}

#pragma mark -UITableViewCell
//ASCellNode


#pragma mark - ASTableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
        TableViewNodeCell *cellNode = [[TableViewNodeCell alloc] initWithString:@"测试"];
        //cellNode.delegate = self;
        return cellNode;
    };
    
    return cellNodeBlock;
}

#pragma mark - ASTableDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
