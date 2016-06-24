//
//  GroupViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 6/23/16.
//  Copyright © 2016 yunis. All rights reserved.
//

#import "GroupViewController.h"

/*
 还是抄袭彦祖大大的。。。
 简直是宝库啊。
 */
@interface GroupViewController ()
{
    NSMutableArray *pointArray;
    NSMutableArray *viewsArray;

    NSArray *colorArray;
}
@end

@implementation GroupViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadSource];
    [self loadSubViews];
   
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
- (CAAnimationGroup *)createGroupAnimationWithDelay:(CFTimeInterval)time withIndex:(NSInteger)index;
{
    float timeDuration = 2;
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:self.view.center];
    moveAnimation.toValue = pointArray[index];
    // moveAnimation.beginTime = 0;
    moveAnimation.duration = timeDuration;
    //autoreverses
    /* When true, the object plays backwards after playing forwards. Defaults
     * to NO. */
    moveAnimation.autoreverses = YES;
    // return moveAnimation;
    
    //大小
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(0);
    scaleAnimation.toValue = @(3);
    scaleAnimation.duration = timeDuration;
    scaleAnimation.autoreverses = YES;
    //透明度
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @(1);
    alphaAnimation.toValue = @(0);
    alphaAnimation.duration = timeDuration;
    alphaAnimation.autoreverses = YES;
    //圆角
    CABasicAnimation *cornerRadiusAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAnimation.fromValue = @(5);
    cornerRadiusAnimation.toValue = @(0);
    cornerRadiusAnimation.duration = timeDuration;
    cornerRadiusAnimation.autoreverses = YES;
    
    //组合动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[moveAnimation,scaleAnimation,alphaAnimation,cornerRadiusAnimation];
    group.autoreverses = YES;
    group.duration = timeDuration;
    group.repeatCount = HUGE_VALF;
    group.beginTime = CACurrentMediaTime()+time;
    return group;
}

- (void)loadSource
{
    pointArray = [NSMutableArray array];
    viewsArray = [NSMutableArray array];
    colorArray = @[[UIColor blueColor],[UIColor redColor],[UIColor purpleColor],[UIColor yellowColor],[UIColor blueColor],[UIColor blackColor],[UIColor grayColor],[UIColor orangeColor]];
    
  
}

- (void)loadSubViews{
    CGFloat centerX = self.view.center.x;
    CGFloat centerY = self.view.center.y;
    
    //把一个圆分成8个角度
    CGFloat delta = 2*M_PI/8;
    //计算圆形上第7个点
    CGFloat x = centerX + 50 * cos(delta*7);
    CGFloat y = centerY + 50 * sin(delta*7);
    
    
    
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view1.center = self.view.center;
    view1.backgroundColor = colorArray[0];
    view1.layer.cornerRadius = 5;
    view1.layer.masksToBounds = YES;
    view1.layer.transform = CATransform3DMakeScale(0, 0, 0);
    [self.view addSubview:view1];
    [pointArray addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
    [viewsArray addObject:view1];
    
    
    for (int i =0; i<7; i++) {
        CGFloat x = centerX + 50 * cos(delta*i);
        CGFloat y = centerY + 50 * sin(delta*i);
        [pointArray addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        view.center = self.view.center;
        view.backgroundColor = colorArray[i+1];
        view.layer.cornerRadius = 5;
        view.layer.transform = CATransform3DMakeScale(0, 0, 0);
        view.layer.masksToBounds = YES;
        [self.view addSubview:view];
        
        [viewsArray addObject:view];
    }
    
    UIButton *btr       = [UIButton buttonWithType:UIButtonTypeCustom];
    [btr setTitle:@"Test" forState:UIControlStateNormal];
    btr.titleLabel.font = [UIFont systemFontOfSize:18];
    [btr setBackgroundColor:[UIColor yellowColor]];
    btr.titleLabel.adjustsFontSizeToFitWidth = YES;
    [btr addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btr];
    [btr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(100, 30));
        make.bottom.equalTo(self.view).offset(- 40);
        make.centerX.equalTo(self.view);
    }];

}
#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件
- (IBAction)startAnimation:(id)sender
{
    for (int i = 0;i<viewsArray.count; i++) {
        UIView *view = viewsArray[i];
        [view.layer addAnimation:[self createGroupAnimationWithDelay:i*0.5 withIndex:i] forKey:@"group"];
    }
}


#pragma mark - getters and setters
//初始化页面

@end
