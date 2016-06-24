//
//  RoundPOPAnimation.m
//  YunisLearnAnimation
//
//  Created by Yunis on 6/24/16.
//  Copyright © 2016 yunis. All rights reserved.
//

#import "RoundPOPAnimation.h"
#import "RoundPushViewController.h"
#import "RoundPushNextViewController.h"
@implementation RoundPOPAnimation
- (void)animationAchieve
{
    RoundPushNextViewController *fromVC = self.fromVC;
    RoundPushViewController *toVC = self.toVC;
    
    UIView *contView = [self.m_transitionContext containerView];
    UIButton *button = toVC.nextbutton;
    
    [self.containerView addSubview:self.toVC.view];
    [self.containerView addSubview:self.fromVC.view];
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    
    CGPoint finalPoint;
    finalPoint = CGPointMake(button.center.x - 0, button.center.y - CGRectGetMaxY(toVC.view.bounds)+30);

    CGFloat radius = sqrt(finalPoint.x * finalPoint.x + finalPoint.y * finalPoint.y);
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    fromVC.view.layer.mask = maskLayer;
    
    
    CABasicAnimation *pingAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pingAnimation.fromValue = (__bridge id)(startPath.CGPath);
    pingAnimation.toValue   = (__bridge id)(finalPath.CGPath);
    pingAnimation.duration = [self transitionDuration:self.m_transitionContext];
    pingAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    pingAnimation.delegate = self;
    
    [maskLayer addAnimation:pingAnimation forKey:@"pingInvert"];

}
#pragma mark - CABasicAnimation的Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    //告诉 iOS 这个 transition 完成
    [self.m_transitionContext completeTransition:![self. m_transitionContext transitionWasCancelled]];
    //清除 fromVC 的 mask
    [self.m_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.m_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    
}
@end
