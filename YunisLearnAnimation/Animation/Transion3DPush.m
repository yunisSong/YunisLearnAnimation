//
//  Transion3DPush.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/12.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "Transion3DPush.h"

@implementation Transion3DPush
- (void)animationAchieve
{
    //把toView加到containerView上
    UIView *fromView = self.fromVC.view;
    UIView *toView = self.toVC.view;
    UIView *containerView = self.containerView;
    [containerView addSubview:toView];
    [containerView sendSubviewToBack:toView];
    //增加透视的transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
    //给fromVC和toVC分别设置相同的起始frame
    CGRect initialFrame = [self.m_transitionContext initialFrameForViewController:self.fromVC];
    fromView.frame = initialFrame;
    toView.frame = initialFrame;
    [self updateAnchorPointAndOffset:CGPointMake(0.0, 0.5) view:fromView];
    //增加阴影
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = fromView.bounds;
    gradient.colors = @[(id)[UIColor colorWithWhite:0.0 alpha:0.5].CGColor,
                        (id)[UIColor colorWithWhite:0.0 alpha:0.0].CGColor];
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(0.8, 0.5);
    UIView *shadow = [[UIView alloc]initWithFrame:fromView.bounds];
    shadow.backgroundColor = [UIColor clearColor];
    [shadow.layer insertSublayer:gradient atIndex:1];
    shadow.alpha = 0.0;
    [fromView addSubview:shadow];
    [UIView animateWithDuration:[self transitionDuration:self.m_transitionContext] delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //旋转fromView 90度
        fromView.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 1.0, 0);
        shadow.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromView.layer.anchorPoint = CGPointMake(0.5, 0.5);
        fromView.layer.position    = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
        fromView.layer.transform = CATransform3DIdentity;
        [shadow removeFromSuperview];
        [self.m_transitionContext completeTransition:YES];
    }];
}

//给传入的View改变锚点
-(void)updateAnchorPointAndOffset:(CGPoint)anchorPoint view:(UIView *)view{
    view.layer.anchorPoint = anchorPoint;
    view.layer.position    = CGPointMake(0, CGRectGetMidY([UIScreen mainScreen].bounds));
}
@end
