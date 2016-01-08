//
//  DrawLineView.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "DrawLineView.h"
#import "DrawBezierPath.h"



@interface DrawLineView()
@property (nonatomic, strong)DrawBezierPath * path;
@property (nonatomic, strong)CAShapeLayer * slayer;
@end

@implementation DrawLineView



#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}


- (void)dealloc
{
    
}

#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法
// 根据touches集合获取对应的触摸点
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    
    return [touch locationInView:self];
}
#pragma mark - Delegate
//代理方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint startP = [self pointWithTouches:touches];
    
    if ([event allTouches].count == 1) {
        
        DrawBezierPath *path = [DrawBezierPath paintPathWithLineWidth:3
                                                       startPoint:startP];
        _path = path;
        
        CAShapeLayer * slayer = [CAShapeLayer layer];
        slayer.path = path.CGPath;
        slayer.backgroundColor = [UIColor clearColor].CGColor;
        slayer.fillColor = [UIColor clearColor].CGColor;
        slayer.lineCap = kCALineCapRound;
        slayer.lineJoin = kCALineJoinRound;
        slayer.strokeColor = [UIColor blackColor].CGColor;
        slayer.lineWidth = path.lineWidth;
        [self.layer addSublayer:slayer];
        _slayer = slayer;
//        [[self mutableArrayValueForKey:@"canceledLines"] removeAllObjects];
//        [[self mutableArrayValueForKey:@"lines"] addObject:_slayer];
        
    }

}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    CGPoint moveP = [self pointWithTouches:touches];
    
    if ([event allTouches].count > 1){
        
        [self.superview touchesMoved:touches withEvent:event];
        
    }else if ([event allTouches].count == 1) {
        
        [_path addLineToPoint:moveP];
        
        _slayer.path = _path.CGPath;
        
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    if ([event allTouches].count > 1){
        [self.superview touchesMoved:touches withEvent:event];
    }
}
- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面
@end
