//
//  ModuleLayoutAttributes.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/3/30.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "ModuleLayoutAttributes.h"

@implementation ModuleLayoutAttributes
- (id)init
{
    self = [super init];
    if (self) {
        _headerTextAlignment = NSTextAlignmentLeft;
        _shadowOpacity = 0.5;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    ModuleLayoutAttributes *newAttributes = [super copyWithZone:zone];
    newAttributes.headerTextAlignment = self.headerTextAlignment;
    newAttributes.shadowOpacity = self.shadowOpacity;
    return newAttributes;
}
@end
