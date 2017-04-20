//
//  DataSelectedView.m
//  LuisXKit
//
//  Created by LuisX on 16/9/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "DataSelectedView.h"

#define MID_VIEW_WIDTH 120      //中间视图宽度
#define WEEK_HEIGHT 15          //星期高度

@implementation DataSelectedView{
    UILabel *_weekDayLabel;     //星期
    UILabel *_dayLabel;         //日期
    NSDate *_nowDate;           //当前日期
    UIButton *_beforeButton;    //前一天按钮
    UIButton *_afterButton;     //后一天按钮
}

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
        [self createSubViews];
    }
    return self;
    
}

- (void)createSubViews{
    
    //前一天
    _beforeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //_beforeButton.backgroundColor = [UIColor redColor];
    _beforeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_beforeButton setTitle:@"<前一天" forState:UIControlStateNormal];
    [_beforeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:_beforeButton];
    [_beforeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        
    }];
    [_beforeButton addTarget:self action:@selector(goLastDayAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //后一天
    _afterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //_afterButton.backgroundColor = [UIColor redColor];
    _afterButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_afterButton setTitle:@"后一天>" forState:UIControlStateNormal];
    [_afterButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:_afterButton];
    [_afterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        
    }];
    [_afterButton addTarget:self action:@selector(goNextDayAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //今日特卖
    UIView *centerDateView = [UIView new];
    //centerDateView.backgroundColor = [UIColor blueColor];
    [self addSubview:centerDateView];
    [centerDateView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
        make.top.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-10);
        make.width.mas_equalTo(MID_VIEW_WIDTH);
        
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goTodayAction:)];
    [centerDateView addGestureRecognizer:tap];
    
    //星期
    _weekDayLabel = [UILabel new];
    _weekDayLabel.backgroundColor = [UIColor grayColor];
    _weekDayLabel.textColor = [UIColor whiteColor];
    _weekDayLabel.font = [UIFont systemFontOfSize:10];
    _weekDayLabel.textAlignment = NSTextAlignmentCenter;
    _weekDayLabel.adjustsFontSizeToFitWidth = YES;
    [centerDateView addSubview:_weekDayLabel];
    [_weekDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(centerDateView);
        make.width.mas_equalTo(MID_VIEW_WIDTH / 3);
        make.height.mas_equalTo(WEEK_HEIGHT);
        
    }];
    
    //日期
    _dayLabel = [UILabel new];
    _dayLabel.backgroundColor = [UIColor blackColor];
    _dayLabel.textColor = [UIColor whiteColor];
    _dayLabel.font = [UIFont systemFontOfSize:20];
    _dayLabel.textAlignment = NSTextAlignmentCenter;
    _dayLabel.adjustsFontSizeToFitWidth = YES;
    [centerDateView addSubview:_dayLabel];
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_weekDayLabel.mas_bottom);
        make.left.right.equalTo(_weekDayLabel);
        make.bottom.equalTo(centerDateView);
        
    }];
    
    //今日特卖
    UIImageView *todayImageView = [UIImageView new];
    //todayImageView.backgroundColor = [UIColor redColor];
    todayImageView.clipsToBounds = YES;
    todayImageView.contentMode = 1;
    todayImageView.userInteractionEnabled = YES;
    todayImageView.image = [UIImage imageNamed:@"title1"];
    [centerDateView addSubview:todayImageView];
    [todayImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.bottom.equalTo(centerDateView);
        make.left.equalTo(_weekDayLabel.mas_right);
        
    }];

    UIView *blackLine = [UIView new];
    blackLine.backgroundColor = [UIColor grayColor];
    [self addSubview:blackLine];
    [blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
        
    }];
    
}


//更新日期
- (void)updateNowDateWithDate:(NSDate *)date{
    
    
    _nowDate = date;
    _weekDayLabel.text = [NSString stringWithFormat:@"%@", [date formattedDateWithFormat:@"EEEE"]];
    _dayLabel.text = [NSString stringWithFormat:@"%ld", date.day];

    
    
    //默认显示前一天,后一天按钮
    _beforeButton.hidden = NO;
    _afterButton.hidden = NO;
    
    //今日(隐藏前一天按钮)
    if ([date isToday]) {
        _beforeButton.hidden = YES;
        return;
    }
    
    //后天(隐藏后一天按钮)
    NSDate *afterTomorrowDate = [[NSDate date] dateByAddingDays:2];
    if ([date isSameDay:afterTomorrowDate]) {
        _afterButton.hidden = YES;
        return;
    }

}

//前一天
- (void)goLastDayAction:(id)sender{

    //NSLog(@"前一天");
    [self updateNowDateWithDate:[_nowDate dateBySubtractingDays:1]];
    [self.delegate dataSelectedGoLastDay];
    
}

//后一天
- (void)goNextDayAction:(id)sender{
    
    //NSLog(@"后一天");
    [self updateNowDateWithDate:[_nowDate dateByAddingDays:1]];
    [self.delegate dataSelectedGoNextDay];
    
}

//今日
- (void)goTodayAction:(id)sender{
    
    //NSLog(@"今日");
    [self updateNowDateWithDate:[NSDate date]];
    [self.delegate dataSelectedGoToday];
    
}
@end
