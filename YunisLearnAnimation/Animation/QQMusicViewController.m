//
//  QQMusicViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "QQMusicViewController.h"
#import "InfoViewController.h"
#import "TransitionFromFirstToSecond.h"
#import "TransitionFromSecondToFirst.h"
@interface QQMusicViewController ()<UIViewControllerTransitioningDelegate>


@end

@implementation QQMusicViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    
    self.imageView.image = [UIImage imageNamed:@"wuyanzu.jpg"];
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showInfoView)];
    tap.cancelsTouchesInView = NO;//设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    [self.imageView addGestureRecognizer:tap];
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
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionFromFirstToSecond alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[TransitionFromSecondToFirst alloc] init];
}
#pragma mark - Event Response
//点击响应事件

- (void)showInfoView
{
//    SecondViewController *sec = [story instantiateViewControllerWithIdentifier:@"secondStory"];
//    sec.transitioningDelegate = self;
//    [self presentViewController:sec animated:YES completion:nil];
    
    InfoViewController *infoCtr = [[InfoViewController alloc] init];
    
    infoCtr.transitioningDelegate = self;
    [self presentViewController:infoCtr animated:YES completion:^{
        
    }];
}

#pragma mark - getters and setters
//初始化页面

@end
