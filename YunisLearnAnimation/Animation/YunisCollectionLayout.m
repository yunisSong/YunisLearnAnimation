//
//  YunisCollectionLayout.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/3/29.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YunisCollectionLayout.h"
#import "ModuleLayoutAttributes.h"
#define ITEM_SIZE 170

@interface YunisCollectionLayout()

@property (nonatomic, assign) CGSize pageSize;
@property (nonatomic, assign) CGSize contentSize;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, strong) NSArray *cellCounts;
@property (nonatomic, strong) NSArray *pageRects;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, strong) NSMutableArray *deleteIndexPaths;
@property (nonatomic, strong) NSMutableArray *insertIndexPaths;

@end
@implementation YunisCollectionLayout
//-(void)prepareLayout
//{
//    [super prepareLayout];
//    
//    self.pageSize = self.collectionView.bounds.size;
//    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
//    CGFloat scaleFactor = iPad? 1 : 0.5;
//    _radius = (MIN((self.pageSize.width - (ITEM_SIZE * scaleFactor)), (self.pageSize.height - (ITEM_SIZE*scaleFactor)) * 1.2)) / 2 - 5;
//    
//    self.pageCount = [self.collectionView numberOfSections];
//    
//    NSMutableArray *counts = [NSMutableArray arrayWithCapacity:self.pageCount];
//    NSMutableArray *rects = [NSMutableArray arrayWithCapacity:self.pageCount];
//    for (int section = 0; section < self.pageCount; section++)
//    {
//        [counts addObject:@([self.collectionView numberOfItemsInSection:section])];
//        [rects addObject:[NSValue valueWithCGRect:(CGRect){{section * self.pageSize.width, 0}, self.pageSize}]];
//    }
//    self.cellCounts = [NSArray arrayWithArray:counts];
//    self.pageRects = [NSArray arrayWithArray:rects];
//    
//    self.contentSize = CGSizeMake(self.pageSize.width * self.pageCount, self.pageSize.height);
//}
//
//-(CGSize)collectionViewContentSize
//{
//    return self.contentSize;
//}
//
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    return !CGSizeEqualToSize(self.pageSize, newBounds.size);
//}
//
//+ (Class)layoutAttributesClass
//{
//    return [ModuleLayoutAttributes class];
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
//{
//    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
//    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
//    int count = [self cellCountForSection:path.section];
//    CGFloat denominator = MAX(count - 1, 1);
//    CGRect pageRect = [self.pageRects[path.section] CGRectValue];
//    attributes.center = CGPointMake(CGRectGetMidX(pageRect) + (_radius * path.item / denominator) * cosf(3 * path.item * M_PI / denominator), CGRectGetMidY(pageRect) + (_radius * path.item / denominator) * sinf(3 * path.item * M_PI / denominator));
//    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
//    CGFloat scaleFactor = iPad? 1 : 0.5;
//    CGFloat scale = (0.25 + 0.75 * (path.item / denominator)) * scaleFactor;
//    attributes.transform3D = CATransform3DMakeScale(scale, scale, 1);
//    return attributes;
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    ModuleLayoutAttributes *attributes = [ModuleLayoutAttributes layoutAttributesForSupplementaryViewOfKind:kind withIndexPath:indexPath];
//    CGRect pageRect = [self.pageRects[indexPath.section] CGRectValue];
//    attributes.size = CGSizeMake(pageRect.size.width, 50);
//    attributes.center = CGPointMake(CGRectGetMidX(pageRect), 35);
//    attributes.headerTextAlignment = NSTextAlignmentCenter;
//    return attributes;
//}
//
//- (int)cellCountForSection:(NSInteger)section
//{
//    NSNumber *count = self.cellCounts[section];
//    return [count intValue];
//}
//
//-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    int page = 0;
//    NSMutableArray* attributes = [NSMutableArray array];
//    for (NSValue *pageRect in self.pageRects)
//    {
//        if (CGRectIntersectsRect(rect, pageRect.CGRectValue))
//        {
//            int cellCount = [self cellCountForSection:page];
//            for (int i = 0; i < cellCount; i++) {
//                NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:page];
//                [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
//            }
//            
//            // add header
//            [attributes addObject:[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:page]]];
//        }
//        
//        page++;
//    }
//    
//    return attributes;
//}
//
//// Not necessary because I just decided to go with UIScrollView.pagingEnabled = YES instead
///*- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
// {
// int closestPage = roundf(proposedContentOffset.x / self.pageSize.width);
// if (closestPage < 0)
// closestPage = 0;
// if (closestPage >= self.pageCount)
// closestPage = self.pageCount - 1;
// 
// return CGPointMake(closestPage * self.pageSize.width, proposedContentOffset.y);
// }*/
//
//- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems
//{
//    [super prepareForCollectionViewUpdates:updateItems];
//    
//    self.deleteIndexPaths = [NSMutableArray array];
//    self.insertIndexPaths = [NSMutableArray array];
//    for (UICollectionViewUpdateItem *update in updateItems)
//    {
//        if (update.updateAction == UICollectionUpdateActionDelete)
//        {
//            [self.deleteIndexPaths addObject:update.indexPathBeforeUpdate];
//        }
//        else if (update.updateAction == UICollectionUpdateActionInsert)
//        {
//            [self.insertIndexPaths addObject:update.indexPathAfterUpdate];
//        }
//    }
//}
//
//- (void)finalizeCollectionViewUpdates
//{
//    [super finalizeCollectionViewUpdates];
//    self.deleteIndexPaths = nil;
//    self.insertIndexPaths = nil;
//}
//
//- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
//{
//    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
//    
//    if ([self.insertIndexPaths containsObject:itemIndexPath])
//    {
//        if (!attributes)
//            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//        
//        // Configure attributes ...
//        attributes.alpha = 0.0;
//        CGRect pageRect = [self.pageRects[itemIndexPath.section] CGRectValue];
//        attributes.center = CGPointMake(CGRectGetMidX(pageRect), CGRectGetMidY(pageRect));
//        attributes.transform3D = CATransform3DMakeScale(0.25, 0.25, 1);
//    }
//    
//    return attributes;
//}
//
//- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
//{
//    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
//    
//    if ([self.deleteIndexPaths containsObject:itemIndexPath])
//    {
//        if (!attributes)
//            attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
//        
//        // Configure attributes ...
//        attributes.alpha = 0.0;
//        attributes.center = CGPointMake(attributes.center.x, 0 - ITEM_SIZE);
//    }
//    
//    return attributes;
//}
















