//
//  LightHomeBasePage.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/26.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "LightHomeBasePage.h"
#import "BannnerMaskView.h"
#import "BannerImageView.h"
@interface LightHomeBasePage()


@property(nonatomic,strong)UITableView *baseTableView;
@property(nonatomic,strong)BannerImageView *imageShowView;
@property(nonatomic,strong)BannnerMaskView *maskView;

@end


//CGFloat const maxScale = 1.3;

CGFloat const bannerImageViewMaxHeight = 400;
CGFloat const maskViewHeigth = 20;
CGFloat const maxChangeOffset = 140;
@implementation LightHomeBasePage
{
    float B_boottom;
    float h_heigth;
    float bannerTop;
}
#pragma mark - Life Cycle

+ (instancetype)showMaskHeardViewWithImage:(UIImage *)image maskType:(sliderAnimationType )type tableView:(UITableView *)tab
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    LightHomeBasePage * t = [[LightHomeBasePage alloc] initWithFrame:bounds];
    t.backgroundColor = KGrayColor;
    [t setUpUIWithTableView:tab image:image sliderType:type];
    
    return t;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
- (void)dealloc
{
    [self.baseTableView removeObserver:self forKeyPath:@"contentOffset"];
}
- (void)updateConstraints
{
    [super updateConstraints];
    
    [self.imageShowView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(bannerTop);
        make.height.equalTo(h_heigth);
    }];
    
    [self.maskView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(maskViewHeigth);
        make.top.equalTo(self).offset(bannerImageViewMaxHeight - maskViewHeigth - B_boottom);
    }];
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法
- (void)setUpUIWithTableView:(UITableView *)tab image:(UIImage *)image sliderType:(sliderAnimationType)type
{
    self.baseTableView = tab;
    h_heigth = bannerImageViewMaxHeight;
    [self addSubview:self.imageShowView];
    
    [self addSubview:self.maskView];
    
    [self addSubview:self.baseTableView];
    
    
    self.imageShowView.image = image;
    
    self.baseTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, bannerImageViewMaxHeight)];
    
    [self.baseTableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

    
}
- (void) animationForScroll:(CGFloat) offset {
    float valueChange;
    CATransform3D headerTransform = CATransform3DIdentity;

    if (offset <= 0) {
        self.maskView.drawRectValue = 1 ;
        valueChange = 1;
        h_heigth = bannerImageViewMaxHeight;
        headerTransform = CATransform3DTranslate(headerTransform, 0, -offset, 0);
        headerTransform = CATransform3DScale(headerTransform, 1, 1, 0);
        self.imageShowView.layer.transform = headerTransform;

    }else if(offset > 0 && offset <= maxChangeOffset)
    {
        self.maskView.drawRectValue = 1 - offset/maxChangeOffset;
        valueChange = 1 - offset/maxChangeOffset;
        h_heigth = bannerImageViewMaxHeight - offset;
        headerTransform = CATransform3DTranslate(headerTransform, 0, 0, 0);
        headerTransform = CATransform3DScale(headerTransform, 1, 1, 0);
        self.imageShowView.layer.transform = headerTransform;

    }else if (offset > maxChangeOffset)
    {
        self.maskView.drawRectValue = 0;
        valueChange = 0;
        h_heigth = bannerImageViewMaxHeight - maxChangeOffset;
        self.imageShowView.transform = CGAffineTransformMakeTranslation(0, -(offset - maxChangeOffset));
    }
    B_boottom =   offset  ;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
    

}
#pragma mark - Delegate
//代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    [self animationForScroll:offset];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    CGFloat offset = self.baseTableView.contentOffset.y;
    [self animationForScroll:offset];
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面

- (BannnerMaskView *)maskView{
    if (_maskView == nil) {
        _maskView = ({
            BannnerMaskView *t = [[BannnerMaskView alloc] init];
            t;
        });
    }
    
    return _maskView;
}

- (BannerImageView *)imageShowView{
    if (_imageShowView == nil) {
        _imageShowView = ({
            BannerImageView * t = [[BannerImageView alloc] init];
            t.backgroundColor = [UIColor redColor];
            t;
        });
    }
    
    return _imageShowView;
}
@end
