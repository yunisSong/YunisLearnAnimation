//
//  BaseTransitionObject.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTransitionObject : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,strong,readonly)UIViewController *fromVC;
@property(nonatomic,strong,readonly)UIViewController *toVC;
@property(nonatomic,strong,readonly)UIView *containerView;
@property(nonatomic,strong,readonly)id<UIViewControllerContextTransitioning> m_transitionContext;
@end
