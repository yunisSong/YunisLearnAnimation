//
//  YXBJTransition.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/18.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "BaseTransitionObject.h"
#import "YXBJCollectionViewCell.h"
@interface YXBJTransition : BaseTransitionObject
{
    BOOL isPresent;
}
@property(nonatomic,strong)YXBJCollectionViewCell *selectCell;
@property(nonatomic,strong)NSArray<YXBJCollectionViewCell *>* visibleCells;
@property(nonatomic)CGRect originFrame;
@property(nonatomic)CGRect finalFrame;
@property(nonatomic,strong)UIViewController *panViewController;
@property(nonatomic,strong)UIViewController *listViewController;
@property(nonatomic,strong)UIPercentDrivenInteractiveTransition *interactionController;
@end
