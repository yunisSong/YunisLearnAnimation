//
//  ModuleLayoutAttributes.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/3/30.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModuleLayoutAttributes : UICollectionViewLayoutAttributes
// whether header view (ModuleTypeHeader class) should align label left or center (default = left)
@property (nonatomic, assign) NSTextAlignment headerTextAlignment;

// shadow opacity for the shadow on the Picture in ShelfItemCell (default = 0.5)
@property (nonatomic, assign) CGFloat shadowOpacity;
@end
