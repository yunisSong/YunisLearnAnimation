//
//  NewYXBJDetailViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/18.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "NewYXBJDetailViewController.h"

@interface NewYXBJDetailViewController ()

@end

@implementation NewYXBJDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    [self allocnavBackBtr];
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
- (void)allocnavBackBtr{
    self.navigationItem.leftBarButtonItems = nil;
    UIButton *leftBtr = [UIButton buttonWithType:0];
    [leftBtr setBackgroundImage:[UIImage imageNamed:@"P_backNav"] forState:UIControlStateNormal];
    leftBtr.showsTouchWhenHighlighted = YES;
    leftBtr.backgroundColor = [UIColor redColor];
    [leftBtr addTarget:self action:@selector(leftNavItemClicek) forControlEvents:UIControlEventTouchUpInside];
    leftBtr.frame = CGRectMake(-20, 0, 25, 25);
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:leftBtr];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, left, nil];
    //    self.navigationItem.leftBarButtonItem = left;
}
#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件
- (void)leftNavItemClicek
{
    [self.view endEditing:YES];
    
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark - getters and setters
//初始化页面

@end
