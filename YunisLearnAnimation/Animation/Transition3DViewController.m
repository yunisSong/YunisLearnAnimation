//
//  Transition3DViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "Transition3DViewController.h"
#import "TwoTransitionViewController.h"
#import "Transion3DDiss.h"
#import "Transion3DPush.h"
#import "DissInteractiveTransition.h"
@interface Transition3DViewController ()<UIViewControllerTransitioningDelegate>
{
    DissInteractiveTransition *popInteractive;
}
@end

@implementation Transition3DViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
    
    UIImageView *bgImage = ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4.jpg"]];
        imageView.userInteractionEnabled = YES;
        imageView;
    });
    
    bgImage.frame = self.view.bounds;

    [self.view addSubview:bgImage];
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIButton *pu = ({
        UIButton *btr       = [UIButton buttonWithType:UIButtonTypeCustom];
        [btr setTitle:@"Push" forState:UIControlStateNormal];
        btr.titleLabel.font = [UIFont systemFontOfSize:18];
        [btr setBackgroundColor:[UIColor clearColor]];
        btr.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btr addTarget:self action:@selector(pushVIewCtr) forControlEvents:UIControlEventTouchUpInside];
        
        btr;
    });
    pu.frame = CGRectMake(0, 0, 100, 40);
    pu.center = self.view.center;

    [self.view addSubview:pu];
    
    [pu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(CGSizeMake(100, 40));
    }];
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
//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
//{
//    return [[Transion3DDiss alloc] init];
//}
//
//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
//{
//    return [[Transion3DPush alloc] init];
//}

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
//{
//    return nil;
//}
//
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
     return popInteractive.interacting ? popInteractive : nil;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[Transion3DPush alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[Transion3DDiss alloc] init];
}


#pragma mark - Event Response
//点击响应事件
- (void)pushVIewCtr
{
    TwoTransitionViewController *two = [[TwoTransitionViewController alloc] init];
    two.transitioningDelegate = self;
    popInteractive = [[DissInteractiveTransition alloc] init];
    [popInteractive addPopGesture:two];
    [self presentViewController:two animated:YES completion:^{
        
    }];
}


#pragma mark - getters and setters
//初始化页面

@end
