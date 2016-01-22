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

@interface PullTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *baseTable;
@property (strong, nonatomic)  MBTwitterScroll *myTableView;
@property(nonatomic,strong)UIImageView *bannerView;
@property(nonatomic,strong)CALayer *masklayer;


@property (nonatomic, retain) CALayer *animationLayer;
@property (nonatomic, retain) CAShapeLayer *pathLayer;


@end
CGFloat const offset_HeaderStop1 = 40.0;
CGFloat const offset_B_LabelHeader1 = 95.0;
CGFloat const distance_W_LabelHeader1 = 35.0;

CGFloat const maxScale = 1.3;
@implementation PullTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载页面
  

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bannerView];

    [self.view addSubview:self.baseTable];
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(64);
        make.height.equalTo(400);
    }];
    self.bannerView.image = [UIImage imageNamed:@"3.jpg"];
    [self.baseTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(64);
    }];
    
    [self.baseTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    
    self.baseTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400 )];
    
    self.bannerView.transform = CGAffineTransformMakeScale(2, 2);

    
    self.masklayer = ({
        CALayer *view = [CALayer new];
        view.backgroundColor = [UIColor purpleColor].CGColor;
        view;
    });
    
    self.masklayer.frame = CGRectMake(110, 110, 300, 100);
    
    [self.bannerView.layer addSublayer:self.masklayer];

    
    
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
    [self maskLayertest];


}
- (void)dealloc
{
    [self.baseTable removeObserver:self forKeyPath:@"contentOffset"];
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
    [self animationForScroll:offset];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    CGFloat offset = self.baseTable.contentOffset.y;
    [self animationForScroll:offset];
    
    NSLog(@"yyyy == %f",offset);
}


- (void) animationForScroll:(CGFloat) offset {
    
    CATransform3D headerTransform = CATransform3DIdentity;
//    if (offset < 0) {
//        CGFloat headerScaleFactor = -(offset) / self.bannerView.bounds.size.height;
//        CGFloat headerSizevariation = ((self.bannerView.bounds.size.height * (1.0 + headerScaleFactor)) - self.bannerView.bounds.size.height)/2.0;
//        headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0);
//        headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0);
//        
//        self.bannerView.layer.transform = headerTransform;
//    }
//    else {
//        headerTransform = CATransform3DTranslate(headerTransform, 0,MAX(-offset_HeaderStop1, -offset), 0);
//
////        if (offset < 40) {
////            headerTransform = CATransform3DTranslate(headerTransform, 0,0, 0);
////
////        }else
////        {
////            headerTransform = CATransform3DTranslate(headerTransform, 0,-offset, 0);
////
////        }
//        //        CATransform3D labelTransform = CATransform3DMakeTranslation(0, MAX(-distance_W_LabelHeader1, offset_B_LabelHeader1 - offset), 0);
//        //        self.bannerView.layer.transform = labelTransform;
//        //        self.bannerView.layer.zPosition = 2;
//    }
//    
    
    if (offset <= 0) {
        NSLog(@"小于0  %f",offset);
//        CGAffineTransform t = CGAffineTransformMakeTranslation(0, -offset);
//        t = CGAffineTransformMakeScale(2, 2);
//        self.bannerView.transform = t;
//        self.bannerView.transform = CGAffineTransformMakeTranslation(0, -offset);
        
        

        headerTransform = CATransform3DTranslate(headerTransform, 0, -offset, 0);
        headerTransform = CATransform3DScale(headerTransform, maxScale, maxScale, 0);
        //        headerTransform = CATransform3DMakeScale( headerScaleFactor, headerScaleFactor, 0);
        
        self.bannerView.layer.transform = headerTransform;

        
    }else if(offset > 0 && offset <= 240)
    {
        NSLog(@"大于0小于240   %f",offset);
        
        CGFloat headerScaleFactor = maxScale - (( offset *(maxScale - 1)) /240);
        headerTransform = CATransform3DTranslate(headerTransform, 0, 0, 0);
        headerTransform = CATransform3DScale(headerTransform, headerScaleFactor, headerScaleFactor, 0);
//        headerTransform = CATransform3DMakeScale( headerScaleFactor, headerScaleFactor, 0);
        
        self.bannerView.layer.transform = headerTransform;
//        CGAffineTransform t = CGAffineTransformMakeTranslation(0, 0);
//        t = CGAffineTransformMakeScale(headerScaleFactor, headerScaleFactor);
//        self.bannerView.transform = t;

    }else if (offset > 240)
    {
        NSLog(@"大于20  %f",offset);
//        headerTransform = CATransform3DTranslate(headerTransform, 0,-offset, 0);
//        self.bannerView.layer.transform = headerTransform;
        
        self.bannerView.transform = CGAffineTransformMakeTranslation(0, -(offset - 240));


    }
    
    /*
     原始高度400 400的时间  比例最大 再下拉触发下拉刷新方法 下移
     
     
     由400 - 240 滑动 比例变为原始比例
     
     
     滑动到240时上移
     
     
     */
    
    
    
}
#pragma mark - Event Response
//点击响应事件

