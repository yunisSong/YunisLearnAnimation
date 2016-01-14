//
//  BaseTransitionObject.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

static const float BaseAnimationDuration = .5;

#import "BaseTransitionObject.h"

@interface BaseTransitionObject()

@property(nonatomic,strong)UIViewController *fromVC;
@property(nonatomic,strong)UIViewController *toVC;
@property(nonatomic,strong)UIView *containerView;
@property (nonatomic,strong)id<UIViewControllerContextTransitioning> m_transitionContext;
@end
@implementation BaseTransitionObject

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return BaseAnimationDuration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView = [transitionContext containerView];
    self.m_transitionContext = transitionContext;
    [self animationAchieve];
}
- (void)animationAchieve
{
    
}
@end
