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
    [self performSelector:@selector(diss) withObject:nil afterDelay:1];
    
    
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



#pragma mark - getters and setters
//初始化页面

@end
