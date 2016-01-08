//
//  BaseEditView.h
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/8.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,DrawEditType) {
    DrawEditType_undo,/**<撤销*/
    DrawEditType_redo,/**<恢复*/
    DrawEditType_cleanAll,/**<清屏*/
};
typedef void(^EditCallback) (DrawEditType editType);
@interface BaseEditView : UIView
- (instancetype)initWithFrame:(CGRect)frame editCallBack:(EditCallback)editCallback;
@end
