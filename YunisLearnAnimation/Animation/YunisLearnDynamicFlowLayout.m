//
//  YunisLearnDynamicFlowLayout.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/18.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YunisLearnDynamicFlowLayout.h"

@implementation YunisLearnDynamicFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
        self.itemSize = CGSizeMake(44, 44);
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
        self.itemSize = CGSizeMake(44, 44);
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
    }
    return self;
}
- (void)prepareLayout
{
    [super prepareLayout];
    CGSize contentSize = self.collectionView.contentSize;
    NSArray *items = [super layoutAttributesForElementsInRect:
                      CGRectMake(0.0f, 0.0f, contentSize.width, contentSize.height)];
    
    if (self.dynamicAnimator.behaviors.count == 0) {
        [items enumerateObjectsUsingBlock:^(id<UIDynamicItem> obj, NSUInteger idx, BOOL *stop) {
            UIAttachmentBehavior *behaviour = [[UIAttachmentBehavior alloc] initWithItem:obj
                                                                        attachedToAnchor:[obj center]];
            
            behaviour.length = 0.0f;
            behaviour.damping = 0.8f;
            behaviour.frequency = 1.0f;
            
            [self.dynamicAnimator addBehavior:behaviour];
        }];
    }
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [self.dynamicAnimator itemsInRect:rect];
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dynamicAnimator layoutAttributesForCellAtIndexPath:indexPath];
}

//-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    UIScrollView *scrollView = self.collectionView;
//    CGFloat delta = newBounds.origin.y - scrollView.bounds.origin.y;
//    
//    CGPoint touchLocation = [self.collectionView.panGestureRecognizer locationInView:self.collectionView];
//    
//    [self.dynamicAnimator.behaviors enumerateObjectsUsingBlock:^(UIAttachmentBehavior *springBehaviour, NSUInteger idx, BOOL *stop) {
//        CGFloat yDistanceFromTouch = fabsf(touchLocation.y - springBehaviour.anchorPoint.y);
//        CGFloat xDistanceFromTouch = fabsf(touchLocation.x - springBehaviour.anchorPoint.x);
//        CGFloat scrollResistance = (yDistanceFromTouch + xDistanceFromTouch) / 1500.0f;
//        
//        UICollectionViewLayoutAttributes *item = springBehaviour.items.firstObject;
//        CGPoint center = item.center;
//        if (delta < 0) {
//            center.y += MAX(delta, delta*scrollResistance);
//        }
//        else {
//            center.y += MIN(delta, delta*scrollResistance);
//        }
//        item.center = center;
//        
//        [self.dynamicAnimator updateItemUsingCurrentState:item];
//    }];
//    
//    return NO;
//}
@end
