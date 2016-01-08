//
//  DrawBezierPath.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawBezierPath : UIBezierPath

+ (instancetype)paintPathWithLineWidth:(CGFloat)width
                            startPoint:(CGPoint)startP;
@end
