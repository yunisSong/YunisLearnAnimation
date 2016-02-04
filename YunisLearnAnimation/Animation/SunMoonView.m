//
//  SunMoonView.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/27.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "SunMoonView.h"
/*
 太阳 
 月亮
 */
@implementation SunMoonView

- (instancetype)initWithType:(SunMoonType)type{
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];

        float x = 0 ;
        float y;
        float r = 50;
        CGPoint center= self.center;
        y = sqrtf(r*r - (x - center.x)*(x - center.x)) - center.y;

    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}
- (void)didMoveToSuperview
{
    NSLog(@"didMoveToSuperview == %@",NSStringFromCGRect(self.frame));
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"willMoveToSuperview == %@",NSStringFromCGRect(self.frame));

}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor greenColor]set];
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextAddArc(context, self.center.x/4.f, self.center.y/4.f, self.frame.size.width/2.f - 10, 0, 2*M_PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充
}
- (void)startAnimation
{
    
}
- (void)stopAnimation
{
    
}
@end
