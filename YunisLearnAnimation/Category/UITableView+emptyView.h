//
//  UITableView+emptyView.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (emptyView)
@property(nonatomic,strong,readonly)UIView *emptyView;

- (void)addEmptyViewWithImageName:(NSString *)imageName title:(NSString *)title;

@end
