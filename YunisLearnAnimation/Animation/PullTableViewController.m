//
//  PullTableViewController.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/22.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "PullTableViewController.h"
#import "UIScrollView+TwitterCover.h"
#import "MBTwitterScroll.h"

#import "CircleInfo.h"
#import "BannnerMaskView.h"
#import "LightHomeBasePage.h"



@interface PullTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    float B_boottom;
    float h_heigth;
}
@property(nonatomic,strong)UITableView *baseTable;
@property (strong, nonatomic)  MBTwitterScroll *myTableView;
@property(nonatomic,strong)UIImageView *bannerView;
@property(nonatomic,strong)CALayer *masklayer;


@property (nonatomic, retain) CALayer *animationLayer;
@property (nonatomic, retain) CAShapeLayer *pathLayer;

@property(nonatomic,strong)BannnerMaskView *maskTestView;


@end
CGFloat const offset_HeaderStop1 = 40.0;
CGFloat const offset_B_LabelHeader1 = 95.0;
CGFloat const distance_W_LabelHeader1 = 35.0;

CGFloat const maxScale = 1.3;

CGFloat const Ttt = 400;
@implementation PullTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
  

    
    
    
//    self.view.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:self.bannerView];
//
//    [self.view addSubview:self.baseTable];
//
//    self.bannerView.image = [UIImage imageNamed:@"snow.jpg"];
//    [self.baseTable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.right.equalTo(self.view);
//    }];
//    
//    [self.baseTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
//    
//    
//    self.baseTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, Ttt )];
//    
////    self.bannerView.transform = CGAffineTransformMakeScale(2, 2);
//    B_boottom = Ttt;
//    
//    self.maskTestView = ({
//        BannnerMaskView *te =[BannnerMaskView new];
//        te.backgroundColor = [UIColor clearColor];
//        te;
//    });
//    [self.view addSubview:self.maskTestView];
    
    LightHomeBasePage *base = [LightHomeBasePage showMaskHeardViewWithImage:[UIImage imageNamed:@"snow.jpg"] maskType:sliderAnimationType_UpTonArrow tableView:self.baseTable];
    [self.view addSubview:base];
    

    
}
- (void)updateViewConstraints
{
    [super updateViewConstraints];


//    [self.maskTestView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.bannerView);
//        make.height.equalTo(40);
//        make.top.equalTo(self.view).offset(Ttt - 40 -  B_boottom);
//    }];
//    
//    [self.bannerView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(0);
//        make.height.equalTo(h_heigth);
//    }];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //布局
//    CATransform3D headerTransform = CATransform3DIdentity;
//    
//    headerTransform = CATransform3DMakeScale( 2, 2, 0);
//    
//    self.bannerView.layer.transform = headerTransform;
//    self.navigationController.navigationBarHidden = YES;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //监听事件
//    [self maskLayertest];
//    [self startAnimation];


}
- (void)dealloc
{
//    [self.baseTable removeObserver:self forKeyPath:@"contentOffset"];
}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法

#pragma mark - Delegate
//代理方法
#pragma mark -
#pragma mark Table View DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"fenzhongcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
//    [self animationForScroll:offset];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    CGFloat offset = self.baseTable.contentOffset.y;
    [self animationForScroll:offset];
    
    NSLog(@"yyyy == %f",offset);
}


