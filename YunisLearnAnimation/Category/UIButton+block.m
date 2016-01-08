//
//  UIButton+block.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "UIButton+block.h"
#import <objc/runtime.h>

NSString* const targetBlock;

@implementation UIButton (block)

-(void)addTarget:(id)target forControlEvents:(UIControlEvents)controlEvents  withBlock:(actionBlock)action{
    objc_setAssociatedObject(self, (__bridge const void *)(targetBlock), action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(doBlock) forControlEvents:controlEvents];
}

-(void)doBlock{
    actionBlock block= objc_getAssociatedObject(self,(__bridge const void *)(targetBlock) );
    block(self);
}
@end
