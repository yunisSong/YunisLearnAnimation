//
//  UITableViewCell+hideSeparatorLeftInset.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "UITableViewCell+hideSeparatorLeftInset.h"

@implementation UITableViewCell (hideSeparatorLeftInset)
- (void)hideSeparatorLeftInset
{
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
