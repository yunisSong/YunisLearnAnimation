//
//  TransitionFromFirstToSecond.m
//  CustomTransitionAnimation
//
//  Created by 臧其龙 on 15/2/21.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "TransitionFromFirstToSecond.h"

#import "QQMusicViewController.h"
#import "InfoViewController.h"
#import "UIView+snapshot.h"
@implementation TransitionFromFirstToSecond

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return .5;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UINavigationController *nav = (UINavigationController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    QQMusicViewController *fromViewController = (QQMusicViewController *)nav.topViewController;
    InfoViewController *toViewController = (InfoViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    UIView *cellImageSnapshot = [fromViewController.imageView snapshotView];
    
//    将rect从view中转换到当前视图中，返回在当前视图中的rect
//    - (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;
    
    cellImageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.view];
    fromViewController.imageView.hidden = YES;
    
   
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.secondImageview.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        
        toViewController.view.alpha = 1.0;
        
        
        CGRect frame = [containerView convertRect:toViewController.secondImageview.frame fromView:toViewController.view];
        NSLog(@"frame is %@",NSStringFromCGRect(toViewController.secondImageview.frame));
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        
        toViewController.secondImageview.hidden = NO;
        fromViewController.imageView.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
      
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}@end
