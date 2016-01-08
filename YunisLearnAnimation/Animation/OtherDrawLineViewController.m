//
//  OtherDrawLineViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "OtherDrawLineViewController.h"
#import "BaseEditView.h"
#import "DrawLineView.h"

@interface OtherDrawLineViewController ()

@end

@implementation OtherDrawLineViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    
    //init editView
    [self initializationEditView];
    //init DrawView
    [self initializationDrawView];
    
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
- (void)initializationEditView
{
    BaseEditView *editView = [[BaseEditView alloc] initWithFrame:CGRectZero editCallBack:^(DrawEditType editType) {
        switch (editType) {
            case DrawEditType_undo: {
                NSLog(@"撤销");
                break;
            }
            case DrawEditType_redo: {
                NSLog(@"恢复");
                break;
            }
            case DrawEditType_cleanAll: {
                NSLog(@"清空");
                break;
            }
            default: {
                break;
            }
        }
    }];
    editView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:editView];
    [editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(70);
        make.height.equalTo(70);
    }];
}
- (void)initializationDrawView
{
    DrawLineView *drawView = [[DrawLineView alloc] init];
    [self.view addSubview:drawView];
    [drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(140);
    }];
}
#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面

@end
