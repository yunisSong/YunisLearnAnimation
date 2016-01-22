//
//  CircleInfo.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/22.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CircleInfo : NSObject
@property(nonatomic,readonly)CGPoint centerPoint;/**<圆心*/
@property(nonatomic,readonly)float raduis;/**<半径*/
// 存: [array addObject:[NSValue valueWithCGPoint:point]];
// 取: CGPoint anotherPoint = [[array objectAtIndex:index] CGPointValue];
+ (instancetype)GetCircle:(NSArray<NSValue *>*)PointArray;
@end
