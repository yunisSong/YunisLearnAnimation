//
//  BaseEditView.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "BaseEditView.h"
#import "UIButton+block.h"
@interface BaseEditView()
{
    EditCallback m_callBack;
}
@end
@implementation BaseEditView


- (instancetype)initWithFrame:(CGRect)frame editCallBack:(EditCallback)editCallback
{
    self = [super initWithFrame:frame];
    if (self)
    {
        m_callBack = editCallback;
        


        for (int i = 0 ; i < 3; i++) {
            UIButton *btr = ({
                UIButton *btr       = [UIButton buttonWithType:UIButtonTypeCustom];
                btr.titleLabel.font = [UIFont systemFontOfSize:16];
                [btr setBackgroundColor:[UIColor purpleColor]];
                btr.titleLabel.adjustsFontSizeToFitWidth = YES;
                [btr addTarget:self forControlEvents:UIControlEventTouchUpInside withBlock:^(UIButton *btr) {
                    //do action thing
                    m_callBack(i);
                }];
                btr;
            });
            if (i == 0)
            {
                [btr setTitle:@"撤销" forState:UIControlStateNormal];
 
            }else if (i == 1)
            {
                [btr setTitle:@"恢复" forState:UIControlStateNormal];

            }else if (i == 2)
            {
                [btr setTitle:@"清空" forState:UIControlStateNormal];

            }
            [self addSubview:btr];
            
            [btr mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(CGSizeMake(70, 40));
                make.left.equalTo(i * 80 + 10);
                make.centerY.equalTo(self);
            }];
        }
    }
    return self;
}
@end