- (void) animationForScroll:(CGFloat) offset {
    CATransform3D headerTransform = CATransform3DIdentity;
    
    float Kkk = 100;
    if (offset <= 0) {
        NSLog(@"小于0  %f",offset);
        headerTransform = CATransform3DTranslate(headerTransform, 0, -offset, 0);
        headerTransform = CATransform3DScale(headerTransform, 1, 1, 0);
        self.bannerView.layer.transform = headerTransform;
        self.maskTestView.drawRectValue = 1;
        h_heigth = Ttt;
    }else if(offset > 0 && offset <= Kkk)
    {
        NSLog(@"大于0小于240   %f",offset);
        h_heigth = Ttt - offset;
        CGFloat headerScaleFactor = maxScale - (( offset *(maxScale - 1)) /Kkk);
        headerTransform = CATransform3DTranslate(headerTransform, 0, 0, 0);
        headerTransform = CATransform3DScale(headerTransform, 1, 1, 0);
        self.bannerView.layer.transform = headerTransform;
        self.maskTestView.drawRectValue =1- offset/Kkk;

    }else if (offset > Kkk)
    {
        h_heigth = Ttt - Kkk;
        self.bannerView.transform = CGAffineTransformMakeTranslation(0, -(offset - Kkk));
    }
    B_boottom =   offset  ;
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    [self.view layoutIfNeeded];
    /*
     原始高度400 400的时间  比例最大 再下拉触发下拉刷新方法 下移
     
     
     由400 - 240 滑动 比例变为原始比例
     
     
     滑动到240时上移
     
     
     */
    
    
    
}
#pragma mark - Event Response
//点击响应事件

- (void)maskLayertest{
//    CGFloat round = 40;
//    self.bannerView.backgroundColor =[UIColor redColor];
//    
//    UIBezierPath *aPath = [UIBezierPath bezierPath];
//    
//    CGSize viewSize = CGSizeMake(self.bannerView.frame.size.width, self.bannerView.frame.size.height); //(210,80)
////    CGPoint startPoint = CGPointMake(self.bannerView.frame.origin.x,self.bannerView.frame.origin.y); //(279,0)
//    CGPoint startPoint = CGPointMake(0,viewSize.height - round);
//    [aPath moveToPoint:startPoint]; //(279,0)
//    
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y)]; //(489,0)
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y+viewSize.height-round)]; //(489,60)
//    [aPath addQuadCurveToPoint:CGPointMake(startPoint.x,startPoint.y+viewSize.height-round) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),viewSize.height+ round)]; //(279,60) : (384,80)
//    
//    [aPath closePath];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = self.bannerView.bounds;
//    layer.path = aPath.CGPath;
//    layer.backgroundColor = [UIColor whiteColor].CGColor;
//    layer.fillColor = [UIColor yellowColor].CGColor;
////    layer.contents = (__bridge id _Nullable)((self.bannerView.image).CGImage);
//    layer.strokeColor = [UIColor blueColor].CGColor;
//    
////    self.bannerView.layer.mask = layer;
//    
//    [self.bannerView.layer addSublayer:layer];
    
    
    
//    CGFloat round = 40;
//    self.bannerView.backgroundColor =[UIColor redColor];
//    
//    UIBezierPath *aPath = [UIBezierPath bezierPath];
//    
//    CGSize viewSize = CGSizeMake(self.masklayer.frame.size.width, self.masklayer.frame.size.height); //(210,80)
//    //    CGPoint startPoint = CGPointMake(self.bannerView.frame.origin.x,self.bannerView.frame.origin.y); //(279,0)
//    CGPoint startPoint = CGPointZero;
//    [aPath moveToPoint:startPoint]; //(279,0)
//    
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y)]; //(489,0)
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y+viewSize.height-round)]; //(489,60)
//    [aPath addQuadCurveToPoint:CGPointMake(startPoint.x,startPoint.y+viewSize.height-round) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),viewSize.height+ round)]; //(279,60) : (384,80)
//    
//    [aPath closePath];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = self.masklayer.bounds;
//    layer.path = aPath.CGPath;
//    layer.backgroundColor = [UIColor clearColor].CGColor;
//    layer.fillColor = [UIColor clearColor].CGColor;
//    
//    layer.strokeColor = [UIColor blueColor].CGColor;
//    layer.shadowColor = [UIColor greenColor].CGColor;
//    
//    //    self.bannerView.layer.mask = layer;
//    
//    [self.masklayer addSublayer:layer];
    
    
    
