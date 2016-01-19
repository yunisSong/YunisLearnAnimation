//
//  YunisTopShowHUD.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/19.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,YunisTopHUDShowType) {
    YunisTopHUDShowWithBlurLayer,
    YunisTopHUDShowWithCleanLayer,
};
@interface YunisTopShowHUD : UIView
- (void)show;
- (void)diss;
+ (instancetype)showWithType:(YunisTopHUDShowType)type;
@end
