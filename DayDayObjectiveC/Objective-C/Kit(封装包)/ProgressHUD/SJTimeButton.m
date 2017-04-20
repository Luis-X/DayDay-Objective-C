//
//  SJTimeButton.m
//  LuisXKit
//
//  Created by LuisX on 2016/11/11.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "SJTimeButton.h"

@implementation SJTimeButton

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
    
}

- (void)setNormalTitle:(NSString *)normalTitle{
    if (_normalTitle != normalTitle) {
        _normalTitle = normalTitle;
        [self updateTimeButtonTitle:_normalTitle];
    }
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor{
    if (_normalTitleColor != normalTitleColor) {
        _normalTitleColor = normalTitleColor;
        [self updateTimeButtonTitleColor:_normalTitleColor];
    }
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor{
    if (_normalBackgroundColor != normalBackgroundColor) {
        _normalBackgroundColor = normalBackgroundColor;
        [self updateTimeButtonBackgroundColor:_normalBackgroundColor];
    }
}

- (void)setNormalBorderColor:(UIColor *)normalBorderColor{
    if (_normalBorderColor != normalBorderColor) {
        _normalBorderColor = normalBorderColor;
        [self updateTimeButtonBorderColor:_normalBorderColor];
    }
}
- (void)setTitleFont:(UIFont *)titleFont{
    if (_titleFont != titleFont) {
        _titleFont = titleFont;
        self.titleLabel.font = _titleFont;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
 倒计时核心

 @param duration 时长
 */
- (void)startTimeWithDuration:(NSInteger)duration{
    
    __block NSInteger timeout = duration;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){
            
            //倒计时结束
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userInteractionEnabled = YES;
                [self updateTimeButtonTitle:_normalTitle];
                [self updateTimeButtonTitleColor:_normalTitleColor];
                [self updateTimeButtonBackgroundColor:_normalBackgroundColor];
                [self updateTimeButtonBorderColor:_normalBorderColor];
            });
            
        }else{
            
            //倒计时中
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userInteractionEnabled = NO;
                [self updateTimeButtonTitle:[NSString stringWithFormat:@"%@%ld%@", _timeRunningTitle, timeout, SJ_Time_Unit]];
                [self updateTimeButtonTitleColor:_timeRunningTitleColor];
                [self updateTimeButtonBackgroundColor:_timeRunningBackgroundColor];
                [self updateTimeButtonBorderColor:_timeRunningBorderColor];
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
    
}


/**
 标题
 */
- (void)updateTimeButtonTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}

/**
 标题颜色
 */
- (void)updateTimeButtonTitleColor:(UIColor *)titleColor{
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

/**
 背景颜色
 */
- (void)updateTimeButtonBackgroundColor:(UIColor *)backgroundColor{
    [self setBackgroundColor:backgroundColor];
}

/**
 边框颜色
 */
- (void)updateTimeButtonBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}


/**
 重写target-action (待修)
 */
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    [super addTarget:target action:action forControlEvents:controlEvents];
    [self startTimeWithDuration:_timeDuration];
}

@end
