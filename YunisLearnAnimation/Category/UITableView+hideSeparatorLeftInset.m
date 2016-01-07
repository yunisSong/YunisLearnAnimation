//
//  UITableView+hideSeparatorLeftInset.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "UITableView+hideSeparatorLeftInset.h"

@implementation UITableView (hideSeparatorLeftInset)
- (void)hideSeparatorLeftInset
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
