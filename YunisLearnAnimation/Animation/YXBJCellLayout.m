//
//  YXBJCellLayout.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/18.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YXBJCellLayout.h"

static const float horizonallyPadding = 10;
static const float verticallyPadding = 10;
//static const CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//static const float screenHeight = [UIScreen mainScreen].bounds.size.height;
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define  cellWidth  SCREEN_WIDTH - 2 * horizonallyPadding
static const float cellHeight = 45;
static const float SpringFactor = 10;


@implementation YXBJCellLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(cellWidth, cellHeight);
        self.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, verticallyPadding);
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.itemSize = CGSizeMake(cellWidth, cellHeight);
        self.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, verticallyPadding);
    }
    return self;
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    float offsetY = self.collectionView.contentOffset.y;
    NSMutableArray *attrsArray = [NSMutableArray arrayWithArray:[super layoutAttributesForElementsInRect:rect] ] ;
    
    float collectionViewFrameHeight = self.collectionView.frame.size.height;
    float collectionViewContentHeight = self.collectionView.contentSize.height;
    float ScrollViewContentInsetBottom = self.collectionView.contentInset.bottom;
    float bottomOffset = offsetY + collectionViewFrameHeight - collectionViewContentHeight - ScrollViewContentInsetBottom;
    float numOfItems = [self.collectionView numberOfSections];
    
//    for attr:UICollectionViewLayoutAttributes in attrsArray! {
//        if (attr.representedElementCategory == UICollectionElementCategory.Cell) {
//            var cellRect = attr.frame;
//            if offsetY <= 0 {
//                let distance = fabs(offsetY) / SpringFactor;
//                cellRect.origin.y += offsetY + distance * CGFloat(attr.indexPath.section + 1);
//            }else if bottomOffset > 0 {
//                let distance = bottomOffset / SpringFactor;
//                cellRect.origin.y += bottomOffset - distance *
//                CGFloat(numOfItems - attr.indexPath.section)
//            }
//            attr.frame = cellRect;
//        }
//    }
    [attrsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UICollectionViewLayoutAttributes * t = obj;
        if (t.representedElementCategory == UICollectionElementCategoryCell) {
            CGRect cellRect = t.frame;
            if (offsetY <= 0) {
                float distance = fabs(offsetY) / SpringFactor;
                cellRect.origin.y += offsetY + distance * (t.indexPath.section + 1);
            }else if (bottomOffset > 0)
            {
                float distance =    bottomOffset / SpringFactor;
                cellRect.origin.y += bottomOffset - distance *(numOfItems - t.indexPath.section);
            }
            
            t.frame = cellRect;
            
        }
    }];
    
    return attrsArray;
}
@end
