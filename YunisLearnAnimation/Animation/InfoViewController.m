//
//  InfoViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.secondImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wuyanzu.jpg"]];
    self.secondImageview.frame = CGRectMake(0, 0, 200, 200);
    self.secondImageview.center = self.view.center;
    self.secondImageview.userInteractionEnabled = YES;
    self.secondImageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_secondImageview];
    
//    [self.secondImageview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.equalTo(CGSizeMake(200, 200));
//    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissFirst)];
    tap.cancelsTouchesInView = NO;//设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    [self.secondImageview addGestureRecognizer:tap];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
    
    self.secondImageview.layer.masksToBounds = YES;
    self.secondImageview.layer.cornerRadius = 100;
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

- (void)dismissFirst
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - getters and setters
//初始化页面

@end
