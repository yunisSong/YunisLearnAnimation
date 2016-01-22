//
//  SystemAnimationViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/14.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "SystemAnimationViewController.h"

@interface SystemAnimationViewController ()
{
    float ssy;
}
@property (weak, nonatomic) IBOutlet UIImageView *demoImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Y_heigth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Y_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Y_top;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Y_centerX;

@end

@implementation SystemAnimationViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面

//    [self.demoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(self.view).offset(10);
//        make.size.equalTo(CGSizeMake(100, 100));
//    }];
    ssy = -1.5;
    [self performSelector:@selector(drawYunisCenter) withObject:nil afterDelay:1];
    
    
//    self.demoImageView.layer.anchorPoint = CGPointMake(0.5, 1.0);
    
    self.Y_top.constant = 100;


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
- (void)diss{
    UIView *snapshot = [self.demoImageView snapshotViewAfterScreenUpdates:NO];
    snapshot.frame = self.demoImageView .frame;
    [self.view  addSubview:snapshot];
    [self.view  bringSubviewToFront:snapshot];
    
    //Set the snapshot's anchor point for CG transform
    CGRect originalFrame = snapshot.frame;
    snapshot.layer.anchorPoint = CGPointMake(0.0, 1.0);
    snapshot.frame = originalFrame;
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    [UIView animateKeyframesWithDuration:1.75 delay:1 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.75 animations:^{
            //90 degrees (clockwise)
            snapshot.transform = CGAffineTransformMakeRotation(M_PI * -1);
        }];
//        [UIView addKeyframeWithRelativeStartTime:0.15 relativeDuration:0.10 animations:^{
//            //180 degrees
//            snapshot.transform = CGAffineTransformMakeRotation(M_PI * 1.0);
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.20 animations:^{
//            //Swing past, ~225 degrees
//            snapshot.transform = CGAffineTransformMakeRotation(M_PI * 1.3);
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.45 relativeDuration:0.20 animations:^{
//            //Swing back, ~140 degrees
//            snapshot.transform = CGAffineTransformMakeRotation(M_PI * 0.8);
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.65 relativeDuration:0.35 animations:^{
//            //Spin and fall off the corner
//            //Fade out the cover view since it is the last step
//            CGAffineTransform shift = CGAffineTransformMakeTranslation(180.0, 0.0);
//            CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI * 0.3);
//            snapshot.transform = CGAffineTransformConcat(shift, rotate);
//            //            _coverView.alpha = 0.0;
//        }];
    } completion:^(BOOL finished) {
        //        [_coverView removeFromSuperview];
        //        [containerView removeConstraints:_constraints];
        //        [transitionContext completeTransition:YES];
        [snapshot removeFromSuperview];
        self.view.backgroundColor = [UIColor whiteColor];

    }];
}
#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件
- (IBAction)changeTransform:(id)sender {
//     self.demoImageView.transform = CGAffineTransformMakeRotation(M_PI * ssy );
//    ssy += .2;
//
//    NSLog(@"ssy == %f",ssy);
    
//    CGAffineTransformMake
    //通过矩阵运算后的坐标[aX + cY + tx   bX + dY + ty  1]，我们对比一下可知：
    /*
     通过矩阵运算后的坐标[aX + cY + tx   bX + dY + ty  1]，我们对比一下可知：
     第一种：设a=d=1, b=c=0.
     [aX + cY + tx   bX + dY + ty  1] = [X  + tx  Y + ty  1];
     可见，这个时候，坐标是按照向量（tx，ty）进行平移，其实这也就是函数
     CGAffineTransform CGAffineMakeTranslation(CGFloat tx,CGFloat ty)的计算原理。
     第二种：设b=c=tx=ty=0.
     [aX + cY + tx   bX + dY + ty  1] = [aX    dY   1];
     可见，这个时候，坐标X按照a进行缩放，Y按照d进行缩放，a，d就是X，Y的比例系数，其实这也就是函数
     CGAffineTransform CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)的计算原理。a对应于sx，d对应于sy。
     第三种：设tx=ty=0，a=cosɵ，b=sinɵ，c=-sinɵ，d=cosɵ。
     [aX + cY + tx   bX + dY + ty  1] = [Xcosɵ - Ysinɵ    Xsinɵ + Ycosɵ  1] ;
     可见，这个时候，ɵ就是旋转的角度，逆时针为正，顺时针为负。其实这也就是函数
     CGAffineTransform CGAffineTransformMakeRotation(CGFloat angle)的计算原理。angle即ɵ的弧度表示。
     */
    
    CGAffineTransform testTransform;
    
//    testTransform = CGAffineTransformMake(1, 0, 0, 1, 100, 100);
//    
//    
//    //位移操作
    testTransform = CGAffineTransformMakeTranslation(200, 300);
//
//    //比例操作
//     testTransform = CGAffineTransformMakeScale(.2, .2);
//    testTransform = CGAffineTransformMakeScale(-1.0, 1.0);//水平翻转
//    testTransform = CGAffineTransformMakeScale(1.0,-1.0);//垂直翻转
//
    
    //角度操作
    //向右旋转90度
//    testTransform = CGAffineTransformMakeRotation(M_PI * 1);
    
    //倒立  向右旋转180度  M_PI *  3 向左旋转180度
//    testTransform = CGAffineTransformMakeRotation(M_PI *  -3 );
    
/*
            1.5,3.5,5.5  A
            ^
            |
            |
D           |O
  1 --------|------->  0 2,4  B
            |
            |
            |
 
            0.5,2.5,4.5  C
 
 
 如果从OA 旋转到OB 旋转的角度就是  0 - 1.5  或者 2- 1.5  或者 2- 3.5 等等 这是向右旋转 测试得到一个结论
 testTransform = CGAffineTransformMakeRotation(M_PI * - 1.5);
 testTransform = CGAffineTransformMakeRotation(M_PI * 0.5);
 testTransform = CGAffineTransformMakeRotation(M_PI * 2.5);
 
 
 同理OA旋转到OD 旋转的角度是 1 - 1.5 或者 1- 3.5  或者 3- 1.5  或者 3 - 5，5等等  这是向左旋转
 testTransform = CGAffineTransformMakeRotation(M_PI * -.5);  +-2的关系
 testTransform = CGAffineTransformMakeRotation(M_PI * -2.5);
 testTransform = CGAffineTransformMakeRotation(M_PI * 1.5);
 
 
 那如果从OA到OC呢  这个旋转方向怎么控制？
 
 testTransform = CGAffineTransformMakeRotation(M_PI * 1);向左旋转  囧 都是向左旋转！！！！
 只能拆分。。。FUCK，希望不是我脑子抽抽测试错了
 
 
 */
 
    [UIView animateWithDuration:.5 animations:^{
        self.demoImageView.transform = testTransform;
        
    }];
    
}



- (void)drawYunisCenter
{
    //试试画圆形遮罩
    UIBezierPath *pacmanOpenPath;
    
    CGFloat radius = 40.0f;
    CGPoint arcCenter = CGPointMake(radius, radius);
    
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:arcCenter
                      
                                                   radius:radius
                      
                                               startAngle: 0
                      
                                                 endAngle: 3 * M_PI / 2
                      
                                                clockwise:YES];
    
    NSMutableArray *colors = nil;
    if (colors == nil) {
        colors = [[NSMutableArray alloc] initWithCapacity:3];
        UIColor *color = nil;
        color = [UIColor blueColor];
        [colors addObject:(id)[color CGColor]];
        color = [UIColor whiteColor];
        [colors addObject:(id)[color CGColor]];
    }
    
    //CAGradientLayer 通过指定颜色，一个开始的点，一个结束的点和梯度类型使你能够简单的在层上绘制一个梯度，效果就是颜色渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    //在指定的color中绘制渐变层
    [gradientLayer setColors:colors];
    gradientLayer.frame = CGRectMake(20, 300, 100, 100);
    
    //在 (20, 20, 100, 100) 位置绘制一个颜色渐变的层
    [self.view.layer addSublayer:gradientLayer];
    
    //CAShapeLayer 通过创建一个核心图像路径，并且分配给CAShaperLayer的path属性，从而为需要的形状指定路径。 可以指定填充路径之外的颜色，路径内的颜色，绘制路径，线宽，是否圆角等等
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.fillMode = kCAFillRuleEvenOdd;
    
    shapeLayer.path = pacmanOpenPath.CGPath;
    
    shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
    
    shapeLayer.lineWidth = 10.0f;
    
    shapeLayer.lineJoin = kCALineJoinRound;
    
    //当你使用时，奇数的值被绘制，然后偶数的值不被绘制。例如，如果你指定5，10，15，20，笔画将会有5个单元被绘制，接下来10不被绘制，15被绘制，20不被绘制。这种模式可以使用你喜欢的间隙来指定。请记住：奇数等于绘制而偶数不绘制。这些单元是被放在了一个放置NSNumber对象的NSArray的数组中，如果你在NSSArray中放置其他东西，会带来一些异常的效果。
    //    [shapeLayer setLineDashPattern:
    //    [NSArray arrayWithObjects:[NSNumber numberWithInt:20], [NSNumber numberWithInt:15],
    //     nil]];
    
    
    shapeLayer.lineCap = kCALineCapRound;
    
    shapeLayer.frame = CGRectMake(10, 10, 80, 80);
    
    //所有继承于CALayer的核心动画层都有一个属性叫做mask.这个属性能够使你给层的所有内容做遮罩，除了层面罩中已经有的部分，它允许仅仅形状层绘制的部分显示那部分的图像。  我们将shapeLayer作为这个遮罩，显示出来的效果就是一个有着渐变填充色的圆弧
    gradientLayer.mask = shapeLayer;
    
    
    //最重要的显示内容已经有了，接下来就是让图层动起来，所以加一个旋转动画
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    spinAnimation.fromValue = [NSNumber numberWithInt:0];
    spinAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    spinAnimation.duration = 2;
    spinAnimation.repeatCount = 1;
    
    [shapeLayer addAnimation:spinAnimation forKey:@"shapeRotateAnimation"];
    
    //现在圆弧就能够旋转了，但是我们发现渐变色是固定的位置，感觉就像是固定的背景色，为了达到一种动态的渐变，所以给gradientLayer也加上旋转动画效果，这样就是一段旋转的有着渐变效果的圆弧
    [gradientLayer addAnimation:spinAnimation forKey:@"GradientRotateAniamtion"];
}

#pragma mark - getters and setters
//初始化页面

@end
