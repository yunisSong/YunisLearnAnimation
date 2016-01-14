//
//  Transion3DDiss.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/12.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "Transion3DDiss.h"

@implementation Transion3DDiss
- (void)animationAchieve
{
    
    
    UIView *fromView = self.fromVC.view;
    UIView *toView = self.toVC.view;
    
    UIView *containerView = self.containerView;

    
    [containerView addSubview:toView];
    
    //增加透视的transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    containerView.layer.sublayerTransform = transform;
    
    //给fromVC和toVC分别设置相同的起始frame
    CGRect initialFrame = [self.m_transitionContext initialFrameForViewController:self.fromVC];
    fromView.frame = initialFrame;
    toView.frame = initialFrame;
    
    //改变View的锚点
    [self updateAnchorPointAndOffset:CGPointMake(0.0, 0.5) view:toView];
    
    //让toView的截图旋转90度
    toView.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0.0, 1.0, 0.0);
    
    
    [UIView animateWithDuration:[self transitionDuration:self.m_transitionContext] delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        //旋转fromView 90度
        toView.layer.transform = CATransform3DMakeRotation(0, 0, 1.0, 0);
        
    } completion:^(BOOL finished) {
        
        toView.layer.anchorPoint = CGPointMake(0.5, 0.5);
        toView.layer.position    = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
        [self.m_transitionContext completeTransition:![self.m_transitionContext transitionWasCancelled]];
        
    }];
}
//给传入的View改变锚点
-(void)updateAnchorPointAndOffset:(CGPoint)anchorPoint view:(UIView *)view{
    view.layer.anchorPoint = anchorPoint;
    view.layer.position    = CGPointMake(0, CGRectGetMidY([UIScreen mainScreen].bounds));
}
@end
