//
//  BannerImageView.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/26.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "BannerImageView.h"
@interface BannerImageView()
@property(nonatomic,strong)UIImageView *imageView;
@end
@implementation BannerImageView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.imageView];
        
        [self.imageView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}
- (void)setImage:(UIImage *)image
{
    
    _image = image;
    self.imageView.image = _image;
    
}
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView;
        });
    }
    
    return _imageView;
}
@end
