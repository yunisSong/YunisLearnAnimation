//
//  BannnerMaskView.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/25.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "BannnerMaskView.h"
@interface BannnerMaskView()
@property (nonatomic, retain) CAShapeLayer *pathLayer;
@property(nonatomic)UIBezierPath *path;
@property (nonatomic) CAShapeLayer* shapeLayer;
@end
@implementation BannnerMaskView
- (instancetype)init{
    self =[super init];
    if (self) {
        self.drawRectValue = 1;
        self.backgroundColor = [UIColor clearColor];
        self.shapeLayer = [CAShapeLayer layer];
//        UIBezierPath *aPath = [UIBezierPath bezierPath];
//        CGSize viewSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
//        CGPoint startPoint = CGPointMake(0,self.frame.size.height);
//        [aPath moveToPoint:startPoint];
//        [aPath addLineToPoint:CGPointMake(viewSize.width,startPoint.y)];
//        [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,0)];
//        [aPath addQuadCurveToPoint:CGPointMake(0,0) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),self.frame.size.height*2*_drawRectValue )];
//        self.shapeLayer.path = aPath.CGPath;
        self.shapeLayer.fillColor = [UIColor whiteColor].CGColor;
        
        [self.layer addSublayer: self.shapeLayer];
    }
    return self;
}
- (void)setDrawRectValue:(float)drawRectValue
{
    _drawRectValue = drawRectValue;
//    [self setNeedsDisplay];
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    CGSize viewSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    CGPoint startPoint = CGPointMake(0,self.frame.size.height);
    [aPath moveToPoint:startPoint];
    [aPath addLineToPoint:CGPointMake(viewSize.width,startPoint.y)];
    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,0)];
    [aPath addQuadCurveToPoint:CGPointMake(0,0) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),self.frame.size.height*2*_drawRectValue )];
    self.shapeLayer.path = aPath.CGPath;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    [KGrayColor set];
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    CGSize viewSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    CGPoint startPoint = CGPointMake(0,self.frame.size.height);
    [aPath moveToPoint:startPoint];
    [aPath addLineToPoint:CGPointMake(viewSize.width,startPoint.y)];
    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,0)];
    [aPath addQuadCurveToPoint:CGPointMake(0,0) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),self.frame.size.height*2*_drawRectValue )];
    [aPath fill];
    [aPath closePath];
    
}


@end
