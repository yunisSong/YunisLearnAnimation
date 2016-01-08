//
//  UIView+Controller.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Controller)
/**
 Returns the view's view controller (may be nil).
 */
@property (nonatomic, readonly) UIViewController *viewController;
@end