- (void)maskLayertest{
    
    CGFloat b = CGRectGetWidth(self.masklayer.frame)/2.f;
    CGFloat a = CGRectGetHeight(self.masklayer.frame);
    
    float startAngle = - (M_PI - atan(a/b));
    
    float endAngle = M_PI - startAngle;
    
    float alpha = M_PI / 2 - (atan(a / b));
    
    float halfC = sqrt(a * a + b * b) / 2;
    
    float result = halfC / (cos(alpha));
    
    //圆心
    CGPoint center = CGPointMake(b, a - result);
    //半径
    float radius = result;
    
//    UIColor.redColor().set()
//    let path = UIBezierPath()
//    path.lineWidth = 0.5;
//    path.addArcWithCenter(self.centerPoint!, radius: self.radius!, startAngle: startAngle!, endAngle: endAngle!, clockwise: false)
//    path.moveToPoint(CGPointMake(0, 0))
//    path.addLineToPoint(CGPointMake(self.es_width, 0))
//    path.fill()
    
//    
//    CircleInfo *t = [CircleInfo GetCircle:@[[NSValue valueWithCGPoint:CGPointMake(0, 0)],
//                                            [NSValue valueWithCGPoint:CGPointMake(b, a)],
//                                            [NSValue valueWithCGPoint:CGPointMake(2*b, a)]]];
//
//    
//    
//    [[UIColor redColor] set];
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineWidth = 2;
////    [path addArcWithCenter:t.centerPoint radius:t.raduis startAngle:startAngle endAngle:endAngle clockwise:NO];
//    [path moveToPoint:CGPointMake(0, 0)];
//
//    [path addCurveToPoint:CGPointMake(self.animationLayer.frame.size.width/2.f, self.animationLayer.frame.size.height) controlPoint1:CGPointMake(0, 0) controlPoint2:CGPointMake(self.animationLayer.frame.size.width, 0)];
//    
//    [path addLineToPoint:CGPointMake(self.animationLayer.frame.size.width, 0)];
//    [path fill];
    
    
//    CAShapeLayer *pathLayer = [CAShapeLayer layer];
//    pathLayer.frame = self.animationLayer.bounds;
//    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
//    pathLayer.backgroundColor = [[UIColor yellowColor] CGColor];
//    pathLayer.geometryFlipped = YES;
//    pathLayer.path = path.CGPath;
//    pathLayer.strokeColor = [UIColor colorWithRed:234.0/255 green:84.0/255 blue:87.0/255 alpha:1].CGColor;
//    // pathLayer.strokeColor = [[UIColor blackColor] CGColor];
//    pathLayer.fillColor = nil;
//    pathLayer.lineWidth = 1.0f;
//    pathLayer.lineJoin = kCALineJoinBevel;
//    
//    [self.masklayer.layer addSublayer:pathLayer];
//    
    

//    NSLog(@"22222 == %@  %f",NSStringFromCGPoint(center),radius);
//
//    NSLog(@"yyy == %@  %f",NSStringFromCGPoint(t.centerPoint),t.raduis);
    
    
    
//    let path = UIBezierPath(rect:self.view.bounds)
//    
//    path.appendPath(UIBezierPath(rect: CGRect(x: 100, y: 100, width: 200, height: 300)).bezierPathByReversingPath())
//    let shape = CAShapeLayer()
//    
//    shape.path = path.CGPath
//    
//    blurView.layer.mask = shape
    
    
//    UIBezierPath *yun = [UIBezierPath bezierPathWithRect:self.masklayer.bounds];
//    [path appendPath:[[UIBezierPath bezierPathWithArcCenter:t.centerPoint radius:t.raduis startAngle:M_PI *.5 endAngle:M_PI*1.5 clockwise:NO] bezierPathByReversingPath]];
//    
//    
//    CAShapeLayer *test = [CAShapeLayer new];
//    test.path = yun.CGPath;
//    
//    self.masklayer.layer.mask = test;
    
    
    
    
    
    CAShapeLayer *waveLayer = [CAShapeLayer layer];
    waveLayer.fillColor = [UIColor clearColor].CGColor;
    waveLayer.path = [self getgetCurrentWavePath];
    [self.masklayer addSublayer:waveLayer];
    
    
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
        _bannerView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH*165/480);
        _bannerView.contentMode = UIViewContentModeScaleAspectFill;
        _bannerView.backgroundColor = [UIColor redColor];
    }
    
    return _bannerView;
}
@end
