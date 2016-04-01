//
//  TestFlowLayout.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/3/29.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "TestFlowLayout.h"

@implementation TestFlowLayout
/*
 
 @property (nonatomic) CGFloat minimumLineSpacing;
 @property (nonatomic) CGFloat minimumInteritemSpacing;
 @property (nonatomic) CGSize itemSize;
 @property (nonatomic) CGSize estimatedItemSize NS_AVAILABLE_IOS(8_0); // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
 @property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical
 @property (nonatomic) CGSize headerReferenceSize;
 @property (nonatomic) CGSize footerReferenceSize;
 @property (nonatomic) UIEdgeInsets sectionInset;
 
 // Set these properties to YES to get headers that pin to the top of the screen and footers that pin to the bottom while scrolling (similar to UITableView).
 @property (nonatomic) BOOL sectionHeadersPinToVisibleBounds NS_AVAILABLE_IOS(9_0);
 @property (nonatomic) BOOL sectionFootersPinToVisibleBounds NS_AVAILABLE_IOS(9_0);
 */
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.minimumLineSpacing = 1.f;
//        self.minimumInteritemSpacing = 3.f;
        self.itemSize = CGSizeMake(100, 100);
//        self.estimatedItemSize = CGSizeMake(120, 120);
//        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.headerReferenceSize = CGSizeMake(100, 40);
        self.footerReferenceSize = CGSizeMake(100, 60);
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
//        self.sectionHeadersPinToVisibleBounds = YES;
//        self.sectionFootersPinToVisibleBounds = YES;
    }
    return self;
}


@end
