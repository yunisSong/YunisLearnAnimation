//
//  RoundPushNextViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 6/24/16.
//  Copyright © 2016 yunis. All rights reserved.
//

#import "RoundPushNextViewController.h"
#import "RoundPOPAnimation.h"
@interface RoundPushNextViewController ()<UINavigationControllerDelegate>
{
    UIPercentDrivenInteractiveTransition *percentTransition;

}
@property (nonatomic,strong)UIImageView *bgImageView;

@property(nonatomic,strong)UIButton *nextbutton;

@end

@implementation RoundPushNextViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.view addSubview:self.nextbutton];
    [self.nextbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 50));
        make.top.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(- 100);
    }];
    
    UIScreenEdgePanGestureRecognizer *edgeGes = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePan:)];
    edgeGes.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgeGes];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
    self.navigationController.delegate = self;

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
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{

    return [RoundPOPAnimation new];
}
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return percentTransition;
}
#pragma mark - Event Response
//点击响应事件

- (void)pushToNextView
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)edgePan:(UIPanGestureRecognizer *)recognizer{
    CGFloat per = [recognizer translationInView:self.view].x / (self.view.bounds.size.width);
    per = MIN(1.0,(MAX(0.0, per)));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        percentTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        [self.navigationController popViewControllerAnimated:YES];
    }else if (recognizer.state == UIGestureRecognizerStateChanged){
        [percentTransition updateInteractiveTransition:per];
    }else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled){
        if (per > 0.3) {
            [percentTransition finishInteractiveTransition];
        }else{
            [percentTransition cancelInteractiveTransition];
        }
        percentTransition = nil;
    }
}

#pragma mark - getters and setters
//初始化页面
- (UIButton *)nextbutton{
    if (_nextbutton == nil) {
        _nextbutton = ({
            UIButton *btr       = [UIButton buttonWithType:UIButtonTypeCustom];
            [btr setTitle:@"test" forState:UIControlStateNormal];
            btr.titleLabel.font = [UIFont systemFontOfSize:18];
            [btr setBackgroundColor:[UIColor greenColor]];
            btr.titleLabel.adjustsFontSizeToFitWidth = YES;
            [btr addTarget:self action:@selector(pushToNextView) forControlEvents:UIControlEventTouchUpInside];
            
            btr;
        });
    }
    
    return _nextbutton;
}
- (UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        _bgImageView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RoundPust2"]];
            imageView.userInteractionEnabled = YES;
            imageView;
        });
    }
    
    return _bgImageView;
}
@end
