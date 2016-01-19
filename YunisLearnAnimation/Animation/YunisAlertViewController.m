//
//  YunisAlertViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/19.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YunisAlertViewController.h"
#import "UIImage+ImageEffects.h"
#import "UIImageView+Reflect.h"
#import "YunisTopShowHUD.h"
#import "UIColor+randomColor.h"
@interface YunisAlertViewController ()

@end

@implementation YunisAlertViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    self.view.backgroundColor = [UIColor randomColor];
    
    UIImageView *imageView = ({
        UIImage * t = [UIImage imageNamed:@"wuyanzu.jpg"];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:t];
        imageView.userInteractionEnabled = YES;
        imageView;
    });
    
    [self.view addSubview:imageView];
    
    imageView.frame = CGRectMake(0, 64, 200, 300);
    [imageView reflect];
    
    UIButton *btr = ({
        UIButton *btr       = [UIButton buttonWithType:UIButtonTypeCustom];
        btr.titleLabel.font = [UIFont systemFontOfSize:18];
        [btr setBackgroundColor:[UIColor randomColor]];
        btr.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btr addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
        btr.frame = CGRectMake(0, 0, 50, 60);
        btr.center = self.view.center;
        btr;
    });
    
    [self.view addSubview:btr];

    
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
- (void)showAlert
{
//    YunisTopShowHUD *t = [[YunisTopShowHUD alloc] initWithFrame:self.view.bounds];
    YunisTopShowHUD *t = [YunisTopShowHUD showWithType:YunisTopHUDShowWithBlurLayer];

    [t show];
//    [t diss];
}


#pragma mark - getters and setters
//初始化页面

@end
