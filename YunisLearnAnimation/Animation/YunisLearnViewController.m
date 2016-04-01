//
//  YunisLearnViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/3/29.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YunisLearnViewController.h"
#import "YunisCollectionLayout.h"
#import "TestCollectionViewCell.h"
#import "TestFlowLayout.h"
@interface YunisLearnViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray *sourceArray;
}
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation YunisLearnViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


//cell num
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 60;
}

//cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestCollectionViewCell" forIndexPath:indexPath];
    cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", indexPath.row % 9  + 1]];
    NSLog(@"indexPath.row  9 == %ld",indexPath.row % 9);
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    TestCollectionViewCell *cell = (TestCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [UIView animateWithDuration:.3 animations:^{
//        cell.transform = CGAffineTransformMakeScale(1.2, 1.2);
//    } completion:^(BOOL finished) {
//        
//    }];
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    TestCollectionViewCell *cell = (TestCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [UIView animateWithDuration:.3 animations:^{
//        cell.transform = CGAffineTransformMakeScale(1, 1);
//    } completion:^(BOOL finished) {
//        
//    }];
//}



#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        _collectionView = ({
     
            
            UICollectionView *collectionView      = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[YunisCollectionLayout alloc] init]];
            collectionView.delegate               = self;
            collectionView.dataSource             = self;
            collectionView.backgroundColor        = [UIColor redColor];
            collectionView.indicatorStyle         = UIScrollViewIndicatorStyleWhite;
            [collectionView registerNib:[UINib nibWithNibName:@"TestCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:@"TestCollectionViewCell"];
            collectionView;
        });
    }
    
    return _collectionView;
}
@end
