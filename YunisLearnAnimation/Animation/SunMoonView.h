//
//  SunMoonView.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/27.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, SunMoonType) {
    SunMoonType_sun,
    SunMoonType_moon,
};
@interface SunMoonView : UIView

- (instancetype)initWithType:(SunMoonType)type;
- (void)startAnimation;
- (void)stopAnimation;
@end
