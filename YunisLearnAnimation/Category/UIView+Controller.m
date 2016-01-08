//
//  UIView+Controller.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "UIView+Controller.h"

@implementation UIView (Controller)
- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
