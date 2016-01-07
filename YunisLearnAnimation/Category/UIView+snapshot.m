//
//  UIView+snapshot.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "UIView+snapshot.h"

@implementation UIView (snapshot)
- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
- (UIView *)snapshotView
{
    UIView *view = [self snapshotViewAfterScreenUpdates:YES];
    return view;
}
@end
