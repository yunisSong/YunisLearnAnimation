//
//  TwoTransitionViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "TwoTransitionViewController.h"

@interface TwoTransitionViewController ()

@end

@implementation TwoTransitionViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    UIButton *pu = ({
        UIButton *btr       = [UIButton buttonWithType:UIButtonTypeCustom];
        [btr setTitle:@"Diss" forState:UIControlStateNormal];
        btr.titleLabel.font = [UIFont systemFontOfSize:18];
        [btr setBackgroundColor:[UIColor redColor]];
        btr.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btr addTarget:self action:@selector(diss) forControlEvents:UIControlEventTouchUpInside];
        
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

- (void)diss
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - getters and setters
//初始化页面
@end
