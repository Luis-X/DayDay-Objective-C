//
//  PaySelectedOptionView.m
//  DayDayObjectiveC
//
//  Created by LuisX on 2017/4/20.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "PaySelectedOptionView.h"

#define Option_tag              5000
#define Option_icon_tag         5100
#define Option_title_tag        5200
#define Option_subtitle_tag     5300
#define Option_select_tag       5400
#define Option_status_tag       5500

#define Option_height      55   //选项高度
#define Option_level_space 20   //水平间距
#define Opiton_icon_size   25   //图标
#define Opiton_status_size 20   //勾选


@interface  PaySelectedOptionView()
@property(nonatomic, strong)NSArray *mainOptions;
@property(nonatomic, copy)SelectedIndex chooseIndex;
@end

@implementation PaySelectedOptionView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)showOptionContentViewOptions:(NSArray *)options defaultIndex:(NSInteger)defaultIndex index:(SelectedIndex)index{
    
    self.mainOptions = options;
    self.chooseIndex = index;
    [self loadOptionContentViewOptions:options defaultIndex:defaultIndex];
    
}

/**
 加载选项

 @param options 选项数据
 @param defaultIndex 默认选中
 */
- (void)loadOptionContentViewOptions:(NSArray *)options defaultIndex:(NSInteger)defaultIndex{
    
    for (NSInteger i = 0; i < options.count; i++) {
        
        UIButton *optionContentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:optionContentButton];
        [optionContentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(Option_height * i);
            make.left.right.equalTo(self);
            make.height.mas_equalTo(Option_height);
        }];
        [optionContentButton addTarget:self action:@selector(optionContentButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *iconImageView = [SJUIKit imageViewAddView:optionContentButton ClipsToBounds:NO ContentMode:1];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(Opiton_icon_size, Opiton_icon_size));
            make.centerY.equalTo(optionContentButton);
            make.left.equalTo(optionContentButton).offset(Option_level_space);
        }];
        
        //文本内容
        UIView *textContentView = [SJUIKit viewAddView:optionContentButton BackgroundColor:[UIColor whiteColor]];
        [textContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconImageView.mas_right).offset(10);
            make.centerY.equalTo(optionContentButton);
        }];
        
        UILabel *titleLabel = [SJUIKit labelAddView:textContentView TextColor:[UIColor colorWithRed:0.10 green:0.07 blue:0.06 alpha:1.00] Font:[UIFont systemFontOfSize:14]];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(textContentView);
        }];
        
        UILabel *subTitleLabel = [SJUIKit labelAddView:textContentView TextColor:[UIColor whiteColor] Font:[UIFont systemFontOfSize:9]];
        subTitleLabel.backgroundColor = [UIColor colorWithRed:0.96 green:0.22 blue:0.33 alpha:1.00];
        subTitleLabel.layer.masksToBounds = YES;
        subTitleLabel.layer.cornerRadius = 6.8;
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(textContentView);
            make.top.equalTo(titleLabel.mas_bottom);
        }];
        
        UILabel *selectIcon = [SJUIKit labelAddView:textContentView TextColor:nil Font:[UIFont fontWithName:@"iconfont" size:20]];
        [selectIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(Opiton_status_size, Opiton_status_size));
            make.centerY.equalTo(optionContentButton);
            make.right.equalTo(optionContentButton).offset(-Option_level_space);
        }];
        
        UILabel *messageLabel = [SJUIKit labelAddView:optionContentButton TextColor:[UIColor colorWithRed:0.96 green:0.22 blue:0.33 alpha:1.00] Font:[UIFont systemFontOfSize:12]];
        messageLabel.numberOfLines = 2;
        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(optionContentButton);
            make.left.equalTo(titleLabel.mas_right).offset(10);
            make.right.equalTo(optionContentButton).offset(-Option_level_space);
        }];
        
        UIView *blackLine = [UIView new];
        blackLine.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
        [optionContentButton addSubview:blackLine];
        [blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconImageView);
            make.right.equalTo(optionContentButton);
            make.height.mas_equalTo(0.5);
            make.bottom.equalTo(optionContentButton);
        }];
        
        //设置Tag
        optionContentButton.tag = Option_tag + i;
        iconImageView.tag = Option_icon_tag + i;
        titleLabel.tag = Option_title_tag + i;
        subTitleLabel.tag = Option_subtitle_tag + i;
        selectIcon.tag = Option_select_tag + i;
        messageLabel.tag = Option_status_tag + i;
        
        //最后一排
        if (i == (options.count - 1)) {
            [optionContentButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self);
            }];
            [blackLine mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
        
    }
    [self updateOptionStyleWithSelectedIndex:defaultIndex];
    
}

