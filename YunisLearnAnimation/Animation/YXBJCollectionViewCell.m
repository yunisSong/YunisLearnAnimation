//
//  YXBJCollectionViewCell.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/18.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YXBJCollectionViewCell.h"
#import "UIColor+randomColor.h"
@implementation YXBJCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor randomColor];
}

@end