//    
//    CGFloat round = 80;
//    self.bannerView.backgroundColor =[UIColor redColor];
//    
//    UIBezierPath *aPath = [UIBezierPath bezierPath];
//    
//    CGSize viewSize = CGSizeMake(self.bannerView.frame.size.width, 80); //(210,80)
//    //    CGPoint startPoint = CGPointMake(self.bannerView.frame.origin.x,self.bannerView.frame.origin.y); //(279,0)
//    CGPoint startPoint = CGPointMake(0,self.bannerView.frame.size.height - round);
//    [aPath moveToPoint:startPoint]; //(279,0)
//    
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y)]; //(489,0)
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y+viewSize.height-round)]; //(489,60)
//    [aPath addQuadCurveToPoint:CGPointMake(startPoint.x,startPoint.y+viewSize.height-round) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),self.bannerView.frame.size.height+ round)]; //(279,60) : (384,80)
//    
//    [aPath closePath];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = self.bannerView.bounds;
//    layer.path = aPath.CGPath;
//    layer.backgroundColor = [UIColor clearColor].CGColor;
//    layer.fillColor = [UIColor yellowColor].CGColor;
////    layer.contents = (__bridge id _Nullable)((self.bannerView.image).CGImage);
//    layer.strokeColor = [UIColor blueColor].CGColor;
//    
////       self.bannerView.layer.mask = layer;
//    
//    [self.bannerView.layer addSublayer:layer];
    
    
    
//    self.bannerView.layer.cornerRadius = 200;
//    self.bannerView.clipsToBounds = YES;
    
    
//    CGFloat radius = 200.0;
//    // set the mask frame, and increase the height by the
//    // corner radius to hide bottom corners
//    CGRect maskFrame = self.view.bounds;
//    maskFrame.size.height += radius;
//    // create the mask layer
//    CALayer *maskLayer = [CALayer layer];
//    maskLayer.cornerRadius = radius;
//    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
//    maskLayer.frame = maskFrame;
//    
//    // set the mask
//    self.bannerView.layer.mask = maskLayer;
    
