//
//  FollowWuYanZhu.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/6.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowWuYanZhu : UIViewController
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *traillingConstraints;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraints;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraints;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraints;
@property (weak, nonatomic) IBOutlet UIButton *one;

@property (weak, nonatomic) IBOutlet UIView *coloreView;

@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIView *buttonContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btrTopConstraints;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btrTwoConstraints;

@end
