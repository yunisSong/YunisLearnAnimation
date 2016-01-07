//
//  ViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/6.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tab;
@property(nonatomic,strong)NSArray *sourceArray;
@property(nonatomic,strong)NSArray *ctrSourceArray;
@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
//
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
#pragma mark -
#pragma mark Table View DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArray.count;
//    return self.sourceArray.count;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return <#sectionViewHeigth#>;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return <#sectionHeaderView#>;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"fenzhongcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
    }
//    [cell.contentView removeAllSubviews];
    cell.textLabel.text = self.sourceArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    Class s = NSClassFromString(self.ctrSourceArray[indexPath.row]);
//    [self.navigationController pushViewController:[[s alloc] init ] animated:YES];
    if (indexPath.row >= self.ctrSourceArray.count) {
        return;
    }
    Class cls = NSClassFromString(self.ctrSourceArray[indexPath.row]);
    
    if ( cls )
    {
        UIViewController *ctr = [cls new];
        ctr.title = self.ctrSourceArray[indexPath.row];
        [self.navigationController pushViewController:ctr animated:YES];

    }

    
    
    
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面
- (NSArray *)sourceArray{
    if (_sourceArray == nil) {
        _sourceArray = ({
            NSArray *arr = @[@"点击圆圈动画",@"模仿彦祖写的动画",@"简单的画线",@"转场动画合集"];
            arr;
        });
    }
    
    return _sourceArray;
}

- (NSArray *)ctrSourceArray{
    if (_ctrSourceArray == nil) {
        _ctrSourceArray = ({
            NSArray *arr = @[@"CircleSpreadTransition",@"FollowWuYanZhu",@"DrawLineViewController"];
            arr;
        });
    }
    
    return _ctrSourceArray;
}
@end