#define ACTIVE_DISTANCE 100
#define TRANSLATE_DISTANCE 100
#define ZOOM_FACTOR 0.3
#define FLOW_OFFSET 40

- (id)init
{
    self = [super init];
    if (self)
    {
        BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.itemSize = (CGSize){170, 200};
        self.sectionInset = UIEdgeInsetsMake(iPad? 225 : 0, 35, iPad? 225 : 0, 35);
        self.minimumLineSpacing = -51.0;
        self.minimumInteritemSpacing = 200;
        self.headerReferenceSize = iPad? (CGSize){50, 50} : (CGSize){43, 43};
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

+ (Class)layoutAttributesClass
{
    return [ModuleLayoutAttributes class];
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        if (attributes.representedElementCategory == UICollectionElementCategoryCell)
        {
            if (CGRectIntersectsRect(attributes.frame, rect)) {
                [self setCellAttributes:attributes forVisibleRect:visibleRect];
            }
        }
        else if (attributes.representedElementCategory == UICollectionElementCategorySupplementaryView)
        {
            [self setHeaderAttributes:attributes];
        }
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    [self setCellAttributes:attributes forVisibleRect:visibleRect];
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
    
    [self setHeaderAttributes:attributes];
    
    return attributes;
}

- (void)setHeaderAttributes:(UICollectionViewLayoutAttributes *)attributes
{
    attributes.transform3D = CATransform3DMakeRotation(-90 * M_PI / 180, 0, 0, 1);
    attributes.size = CGSizeMake(attributes.size.height, attributes.size.width);
    if ([attributes isKindOfClass:[ModuleLayoutAttributes class]])
    {
        ModuleLayoutAttributes *conferenceAttributes = (ModuleLayoutAttributes *)attributes;
        conferenceAttributes.headerTextAlignment = NSTextAlignmentCenter;
    }
}

- (void)setCellAttributes:(UICollectionViewLayoutAttributes *)attributes forVisibleRect:(CGRect)visibleRect
{
    CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
    CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
    BOOL isLeft = distance > 0;
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/(4.6777 * self.itemSize.width);
    
    if (ABS(distance) < ACTIVE_DISTANCE)
    {
        if (ABS(distance) < TRANSLATE_DISTANCE)
        {
            transform = CATransform3DTranslate(CATransform3DIdentity, (isLeft? - FLOW_OFFSET : FLOW_OFFSET)*ABS(distance/TRANSLATE_DISTANCE), 0, (1 - ABS(normalizedDistance)) * 40000 + (isLeft? 200 : 0));
        }
        else
        {
            transform = CATransform3DTranslate(CATransform3DIdentity, (isLeft? - FLOW_OFFSET : FLOW_OFFSET), 0, (1 - ABS(normalizedDistance)) * 40000 + (isLeft? 200 : 0));
        }
        transform.m34 = -1/(4.6777 * self.itemSize.width);
        CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
        transform = CATransform3DRotate(transform, (isLeft? 1 : -1) * ABS(normalizedDistance) * 45 * M_PI / 180, 0, 1, 0);
        transform = CATransform3DScale(transform, zoom, zoom, 1);
        attributes.zIndex = ABS(ACTIVE_DISTANCE - ABS(distance)) + 1;//ABS(ACTIVE_DISTANCE - ABS(distance)) + 1;
    }
    else
    {
        transform = CATransform3DTranslate(transform, isLeft? -FLOW_OFFSET : FLOW_OFFSET, 0, 0);
        transform = CATransform3DRotate(transform, (isLeft? 1 : -1) * 45 * M_PI / 180, 0, 1, 0);
        attributes.zIndex = 0;
    }
    attributes.transform3D = transform;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        if (layoutAttributes.representedElementCategory != UICollectionElementCategoryCell)
            continue; // skip headers
        
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}
/*
 调用步骤
 1，-(void)prepareLayout
 
 2，-(CGSize) collectionViewContentSize
 
 3，-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
 
 
 
 */
@end