//    CGRect rect = self.bannerView.bounds;
//    CGSize radii = CGSizeMake(100, 100);
//    UIRectCorner corners = UIRectCornerTopRight;
//    //create path
////    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingcorners:corners cornerRadii:radii];
//    
//    UIBezierPath *path;
//    path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomLeft cornerRadii:radii];
//    
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.strokeColor = [[UIColor redColor] CGColor];
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.lineWidth = 0.5;
//    shapeLayer.lineCap = kCALineCapRound;
//    shapeLayer.path = path.CGPath;
//    [self.bannerView.layer addSublayer:shapeLayer];
    
    
    
    
    CGFloat round = 40;
    self.bannerView.backgroundColor =[UIColor redColor];
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    CGSize viewSize = CGSizeMake(self.bannerView.frame.size.width, 80); //(210,80)
    //    CGPoint startPoint = CGPointMake(self.bannerView.frame.origin.x,self.bannerView.frame.origin.y); //(279,0)
    CGPoint startPoint = CGPointMake(0,self.bannerView.frame.size.height );
    [aPath moveToPoint:startPoint]; //(279,0)
    
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y)]; //(489,0)
//    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y+viewSize.height-round)]; //(489,60)
    
    [aPath addLineToPoint:CGPointMake(viewSize.width,startPoint.y)]; //(489,0)
    [aPath addLineToPoint:CGPointMake(startPoint.x+viewSize.width,startPoint.y - round)]; //(489,60)
    [aPath addQuadCurveToPoint:CGPointMake(0,startPoint.y - round) controlPoint:CGPointMake(startPoint.x+(viewSize.width/2),self.bannerView.frame.size.height + 40)]; //(279,60) : (384,80)
    
    [aPath closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bannerView.bounds;
    layer.path = aPath.CGPath;
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.fillColor = [UIColor yellowColor].CGColor;
    //    layer.contents = (__bridge id _Nullable)((self.bannerView.image).CGImage);
    layer.strokeColor = [UIColor blueColor].CGColor;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [layer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    //       self.bannerView.layer.mask = layer;
    
    [self.bannerView.layer addSublayer:layer];
    
    
    
//    [self.animationLayer addSublayer:layer];
//    self.animationLayer.speed = 0;
//    self.animationLayer.timeOffset = 0.5;
//    self.pathLayer = layer;
}
- (void) startAnimation
{
    [self.pathLayer removeAllAnimations];

    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    CAKeyframeAnimation *penAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    penAnimation.duration = 1.0;
    penAnimation.path = self.pathLayer.path;
    penAnimation.calculationMode = kCAAnimationPaced;
    penAnimation.delegate = self;
    //[self.penLayer addAnimation:penAnimation forKey:@"position"];
}
-(CGPathRef)getgetCurrentWavePath{
    
    CGFloat b = CGRectGetWidth(self.masklayer.frame)/2.f;
    CGFloat a = CGRectGetHeight(self.masklayer.frame);
    
    CircleInfo *t = [CircleInfo GetCircle:@[[NSValue valueWithCGPoint:CGPointMake(0, 0)],
                                            [NSValue valueWithCGPoint:CGPointMake(b, a)],
                                            [NSValue valueWithCGPoint:CGPointMake(2*b, a)]]];

    
    
   
    float startAngle = - (M_PI - atan(a/b));
    
    float endAngle = M_PI - startAngle;
    
    float alpha = M_PI / 2 - (atan(a / b));
    
    float halfC = sqrt(a * a + b * b) / 2;
    
    float result = halfC / (cos(alpha));
    
    //圆心
//    CGPoint center = CGPointMake(b, a - result);
    CGPoint center = t.centerPoint;

    //半径
//    float radius = result;
    float radius = t.raduis;

    
    
    UIBezierPath *p = [UIBezierPath bezierPath];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, 0);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <=  self.masklayer.frame.size.width ; x++) {
        y = sqrt(radius*radius - (x - center.x)*(x - center.x)) - center.y;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, b, a);
    CGPathAddLineToPoint(path, nil, 2*b, 0);
    CGPathCloseSubpath(path);
    
    p.CGPath = path;
    
    return path;
}
- (void)handelCemterPoint
{
    
    
    
//    let a = self.es_height
//    if a == 0 {
//        return
//    }
//    let b = self.es_width * 0.5
//    
//    // 计算 开始/结束 角度
//    startAngle = -(CGFloat(M_PI) - atan(a / b))
//    endAngle = CGFloat(M_PI) - startAngle!
//    
//    let alpha = M_PI / 2 - Double(atan(a / b))
//    let halfC = sqrt(a * a + b * b) / 2
//    
//    // 计算圆弧半径
//    let result = halfC / CGFloat(cos(alpha))
//    centerPoint = CGPointMake(self.es_width * 0.5, self.es_height - result)
//    radius = result;
    
    

   
    
    
    
}
#pragma mark - getters and setters
//初始化页面
- (UITableView *)baseTable{
    if (_baseTable == nil) {
        _baseTable = ({
            UITableView *baseTableView    = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
            baseTableView.delegate        = self;
            baseTableView.dataSource      = self;
            baseTableView.backgroundColor = [UIColor clearColor];
            baseTableView.backgroundView  = nil;
            baseTableView.separatorStyle  = UITableViewCellSeparatorStyleNone;

            baseTableView;
        });
    }
    
    return _baseTable;
}
- (UIImageView *)bannerView{
    if (_bannerView == nil) {
        _bannerView = [UIImageView new];
        _bannerView.frame = CGRectMake(0, 0, SCREEN_WIDTH,400);
        _bannerView.contentMode = UIViewContentModeScaleAspectFill;
        _bannerView.backgroundColor = [UIColor redColor];
    }
    
    return _bannerView;
}
@end
