//
//  YunisAlertTitleView.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/19.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "YunisAlertTitleView.h"

@implementation YunisAlertTitleView

#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *image = ({
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wuyanzu.jpg"]];
            imageView;
        });
        image.frame = CGRectMake(0, 0, 50, 50);
        [self addSubview:image];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(50, 50));
            make.centerY.equalTo(self);
            make.left.equalTo(20);
        }];
        
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@",[self class]);
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法

#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面

@end
