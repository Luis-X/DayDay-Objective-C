//
//  CenterCopyWritringViewController.m
//  LuisXKit
//
//  Created by LuisX on 16/9/7.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "CenterCopyWritringViewController.h"
#import "CenterCopyWritingCollectionViewCell.h"
#import "CSGrowingTextView.h"

#define BUTTOM_BUTTON_TAG   3000
#define HEADER_SPACE    5           //头部间距
#define FOOTER_HEIGHT   64          //尾部高度
#define FOOTER_SPACE    10          //尾部间距
#define ITEM_SPACE      10          //item间距
#define ITEM_LINE_NUM   3           //每行item数量

@interface CenterCopyWritringViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CenterCopyWritingCollectionViewCellDelegate, CSGrowingTextViewDelegate>

@end

@implementation CenterCopyWritringViewController{
    UIView *_mainHeaderView;               //表头
    UIView *_mainFooterView;               //表尾
    UICollectionView *_mainCollectionView;  //主网格
    CGFloat _mainCollectionViewWidth;      //主网格宽度
    NSMutableArray *_selectedIndexPathArr;  //勾选标识IndexPath
    CSGrowingTextView *_titleTextView;                //1标题
    CSGrowingTextView *_contentTextView;               //2内容
    
    NSString *titleString;
    NSString *contentString;
    UICollectionViewFlowLayout *_flowLayout;
    CGFloat title_height;
    CGFloat content_height;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self initailData];
    [self createMainView];
    
}

- (void)initailData{
    
    _mainCollectionViewWidth = self.view.frame.size.width;
    _selectedIndexPathArr = [NSMutableArray array];
    titleString = @"水感透白亮肤睡眠面膜 水感透白亮肤睡眠面膜 水感透白亮肤睡眠面膜 水感透白亮肤睡眠面膜";
    contentString = @"蕴含OLAY独有细胞透白复合物,从细胞源头抑制黑色素形成.\n核心的突破性细胞美白导入技术,能让更多活性成分迅速渗入肌肤, 作用于亿万细胞,使肌肤白皙透亮.\nOLAY水感透白系列的产品介绍 适合人群：\n适合各种肌肤日常使用,特别适用于肤色暗沉的肌肤.\n获得殊荣：\n2011年度悦己杂志编辑推荐大奖";
}

/**
 *  主框架
 */
- (void)createMainView{
    
    [self createCollectionViewSectionHeaderView];
    [self createCollectionViewSectionFooterView];
    
    //网格
    _flowLayout = [UICollectionViewFlowLayout new];
    
    _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
    _mainCollectionView.backgroundColor = [UIColor grayColor];
    _mainCollectionView.dataSource = self;
    _mainCollectionView.delegate = self;
    [self.view addSubview:_mainCollectionView];
    [_mainCollectionView registerClass:[CenterCopyWritingCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [_mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    [_mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        
    }];
    

    
}

#pragma mark 优先加入self.view上
/**
 *  头部框架
 */
- (void)createCollectionViewSectionHeaderView{
    
    //头部背景
    _mainHeaderView = [UIView new];
    _mainHeaderView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_mainHeaderView];
    
    //标题
    _titleTextView = [CSGrowingTextView new];
    _titleTextView.internalTextView.text = titleString;
    _titleTextView.backgroundColor = [UIColor orangeColor];
    _titleTextView.maximumNumberOfLines = 100;
    _titleTextView.delegate = self;
    _titleTextView.growDirection = CSGrowDirectionDown;
    //_titleTextView.font = [UIFont systemFontOfSize:16];
    //_titleTextView.textColor = [UIColor blackColor];
    [_mainHeaderView addSubview:_titleTextView];
    
    //内容
    _contentTextView = [CSGrowingTextView new];
    _contentTextView.internalTextView.text = contentString;
    _contentTextView.backgroundColor = [UIColor orangeColor];
    _contentTextView.maximumNumberOfLines = 100;
    _contentTextView.delegate = self;
    _contentTextView.growDirection = CSGrowDirectionDown;
    //_contentTextView.font = [UIFont systemFontOfSize:14];
    //_contentTextView.textColor = [UIColor grayColor];
    [_mainHeaderView addSubview:_contentTextView];
    
    
    [self updateMainHeaderViewLayoutWithHeaderWidth:_mainCollectionViewWidth Space:HEADER_SPACE];
    
}

/**
 *  更新头部约束
 *
 *  @param headerWidth 头部宽度
 *  @param space       间距
 */

- (void)updateMainHeaderViewLayoutWithHeaderWidth:(CGFloat)headerWidth Space:(CGFloat)space{
    
    [_mainHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(headerWidth);
        
    }];

    [_titleTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_mainHeaderView).offset(space);
        make.left.equalTo(_mainHeaderView).offset(space);
        make.right.equalTo(_mainHeaderView).offset(-space);
        //make.height.mas_greaterThanOrEqualTo([self heightForString:_titleTextView andWidth:headerWidth]);
        
    }];
    
    [_contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_titleTextView.mas_bottom).offset(space);
        make.left.right.equalTo(_titleTextView);
        //make.height.mas_greaterThanOrEqualTo([self heightForString:_contentTextView andWidth:headerWidth]);
        make.bottom.equalTo(_mainHeaderView).offset(-space);
        
    }];
    
}


