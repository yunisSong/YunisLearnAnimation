//
//  FollowWuYanZhu.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/6.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "FollowWuYanZhu.h"
#import "TBAnimationButton.h"
@interface FollowWuYanZhu ()
@property (weak, nonatomic) IBOutlet TBAnimationButton *openBtr;

@end

static const float KmaxViewtraillingWidth = 135.f;
static const float KminViewtraillingWidth = 0.f;
static const float KMaxedsgNum = 10.f;
static const float KMinedsgNum = 0.f;
static const float openDuration = .5f;
static const float fillDuration = .3f;
#define defaultColore [UIColor colorWithRed:75.0/255 green:151/255.0 blue:96/255.0 alpha:1]
@implementation FollowWuYanZhu

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面

    self.twoButton.alpha = 0.f;
    self.one.backgroundColor = defaultColore;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件

}
- (void)dealloc
{
    
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法
- (void)testP{
    _traillingConstraints.constant = 10.f;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            _traillingConstraints.constant = 157.f;
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                [self.view layoutIfNeeded];
                
            } completion:^(BOOL finished) {
                
            }];
        }
    }];
}
- (IBAction)openView{
    
    if (_traillingConstraints.constant == 0) {
         _openBtr.currentState = TBAnimationButtonStateCross;
        _topConstraints.constant = KMaxedsgNum;
        _leftConstraints.constant = KMaxedsgNum;
        _bottomConstraints.constant = KMaxedsgNum;
        _traillingConstraints.constant = KmaxViewtraillingWidth;
//        _btrTopConstraints.constant = 55.f;
//        _btrTwoConstraints.constant = 104.f;

    }else
    {
         _openBtr.currentState = TBAnimationButtonStatePlus;
        _traillingConstraints.constant = KminViewtraillingWidth;
        _topConstraints.constant = KMinedsgNum;
        _leftConstraints.constant = KMinedsgNum;
        _bottomConstraints.constant = KMinedsgNum;
//        _btrTopConstraints.constant = 0;
//        _btrTwoConstraints.constant = 0;


    }
    [UIView animateWithDuration:openDuration delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        
    }];
    
    
}
#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件
- (IBAction)showColoreView{
    UIColor *backcolor = defaultColore;
    _coloreView.backgroundColor = backcolor;
    [UIView animateWithDuration:fillDuration animations:^{
        _coloreView.transform = CGAffineTransformMakeScale(5.3, 2);
    } completion:^(BOOL finished) {
        
    }];
    [_buttonContainerView bringSubviewToFront:_twoButton];
    [UIView animateWithDuration:fillDuration animations:^{
        _one.alpha = 0.f;
        _twoButton.alpha = 1;
    }];
}
- (IBAction)hiddenColoreView{
    [UIView animateWithDuration:fillDuration animations:^{
        _coloreView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
    [_buttonContainerView bringSubviewToFront:_one];
    [UIView animateWithDuration:fillDuration animations:^{
        _one.alpha = 1;
        _twoButton.alpha = 0.f;
    }];
}


#pragma mark - getters and setters
//初始化页面

@end
