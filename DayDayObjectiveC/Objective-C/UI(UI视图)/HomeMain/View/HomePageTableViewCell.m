//
//  HomePageTableViewCell.m
//  LuisXKit
//
//  Created by LuisX on 16/9/22.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "HomePageTableViewCell.h"
#import "HomePageConstant.h"

@implementation HomePageTableViewCell{
    UILabel *_goodsStatusLabel;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    
    //底部背景
    UIView *cellBackgroundView = [UIView new];
    [self.contentView addSubview:cellBackgroundView];
    //cellBackgroundView.backgroundColor = [UIColor orangeColor];
    [cellBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.left.equalTo(self.contentView.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.right.equalTo(self.contentView.mas_right);
    }];
    
    //图片
    UIImageView *goodsImageView = [UIImageView new];
    goodsImageView.backgroundColor = [UIColor lightGrayColor];
    goodsImageView.clipsToBounds = YES;
    goodsImageView.contentMode = 3;
    [cellBackgroundView addSubview:goodsImageView];
    [goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(cellBackgroundView);
        make.left.equalTo(cellBackgroundView).offset(15);
        make.width.height.mas_equalTo(95);
        
    }];
    
    //分享背景
    UIImageView *shareBackgroundView = [UIImageView new];
    //shareBackgroundView.backgroundColor = [UIColor blackColor];
    [shareBackgroundView setImage:[UIImage imageNamed:@"home_share_button"]];
    shareBackgroundView.userInteractionEnabled = YES;
    [cellBackgroundView addSubview:shareBackgroundView];
    [shareBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(goodsImageView);
        make.right.equalTo(cellBackgroundView);
        make.width.mas_equalTo(43);
        make.height.mas_equalTo(36);
        
    }];
    
    //分享
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //shareButton.backgroundColor = [UIColor orangeColor];
    [shareButton setImage:[UIImage imageNamed:@"home_share_normal"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageNamed:@"home_share_selected"] forState:UIControlStateHighlighted];
    [shareBackgroundView addSubview:shareButton];
    [shareButton addTarget:self action:@selector(homeGoodsShareAction:) forControlEvents:UIControlEventTouchUpInside];
    [shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(shareBackgroundView);
        make.left.equalTo(shareBackgroundView).offset(7);
        make.width.mas_equalTo(26);
        
    }];
    
    //限时开枪
    UILabel *timeRemberLabel = [UILabel new];
    timeRemberLabel.backgroundColor = COLOR_PINK_TEXT;
    timeRemberLabel.text = @"10:00 已开抢";
    timeRemberLabel.textColor = [UIColor whiteColor];
    timeRemberLabel.font = [UIFont systemFontOfSize:12];
    timeRemberLabel.textAlignment = NSTextAlignmentCenter;
    timeRemberLabel.layer.masksToBounds = YES;
    timeRemberLabel.layer.cornerRadius = 25 / 2;
    [cellBackgroundView addSubview:timeRemberLabel];
    [timeRemberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(goodsImageView);
        make.left.equalTo(goodsImageView.mas_right).offset(10);
        make.width.mas_equalTo(95);
        make.height.mas_equalTo(25);
        
    }];
    
    //限量
    UILabel *surplusLabel = [UILabel new];
    surplusLabel.text = @"限量: 100";
    //surplusLabel.backgroundColor = [UIColor orangeColor];
    surplusLabel.font = [UIFont systemFontOfSize:12];
    [cellBackgroundView addSubview:surplusLabel];
    [surplusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(timeRemberLabel.mas_right).offset(10);
        make.centerY.equalTo(timeRemberLabel);
        
    }];
    
    //标题
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"巴黎兰梦幻婚礼美白保湿提亮素颜霜50.0ML";
    //titleLabel.backgroundColor = [UIColor orangeColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.numberOfLines = 2;
    [cellBackgroundView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(goodsImageView);
        make.left.equalTo(goodsImageView.mas_right).offset(10);
        make.right.equalTo(shareBackgroundView.mas_left).offset(-5);
        
    }];
    
    //特卖价格
    UILabel *specialSaleLabel = [UILabel new];
    specialSaleLabel.text = @"特卖价:￥175.00";
    specialSaleLabel.font = [UIFont systemFontOfSize:14];
    //specialSaleLabel.backgroundColor = [UIColor orangeColor];
    [cellBackgroundView addSubview:specialSaleLabel];
    [specialSaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(goodsImageView);
        make.left.equalTo(goodsImageView.mas_right).offset(10);
        
    }];
    [HomePageConstant setRichNumberWithLabel:specialSaleLabel Color:COLOR_RED_TEXT FontSize:14];
    
    //平时价格
    UILabel *normalSaleLabel = [UILabel new];
    normalSaleLabel.text = @"平时:￥175.00";
    normalSaleLabel.textColor = COLOR_GRAY_TEXT;
    normalSaleLabel.font = [UIFont systemFontOfSize:12];
    //normalSaleLabel.backgroundColor = [UIColor orangeColor];
    [cellBackgroundView addSubview:normalSaleLabel];
    [normalSaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(specialSaleLabel.mas_right).offset(15);
        make.centerY.equalTo(specialSaleLabel);
        
    }];
    [HomePageConstant addDeleteLineWithLabel:normalSaleLabel Color:COLOR_GRAY_TEXT];
    
    //底部工具条
    UIImageView *bottomToolImageView = [UIImageView new];
    //bottomToolImageView.backgroundColor = [UIColor redColor];
    [bottomToolImageView setImage:[UIImage imageNamed:@"home_cell_bottom_bg.png"]];
    bottomToolImageView.userInteractionEnabled = YES;
    [cellBackgroundView addSubview:bottomToolImageView];
    [bottomToolImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(goodsImageView.mas_bottom).offset(10);
        make.left.equalTo(cellBackgroundView).offset(10);
        make.right.equalTo(cellBackgroundView).offset(-10);
        make.height.mas_equalTo(38);
        make.bottom.equalTo(cellBackgroundView);
        
    }];
    
    //已经被上架
    UILabel *putawayLabel = [UILabel new];
    putawayLabel.text = @"已被1980位店主上架";
    putawayLabel.font = [UIFont systemFontOfSize:14];
    putawayLabel.textColor = COLOR_GRAY_TEXT;
    //putawayLabel.backgroundColor = [UIColor orangeColor];
    [bottomToolImageView addSubview:putawayLabel];
    [putawayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottomToolImageView).offset(5);
        make.centerY.equalTo(bottomToolImageView).offset(4);
        
    }];
    
    //上架状态开关
    UISwitch *upDownSwitch = [UISwitch new];
    upDownSwitch.backgroundColor = [UIColor clearColor];
    upDownSwitch.transform = CGAffineTransformMakeScale(0.8, 0.8);                            //缩放比例
    upDownSwitch.tintColor = [UIColor colorWithRed:0.84 green:0.84 blue:0.84 alpha:1.00];       //填充颜色
    upDownSwitch.thumbTintColor = [UIColor whiteColor];                                         //按钮颜色
    upDownSwitch.onTintColor = [UIColor colorWithRed:0.97 green:0.15 blue:0.41 alpha:1.00];     //开启颜色
    [upDownSwitch addTarget:self action:@selector(upDownChangeSwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomToolImageView addSubview:upDownSwitch];
    [upDownSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(bottomToolImageView).offset(4);
        make.right.equalTo(bottomToolImageView).offset(-1);
        
    }];
    
    //上架状态指示
    _goodsStatusLabel = [UILabel new];
    //_goodsStatusLabel.backgroundColor = [UIColor orangeColor];
    _goodsStatusLabel.text = @"已上架";
    _goodsStatusLabel.textAlignment = NSTextAlignmentCenter;
    _goodsStatusLabel.font = [UIFont systemFontOfSize:12];
    [bottomToolImageView addSubview:_goodsStatusLabel];
    [_goodsStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(upDownSwitch.mas_left);
        make.centerY.equalTo(bottomToolImageView).offset(4);
        make.width.mas_equalTo(40);
        
    }];
    
    
    //收益
    UILabel *incomeLabel = [UILabel new];
    incomeLabel.text = @"收益:￥25.5";
    incomeLabel.font = [UIFont systemFontOfSize:14];
    //incomeLabel.backgroundColor = [UIColor orangeColor];
    [bottomToolImageView addSubview:incomeLabel];
    [incomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(bottomToolImageView).offset(4);
        make.right.equalTo(_goodsStatusLabel.mas_left).offset(-5);
        
    }];
    [HomePageConstant setRichNumberWithLabel:incomeLabel Color:COLOR_RED_TEXT FontSize:14];
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


//上下架切换
- (void)upDownChangeSwitchAction:(UISwitch *)sender{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        NSLog(@"上架");
        _goodsStatusLabel.text = @"上架";
    }else{
        NSLog(@"下架");
        _goodsStatusLabel.text = @"已上架";
    }
    
}

//分享
- (void)homeGoodsShareAction:(id)sender{
    NSLog(@"分享");
    [self.delegate homeTableViewCellShareEvent];
}

@end
