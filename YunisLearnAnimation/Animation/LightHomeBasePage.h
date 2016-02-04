//
//  LightHomeBasePage.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/26.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,sliderAnimationType) {
    sliderAnimationType_UpTonArrow,
    sliderAnimationType_DownEnlarge,
};
@interface LightHomeBasePage : UIView
+ (instancetype)showMaskHeardViewWithImage:(UIImage *)image maskType:(sliderAnimationType )type tableView:(UITableView *)tab;
@end
