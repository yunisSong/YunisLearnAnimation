//
//  YXBJTransition.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/18.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YXBJTransition.h"

@implementation YXBJTransition
- (void)EvernoteTransitionWithSelectCell:(YXBJCollectionViewCell *)selectCell visibleCells:(NSArray<__kindof YXBJCollectionViewCell *> *)visibleCells originFrame:(CGRect)originFrame finalFrame:(CGRect)finalFrame panViewController:(UIViewController *)panViewController listViewController:(UIViewController *)listViewController
{
}
- (void)animationAchieve
{
//    let nextVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
//    
//    transitionContext.containerView()?.backgroundColor = BGColor
//    selectCell.frame = isPresent ? originFrame : finalFrame
//    let addView = nextVC?.view
//    addView!.hidden = isPresent ? true : false
//    transitionContext.containerView()?.addSubview(addView!)
//    let removeCons = isPresent ? selectCell.labelLeadCons : selectCell.horizonallyCons
//    let addCons = isPresent ? selectCell.horizonallyCons : selectCell.labelLeadCons
//    selectCell.removeConstraint(removeCons)
//    selectCell.addConstraint(addCons)
//    UIView.animateWithDuration(self.transitionDuration(transitionContext), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//        for visibleCell:CollectionViewCell in self.visibleCells {
//            if visibleCell != self.selectCell {
//                var frame = visibleCell.frame
//                if visibleCell.tag < self.selectCell.tag {
//                    let yDistance = self.originFrame.origin.y - self.finalFrame.origin.y + 30
//                    let yUpdate = self.isPresent ? yDistance : -yDistance
//                    frame.origin.y -= yUpdate
//                }else if visibleCell.tag > self.selectCell.tag{
//                    let yDistance = CGRectGetMaxY(self.finalFrame) - CGRectGetMaxY(self.originFrame) + 30
//                    let yUpdate = self.isPresent ? yDistance : -yDistance
//                    frame.origin.y += yUpdate
//                }
//                visibleCell.frame = frame
//                visibleCell.transform = self.isPresent ? CGAffineTransformMakeScale(0.8, 1.0):CGAffineTransformIdentity
//            }
//        }
//        self.selectCell.backButton.alpha = self.isPresent ? 1.0 : 0.0
//        self.selectCell.titleLine.alpha = self.isPresent ? 1.0 : 0.0
//        self.selectCell.textView.alpha = self.isPresent ? 1.0 : 0.0
//        self.selectCell.frame = self.isPresent ? self.finalFrame : self.originFrame
//        self.selectCell.layoutIfNeeded()
//    }) { (stop) -> Void in
//        addView!.hidden = false
//        transitionContext.completeTransition(true)
//    }
    
    self.selectCell.frame = isPresent?self.originFrame:self.finalFrame;
    self.containerView.backgroundColor = [UIColor greenColor];
    self.toVC.view.hidden = isPresent?YES:NO;
    [self.containerView addSubview:self.toVC.view];
    
    
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return .45;
}
@end
