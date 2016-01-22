//
//  CircleInfo.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/22.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "CircleInfo.h"
@interface CircleInfo()
@property(nonatomic,readwrite)CGPoint centerPoint;/**<圆心*/
@property(nonatomic,readwrite)float raduis;/**<半径*/
@end
@implementation CircleInfo
+ (instancetype)GetCircle:(NSArray<NSValue *>*)PointArray
{
    if (PointArray.count < 3) {
        
        return nil;
    }
    
    
    CircleInfo *circle3point = [[CircleInfo alloc] init];
    
    
    double mat1,mat2,mat3 ;
    
    CGPoint point1 = [[PointArray objectAtIndex:0] CGPointValue];
    CGPoint point2 = [[PointArray objectAtIndex:1] CGPointValue];
    CGPoint point3 = [[PointArray objectAtIndex:2] CGPointValue];
    mat1 = ((point2.x*point2.x +point2.y*point2.y)-(point1.x*point1.x +point1.y*point1.y))*(2*(point3.y-point1.y))-
    ((point3.x*point3.x +point3.y*point3.y)-(point1.x*point1.x +point1.y*point1.y))*(2*(point2.y-point1.y));
    mat2 = (2*(point2.x-point1.x))*((point3.x*point3.x+point3.y*point3.y)-(point1.x*point1.x +point1.y*point1.y))-
    (2*(point3.x-point1.x))*((point2.x*point2.x+point2.y*point2.y)-(point1.x*point1.x +point1.y*point1.y));
    mat3 = 4*((point2.x-point1.x)*(point3.y-point1.y) - (point3.x-point1.x)*(point2.y-point1.y));
    
//    circle3point.centerPoint.x = mat1/mat3;
//    circle3point.centerPoint.y = mat2/mat3;
    circle3point.centerPoint = CGPointMake(mat1/mat3, mat2/mat3);
    circle3point.raduis = sqrt((double)((point1.x-circle3point.centerPoint.x)*(point1.x-circle3point.centerPoint.x) +
                                         (point1.y-circle3point.centerPoint.y)*(point1.y-circle3point.centerPoint.y)));
    return circle3point;
}
@end
