//
//  MenuTableViewController.m
//  HJCarouselDemo
//
//  Created by haijiao on 15/8/20.
//  Copyright (c) 2015年 olinone. All rights reserved.
//

#import "MenuTableViewController.h"
#import "YunisCollectionViewController.h"
#import "YunisLayout.h"
#import "YunisLearnViewController.h"
@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"olinone";
    self.tableView.rowHeight = 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 6) {
        YunisLearnViewController *l = [[YunisLearnViewController alloc] init];
        [self.navigationController pushViewController:l animated:YES];
        return;
    }
    
    YunisLayout *layout = nil;
    switch (indexPath.row) {
        case 0:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimLinear];
            layout.visibleCount = 5;
            break;
        case 1:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimRotary];
            break;
        case 2:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimCarousel];
            break;
        case 3:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimCarousel1];
            break;
        case 4:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimCoverFlow];
            break;
        case 5:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimLinear];
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            break;
        case 6:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimCoverFlow];
            break;
        default:
            layout = [[YunisLayout alloc] initWithAnim:HJCarouselAnimLinear];
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            break;
    }

    layout.itemSize = CGSizeMake(100, 100);
    YunisCollectionViewController *vc = [[YunisCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    vc.title = cell.textLabel.text;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Linear";
            break;
        case 1:
            cell.textLabel.text = @"Rotary";
            break;
        case 2:
            cell.textLabel.text = @"Carousel";
            break;
        case 3:
            cell.textLabel.text = @"Carousel1";
            break;
        case 4:
            cell.textLabel.text = @"CoverFlow";
            break;
        case 5:
        {
            cell.textLabel.text = @"Horizontal";

            break;
        }
        case 6:
        {
            cell.textLabel.text = @"Test";

            break;
        }
        default:
            break;
    }
    return cell;
}

@end
