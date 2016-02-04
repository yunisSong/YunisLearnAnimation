//
//  RoundView.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/27.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "RoundView.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
@interface RoundView()
@end
@implementation RoundView

- (instancetype)init{
    self =[super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //加载页面

    }
    return self;
}
- (void)setDrawRectValue:(float)drawRectValue
{

    _drawRectValue = drawRectValue;
    self.alpha = _drawRectValue;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor redColor] set];
    //    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    CGContextAddArc(context, self.center.x/2.f, self.center.y/2.f, self.frame.size.width/2.f -5, 0 - .7*M_PI, (2 - .1)*M_PI*(self.drawRectValue) - .7*M_PI , 0); //添加一个圆
    
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
}

@end