/**
 *  尾部框架
 */
- (void)createCollectionViewSectionFooterView{
    
    _mainFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _mainCollectionViewWidth, FOOTER_HEIGHT)];
    _mainFooterView.backgroundColor = [UIColor lightGrayColor];
    
    //复制链接,复制文案,保存图片
    [self createButtonWithViewWidth:_mainCollectionViewWidth Contents:@[@"复制链接", @"复制文案", @"保存图片", @"多图分享"] Space:FOOTER_SPACE Action:@selector(allBottomButtonAction:)];
    
}

/**
 *  创建多个按钮
 *
 *  @param viewWidth 要添加的视图宽度
 *  @param contents  按钮内容
 *  @param space     按钮间距(上左下右)
 *  @param action    按钮事件
 */
- (void)createButtonWithViewWidth:(CGFloat)viewWidth Contents:(NSArray *)contents Space:(CGFloat)space Action:(SEL)action{
    
    for (NSInteger i = 0; i < contents.count; i++) {
        
        CGFloat buttonWidth = (viewWidth - (contents.count + 1) * space) / contents.count;
        if (contents.count <= 0) {
            buttonWidth = 0;
        }
        
        UIView *buttonView = [UIView new];
        buttonView.backgroundColor = [UIColor orangeColor];
        buttonView.tag = BUTTOM_BUTTON_TAG + i;
        [_mainFooterView addSubview:buttonView];
        [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_mainFooterView).offset(space + (space + buttonWidth) * i);
            make.top.equalTo(_mainFooterView).offset(space);
            make.bottom.equalTo(_mainFooterView).offset(-space);
            make.width.mas_equalTo(buttonWidth);
            
        }];
        
        //图标
        UIImageView *icons = [UIImageView new];
        //icons.backgroundColor = [UIColor redColor];
        [icons setImage:[UIImage imageNamed:@"apple"]];
        icons.userInteractionEnabled = YES;
        [buttonView addSubview:icons];
        [icons mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.height.mas_equalTo(25);
            make.centerY.equalTo(buttonView);
            make.left.equalTo(buttonView);
            
        }];
        //文本
        UILabel *texts = [UILabel new];
        texts.font = [UIFont systemFontOfSize:14];
        texts.adjustsFontSizeToFitWidth = YES;
        //texts.backgroundColor = [UIColor blueColor];
        texts.text = [NSString stringWithFormat:@"%@", [contents objectAtIndex:i]];
        [buttonView addSubview:texts];
        [texts mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(icons.mas_right);
            make.right.equalTo(buttonView);
            make.centerY.equalTo(buttonView);
            
        }];
        
        [buttonView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:action]];
    
    }
    
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

#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 12;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CenterCopyWritingCollectionViewCell *cell = (CenterCopyWritingCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.cellIndexPath = indexPath;
    [self checkCellSelectedStatusWithCell:cell IndexPath:indexPath];
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        //头部区域
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            
            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
                [headerView addSubview:_mainHeaderView];
            
            return headerView;
            
        }
        //尾部区域
        if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
            
            UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            [footerView addSubview:_mainFooterView];
            return footerView;
            
        }
        
    }
    
    return nil;
}


#pragma mark -UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"放大图片%@", indexPath);
}

