//
//  DissInteractiveTransition.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/12.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DissInteractiveTransition : UIPercentDrivenInteractiveTransition
@property(nonatomic,assign)BOOL interacting;
-(void)addPopGesture:(UIViewController *)viewController;
@end
