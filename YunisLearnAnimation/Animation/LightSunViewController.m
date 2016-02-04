//
//  LightSunViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/27.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "LightSunViewController.h"
#import "RoundAnimationView.h"
@interface LightSunViewController ()
@property(strong,nonatomic)RoundAnimationView *roundView;

@property (nonatomic, retain) CALayer *animationLayer;
@property (nonatomic, retain) CAShapeLayer *pathLayer;
@end

@implementation LightSunViewController
#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    
    self.roundView = ({
        RoundAnimationView *v = [[RoundAnimationView alloc] init];
        v;
    });
    [self.view addSubview:self.roundView];
    
    [self.roundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(400, 400));
        make.centerX.equalTo(self.view);
        make.top.equalTo(100);
    }];
    
    
    self.animationLayer = [CALayer layer];
    self.animationLayer.frame = CGRectMake(40.0f, 64.0f,
                                           CGRectGetWidth(self.view.layer.bounds) - 40.0f,
                                           CGRectGetHeight(self.view.layer.bounds) - 84.0f);
    [self.view.layer addSublayer:self.animationLayer];
    [self setupDrawingLayer];
    [self startAnimation];
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

#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件
- (IBAction)sliderValueChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.roundView.drawRectValue =  slider.value;
    
//    self.animationLayer.timeOffset = slider.value;
//    [self.roundView setNeedsDisplay];
}

- (void) setupDrawingLayer
{
    if (self.pathLayer != nil) {
        [self.pathLayer removeFromSuperlayer];
        self.pathLayer = nil;
    }
    
    CGRect pathRect = CGRectInset(self.animationLayer.bounds, 100.0f, 100.0f);
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(100, 100) radius:50 startAngle:M_PI*.5 endAngle:M_PI*1.5 clockwise:NSOperationQueueDefaultMaxConcurrentOperationCount];

//    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.animationLayer.bounds;
    pathLayer.bounds = pathRect;
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    //  pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.strokeColor = [UIColor colorWithRed:234.0/255 green:84.0/255 blue:87.0/255 alpha:1].CGColor;
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 1.0f;
    pathLayer.lineJoin = kCALineJoinMiter;
    
    [self.animationLayer addSublayer:pathLayer];
    self.animationLayer.speed = 0;
    self.animationLayer.timeOffset = 0;
    self.pathLayer = pathLayer;
}
- (void) startAnimation
{
    [self.pathLayer removeAllAnimations];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
}

#pragma mark - getters and setters
//初始化页面

@end