- (void)optionContentButtonAction:(UIButton *)button{
    
    NSInteger index = button.tag - Option_tag;
    [self updateOptionStyleWithSelectedIndex:index];
    if (self.chooseIndex) {
        self.chooseIndex(index);
    }
    
}

#pragma mark - 更新数据
- (void)updateOptionStyleWithSelectedIndex:(NSInteger)selectedIndex{
    
    [_mainOptions enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //数据
        NSString *selectedPic = [dic objectForKey:PayOptionIcon];
        NSString *unselectedPic = [dic objectForKey:PayOptionUnIcon];
        NSString *titleString = [dic objectForKey:PayOptionTitle];
        NSString *subTitleString = [dic objectForKey:PayOptionSubTitle];
        NSString *messageString = [dic objectForKey:PayOptionMessage];
        NSNumber *messageAlignment = [dic objectForKey:PayOptionMessageAlignment];
        //组件
        UIButton *optionContentButton = [self viewWithTag:(NSInteger)(Option_tag + idx)];          //选项
        UIImageView *iconImageView = [self viewWithTag:(NSInteger)(Option_icon_tag + idx)];        //图标
        UILabel *titleLabel = [self viewWithTag:(NSInteger)(Option_title_tag + idx)];              //标题
        UILabel *subTitleLabel = [self viewWithTag:(NSInteger)(Option_subtitle_tag + idx)];        //副标题
        UILabel *selectIcon = [self viewWithTag:(NSInteger)(Option_select_tag + idx)];             //勾选
        UILabel *messageLabel = [self viewWithTag:(NSInteger)(Option_status_tag + idx)];           //信息
        //样式
        iconImageView.image = (idx == selectedIndex) ? [UIImage imageNamed:selectedPic] : [UIImage imageNamed:unselectedPic];
        titleLabel.text = titleString;
        //titleLabel.textColor = (idx == selectedIndex) ? [UIColor blackColor] : [UIColor blackColor];
        selectIcon.text = (idx == selectedIndex) ? @"\U0000e6d2" : @"\U0000e6d4";
        selectIcon.textColor = (idx == selectedIndex) ? [UIColor colorWithRed:0.96 green:0.22 blue:0.33 alpha:1.00] : [UIColor colorWithRed:0.50 green:0.50 blue:0.50 alpha:1.00];
        if (subTitleString.length) {
            subTitleLabel.text = [NSString stringWithFormat:@"  %@  ", subTitleString];
            [subTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(14);
                make.top.equalTo(titleLabel.mas_bottom).offset(3);
            }];
        }
        
        //点击无效
        if (messageString.length) {
            optionContentButton.enabled = NO;
            selectIcon.hidden = YES;
            messageLabel.text = messageString;
            if (messageAlignment) {
                messageLabel.textAlignment = messageAlignment.integerValue;
            }
            titleLabel.textColor = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.00];
            subTitleLabel.backgroundColor = [UIColor colorWithRed:0.80 green:0.80 blue:0.80 alpha:1.00];
        }else{
            optionContentButton.enabled = YES;
            selectIcon.hidden = NO;
        }
        
    }];
    
}
@end
