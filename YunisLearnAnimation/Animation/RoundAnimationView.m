//
//  RoundAnimationView.m
//  YunisImitateLight
//
//  Created by Yunis on 16/1/27.
//  Copyright © 2016年 Yunis. All rights reserved.
//

#import "RoundAnimationView.h"
#import "RoundView.h"
#import "SunMoonView.h"
#import <QuartzCore/QuartzCore.h>
/*
 1,圆弧动画
 2，透明度动画
 3，太阳位移动画
 4，太阳旋转动画
 5，显示日期动画
 6，判断是太阳还是月亮
 
 分割
 1，太阳月亮
 2，圆弧
 3，日期
 
 */

@interface RoundAnimationView ()
@property(nonatomic,strong)RoundView *roundView;
@end

@implementation RoundAnimationView
{
    float image_x;
    float image_y;
    UIImageView *s;
    float angle;
    NSTimer *timer;
}
- (instancetype)init{
    self =[super init];
    if (self) {
//        self.drawRectValue = 1;
        self.backgroundColor = [UIColor purpleColor];
        self.roundView = ({
            RoundView *v = [[RoundView alloc] init];
            v;
        });
        image_x = - 67.5;
        image_y = - 67.5;
        [self addSubview:self.roundView];
        [self.roundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.equalTo(200);
            make.height.equalTo(200);
        }];
        s = ({
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sun"]];
            imageView;
        });
        s.frame = CGRectMake(0, 0, 15, 15);
        s.center = CGPointMake(self.center.x - 67.5, self.center.y - 67.5);
        [self addSubview:s];
        
        
        timer = [NSTimer timerWithTimeInterval:.01
                                                 target:self
                                               selector:@selector(actualizarTiempo:)
                                               userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        
    }
    return self;
}
- (void)actualizarTiempo:(NSTimer *)t
{
    angle = angle + 0.01;//angle角度 double angle;
    if (angle > 6.28) {//大于 M_PI*2(360度) 角度再次从0开始
        [timer invalidate];
        timer = nil;
        angle = 0;
    }
    CGAffineTransform transform=CGAffineTransformMakeRotation(angle);
    s.transform = transform;
}
- (void)setDrawRectValue:(float)drawRectValue
{
    _drawRectValue = drawRectValue;
    self.roundView.drawRectValue = _drawRectValue;
    image_x = self.roundView.center.x - 67.5 + ((1 - _drawRectValue) * 200);
    image_y = self.roundView.center.y - 67.5 - ((1 - _drawRectValue) * 80);
    s.center = CGPointMake(image_x, image_y);
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
}
@end
