//
//  DrawLineViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "DrawLineViewController.h"
#import "DramVIew.h"
@interface DrawLineViewController ()
@property (weak, nonatomic) IBOutlet DramVIew *drawView;

@end

@implementation DrawLineViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面

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
- (void)loadSettingButton
{
    UIButton *btr = ({
        UIButton *btr = [UIButton buttonWithType:0];
        [btr addTarget:self action:@selector(showSettingView) forControlEvents:UIControlEventTouchUpInside];
        btr.backgroundColor = [UIColor lightGrayColor];
        btr.frame = CGRectMake(0, 0, 70, 30);
        [btr setTitle:@"设置" forState:UIControlStateNormal];
        btr;
    });
    UIBarButtonItem *rB = [[UIBarButtonItem alloc] initWithCustomView:btr];
    self.navigationItem.rightBarButtonItem = rB;
}
#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件
- (void)showSettingView
{
    
}


#pragma mark - getters and setters
//初始化页面

@end
