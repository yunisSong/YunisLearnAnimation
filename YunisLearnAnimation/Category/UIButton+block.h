//
//  UIButton+block.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^actionBlock)(UIButton*btr);
@interface UIButton (block)

-(void)addTarget:(id)target forControlEvents:(UIControlEvents)controlEvents  withBlock:(actionBlock)action;
@end
