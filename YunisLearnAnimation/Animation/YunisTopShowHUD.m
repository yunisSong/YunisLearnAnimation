//
//  YunisTopShowHUD.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/19.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YunisTopShowHUD.h"
#import "UIImage+ImageEffects.h"
#import "UIView+snapshot.h"
#import "YunisAlertTitleView.h"
@interface YunisTopShowHUD()
{
    YunisAlertTitleView *topView;
    UIImageView *bgImageView;
    float topContranst;
}
@end

static const float topViewHeigth = 188;
@implementation YunisTopShowHUD

#pragma mark - Life Cycle

+ (instancetype)showWithType:(YunisTopHUDShowType)type
{
    YunisTopShowHUD *hud = [[YunisTopShowHUD alloc] init];
    switch (type) {
        case YunisTopHUDShowWithBlurLayer: {
            [hud addBgView];
            break;
        }
        case YunisTopHUDShowWithCleanLayer: {
            
            break;
        }
        default: {
            break;
        }
    }
    return hud;
}

- (instancetype)init
{
    CGRect t = [[UIScreen mainScreen] bounds];
    self = [super initWithFrame:t];
    if (self) {


        topContranst = - topViewHeigth;
        topView = [[YunisAlertTitleView alloc] initWithFrame:CGRectMake(0, - topViewHeigth, self.frame.size.width,topViewHeigth)];
        topView.backgroundColor = [UIColor purpleColor];
        [self addSubview:topView];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diss)];
        [self addGestureRecognizer:tap];
        
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)updateConstraints
{
    [super updateConstraints];
    [topView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(topViewHeigth);
        make.top.equalTo(topContranst);
    }];
}
- (void)dealloc
{
    NSLog(@"%@  dealloc",[self class]);
}

#pragma mark - Public Method
//外部方法
- (void)addBgView
{
    UIImage *s =  [[UIApplication sharedApplication].keyWindow snapshotImage];
    bgImageView = [[UIImageView alloc] initWithImage:[s applyDarkEffect]];
    bgImageView.alpha = 0;

    [self insertSubview:bgImageView belowSubview:topView];
}
- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    topContranst = 0;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
   [UIView animateWithDuration:.3 animations:^{
       bgImageView.alpha =1;
   }];
    

    [UIView animateWithDuration:.8
                          delay:0
         usingSpringWithDamping:.5
          initialSpringVelocity:1
                        options:UIViewAnimationOptionTransitionCurlDown
                     animations:^{
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished) {
                     }];
}
- (void)diss{
    topContranst = -topViewHeigth;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:.3 animations:^{
        bgImageView.alpha =0;
    }];
   
    [UIView animateWithDuration:.5 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];

    
}
#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面

@end
