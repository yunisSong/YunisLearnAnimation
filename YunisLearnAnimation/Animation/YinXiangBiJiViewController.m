//
//  YinXiangBiJiViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/18.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YinXiangBiJiViewController.h"
#import "YXBJCellLayout.h"
#import "YXBJCollectionViewCell.h"
#import "NewYXBJDetailViewController.h"
#import "YXBJTransition.h"

#import "YunisLearnDynamicFlowLayout.h"
@interface YinXiangBiJiViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectView;
@property(nonatomic,strong)YXBJTransition *customTransition;
@end

@implementation YinXiangBiJiViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectView];
    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(64);
        make.left.right.bottom.equalTo(self.view);
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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 30;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YXBJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YXBJCollectionViewCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewYXBJDetailViewController *t = [[NewYXBJDetailViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:t];
    
    t.transitioningDelegate = self.customTransition;
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面
- (UICollectionView *)collectView{
    if (_collectView == nil) {
        _collectView = ({
            UICollectionView *collectionView                        = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[YXBJCellLayout alloc] init]];
            collectionView.delegate               = self;
            collectionView.dataSource             = self;
            collectionView.backgroundColor        = [UIColor clearColor];
//            collectionView.alwaysBounceHorizontal = YES;
//            collectionView.scrollEnabled          = YES;
            collectionView.indicatorStyle         = UIScrollViewIndicatorStyleWhite;
            [collectionView registerNib:[UINib nibWithNibName:@"YXBJCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"YXBJCollectionViewCell"];
//            [collectionView registerClass:[NSStringFromClass(@"<#类名称#>") class] forCellWithReuseIdentifier:@"<#标识符#>"];
            collectionView;
        });
    }
    
    return _collectView;
}
@end