#pragma mark -UICollectionViewDelegateFlowLayout
//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return ITEM_SPACE;
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return ITEM_SPACE;
}

//上左下右间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(ITEM_SPACE, ITEM_SPACE, ITEM_SPACE, ITEM_SPACE);
    
}

//item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self getItemSizeCollectionWidth:_mainCollectionViewWidth Num:ITEM_LINE_NUM Space:ITEM_SPACE];
}

//头部高度

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        //return CGSizeMake(collectionView.frame.size.width, _mainHeaderView.frame.size.height);
        return CGSizeMake(collectionView.frame.size.width, title_height + content_height + 3 * HEADER_SPACE);
        
    }
    
    return CGSizeZero;
    
}


//尾部高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
    
        return CGSizeMake(collectionView.frame.size.width, FOOTER_HEIGHT);
        
    }
    
    return CGSizeZero;
    
}

#pragma mark -AllButtonAction

- (void)allBottomButtonAction:(UITapGestureRecognizer *)tap{
    
    switch (tap.view.tag) {
        case BUTTOM_BUTTON_TAG:
            //复制链接
            [self bottomButtonCopyUrlAction];
            break;
            
        case BUTTOM_BUTTON_TAG + 1:
            //复制文案
            [self bottomButtonCopyTextAction];
            break;
            
        case BUTTOM_BUTTON_TAG + 2:
            //保存图片
            [self bottomButtonSavePicAction];
            break;
            
        default:
            break;
    }
    
}

//复制链接
- (void)bottomButtonCopyUrlAction{
    
}

//复制文案
- (void)bottomButtonCopyTextAction{
    
}

//保存图片
- (void)bottomButtonSavePicAction{
    
    NSLog(@"%@", _selectedIndexPathArr);

}


#pragma mark -CenterCopyWritingCollectionViewCellDelegate
//选中cell回调
- (void)chooseCellWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath{
    
    //取消勾选
    if ([_selectedIndexPathArr containsObject:selectedIndexPath]) {
        [_selectedIndexPathArr removeObject:selectedIndexPath];
        [_mainCollectionView reloadData];
        return;
    }
    
    //勾选
        [_selectedIndexPathArr addObject:selectedIndexPath];
        [_mainCollectionView reloadData];
    
}

/**
 *  检查勾选状态(更新勾选按钮)
 *
 */
- (void)checkCellSelectedStatusWithCell:(CenterCopyWritingCollectionViewCell *)cell IndexPath:(NSIndexPath *)indexPath{
    
    [cell updateSelectedButtonSatausIsSelected:NO];
    if ([_selectedIndexPathArr containsObject:indexPath]) {
        //NSLog(@"已勾选 %@", indexPath);
        [cell updateSelectedButtonSatausIsSelected:YES];
    }
    
}

/**
 *  根据宽度,水平数量,间距返回item宽度(必要条件屏幕边缘有间距)
 *
 *  @param width collectionView宽度
 *  @param num   item数量
 *  @param space 间距
 *
 *  @return item的宽度
 */
- (CGSize)getItemSizeCollectionWidth:(CGFloat)collectionWidth Num:(NSInteger)num Space:(CGFloat)space{
    
    if (num <= 0) {
        return CGSizeZero;
    }
    CGFloat itemWidth = (collectionWidth - (num + 1) * space) / num;
    return CGSizeMake(itemWidth, itemWidth);
    
}

/**
 *  根据宽度返回textView的高度
 *
 *  @param textView 要计算的TextView
 *  @param width    文本宽度
 *
 */
- (CGFloat)heightForString:(UITextView *)textView andWidth:(float)width{
    
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
    
}

#pragma mark - CSGrowingTextViewDelegate
- (void)growingTextView:(CSGrowingTextView *)growingTextView didChangeHeight:(CGFloat)height{
    
    
    if (_titleTextView == growingTextView) {
        
        title_height = height;

    }
    if (_contentTextView == growingTextView) {
        
        content_height = height;
        
    }
    
   [_titleTextView mas_updateConstraints:^(MASConstraintMaker *make) {
      
       make.height.mas_equalTo(title_height);
       
   }];
    
    [_contentTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(content_height);
        
    }];
    
    
    
    [_mainCollectionView reloadData];
    NSLog(@"%f", _mainHeaderView.frame.size.height);
}

@end
