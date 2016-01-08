//
//  CircleSpreadTransition.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/6.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "CircleSpreadTransition.h"
#import "UIColor+randomColor.h"
#import "UIButton+block.h"
@interface CircleSpreadTransition ()
@property(nonatomic)BOOL isShow;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UIView *maskView;
@end

@implementation CircleSpreadTransition

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = ({
        UIButton *btr       = [UIButton buttonWithType:UIButtonTypeCustom];
        float t             = 0;
        btr.titleLabel.font = [UIFont systemFontOfSize:18];
        [btr setBackgroundColor:[UIColor colorWithRed:75.0/255 green:151/255.0 blue:96/255.0 alpha:1]];
        btr.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btr setTitleEdgeInsets:UIEdgeInsetsMake(t, t, t, t)];
        [btr addTarget:self action:@selector(animation) forControlEvents:UIControlEventTouchUpInside];
        btr.frame = CGRectMake(0, 0, 50, 60);
        btr.center = self.view.center;
        btr;
    });
    
    
    self.maskView = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        view.frame = CGRectMake(0, 0, 50, 60);
        view.center = self.view.center;
        view;
    });
    
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.button];

    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件
}
- (void)dealloc
{
    
}
#pragma mark - Public Method
//外部方法

- (CGRect)buttonFrame{
    return _button.frame;
}
#pragma mark - Private Method
//本类方法
- (void)animation{
    //画两个圆路径
    UIBezierPath *startCycle =  [UIBezierPath bezierPathWithOvalInRect:self.buttonFrame];
    CGFloat x = self.button.frame.origin.x;
    CGFloat y = self.button.frame.origin.y;
    CGFloat radius = sqrtf(pow(x, 2) + pow(y, 2));
    UIBezierPath *endCycle = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    //创建CAShapeLayer进行遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endCycle.CGPath;
    //将maskLayer作为toVC.View的遮盖
    self.view.layer.mask = maskLayer;
    self.view.layer.mask.backgroundColor = [UIColor redColor].CGColor;
    self.view.layer.mask.borderColor = [UIColor yellowColor].CGColor;
    self.view.layer.mask.shadowColor = [UIColor greenColor].CGColor;
    //创建路径动画
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.delegate = self;
    //动画是加到layer上的，所以必须为CGPath，再将CGPath桥接为OC对象
    maskLayerAnimation.fromValue = (__bridge id)(startCycle.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((endCycle.CGPath));
    maskLayerAnimation.duration = .5;
    maskLayerAnimation.delegate = self;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
}


- (void)transformAnimation{
    if (!_isShow) {
//        UIColor *backcolor = [UIColor colorWithRed:75.0/255 green:151/255.0 blue:96/255.0 alpha:1];
        UIColor *backcolor = [UIColor randomColor];

        _maskView.backgroundColor = backcolor;
        [UIView animateWithDuration:0.5 animations:^{
            _maskView.transform = CGAffineTransformMakeScale(10, 10);
            self.button.backgroundColor = [UIColor randomColor];

        } completion:^(BOOL finished) {
        }];
    }else
    {
        UIColor *backcolor = [UIColor colorWithRed:75.0/255 green:151/255.0 blue:96/255.0 alpha:1];
        _maskView.backgroundColor = backcolor;
        [UIView animateWithDuration:0.5 animations:^{
            _maskView.transform = CGAffineTransformMakeScale(1, 1);
            self.button.backgroundColor = [UIColor randomColor];

        } completion:^(BOOL finished) {
        }];
    }
    _isShow = !_isShow;

//    [_buttonContainerView bringSubviewToFront:_unexpandBottomViewButton];
//    [UIView animateWithDuration:0.5 animations:^{
//        _unexpandBottomViewButton.alpha = 1;
//    }];
}
#pragma mark - Delegate
//代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.view.layer.mask = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    CGPoint t = [[touches anyObject] locationInView:self.view];
    
    
    NSLog(@"touch point = %@",NSStringFromCGPoint(t));
    
    
//    UIBezierPath *startCycle =  [UIBezierPath bezierPathWithOvalInRect:CGRectMake(t.x, t.y, 10, 10)];
//    CGFloat x = self.button.frame.origin.x;
//    CGFloat y = self.button.frame.origin.y;
//    CGFloat radius = sqrtf(pow(x, 2) + pow(y, 2));
//    UIBezierPath *endCycle = [UIBezierPath bezierPathWithArcCenter:t radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//    //创建CAShapeLayer进行遮盖
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.path = endCycle.CGPath;
//    //将maskLayer作为toVC.View的遮盖
//    self.view.layer.mask = maskLayer;
//    self.view.layer.mask.backgroundColor = [UIColor redColor].CGColor;
//    self.view.layer.mask.borderColor = [UIColor yellowColor].CGColor;
//    self.view.layer.mask.shadowColor = [UIColor greenColor].CGColor;
//    
//    
//
//    
//    
//    //创建路径动画
//    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
//    maskLayerAnimation.delegate = self;
//    //动画是加到layer上的，所以必须为CGPath，再将CGPath桥接为OC对象
//    maskLayerAnimation.fromValue = (__bridge id)(startCycle.CGPath);
//    maskLayerAnimation.toValue = (__bridge id)((endCycle.CGPath));
//    maskLayerAnimation.duration = .5;
//    maskLayerAnimation.delegate = self;
//    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
    
    CGPoint Temp = self.maskView.center;
    self.maskView.center = t;
    UIColor *backcolor = [UIColor randomColor];
    
    _maskView.backgroundColor = backcolor;
    [UIView animateWithDuration:0.5 animations:^{
        _maskView.transform = CGAffineTransformMakeScale(10, 10);
    } completion:^(BOOL finished) {
        _maskView.transform = CGAffineTransformMakeScale(1, 1);
        self.maskView.center = Temp;
    }];
    
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面

@end
