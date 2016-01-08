//
//  BaseTransitionObject.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

static const float BaseAnimationDuration = .5;

#import "BaseTransitionObject.h"

@implementation BaseTransitionObject

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return BaseAnimationDuration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
}
@end
