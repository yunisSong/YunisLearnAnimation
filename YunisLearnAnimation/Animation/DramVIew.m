//
//  DramVIew.m
//  YunisLearnAnimation
//
//  Created by Yunis on 16/1/7.
//  Copyright © 2016年 yunis. All rights reserved.
//

#import "DramVIew.h"
#import "Line.h"
@interface DramVIew()
{
    NSMutableArray *pointArr;
    NSMutableArray *pointArr1;
    
    Line *currentLine;
}
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong) UIBezierPath *bezierPath;
@property (nonatomic, assign) CGPoint lineStartPoint;
@property (nonatomic, assign) CGPoint lineEndPoint;
@end
@implementation DramVIew
#pragma mark - Life Cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.imageView];
        pointArr = [NSMutableArray new];
        pointArr1 = [NSMutableArray new];
        self.backgroundColor=[UIColor whiteColor];
        
    }
    return self;
}
- (nullable instancetype)initWithCoder:(NSCoder*)coder
{
    if (self =[super initWithCoder:coder]) {
        // 初始化代码
        [self addSubview:self.imageView];
        pointArr = [NSMutableArray new];
        pointArr1 = [NSMutableArray new];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}
- (void)dealloc
{
    
}
- (void)drawRect:(CGRect)rect
{
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    
    /*NO.1画一条线
     
     CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
     CGContextMoveToPoint(context, 20, 20);
     CGContextAddLineToPoint(context, 200,20);
     CGContextStrokePath(context);
     */
    
    
    
    /*NO.2写文字
     
     CGContextSetLineWidth(context, 1.0);
     CGContextSetRGBFillColor (context, 0.5, 0.5, 0.5, 0.5);
     UIFont  *font = [UIFont boldSystemFontOfSize:18.0];
     [@"公司：北京中软科技股份有限公司\n部门：ERP事业部\n姓名：McLiang" drawInRect:CGRectMake(20, 40, 280, 300) withFont:font];
     */
    
    
    /*NO.3画一个正方形图形 没有边框
     
     CGContextSetRGBFillColor(context, 0, 0.25, 0, 0.5);
     CGContextFillRect(context, CGRectMake(2, 2, 270, 270));
     CGContextStrokePath(context);
     */
    
    
    /*NO.4画正方形边框
     
     CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
     CGContextSetLineWidth(context, 2.0);
     CGContextAddRect(context, CGRectMake(2, 2, 270, 270));
     CGContextStrokePath(context);
     */
    
    
    /*NO.5画方形背景颜色
     
     CGContextTranslateCTM(context, 0.0f, self.bounds.size.height);
     CGContextScaleCTM(context, 1.0f, -1.0f);
     UIGraphicsPushContext(context);
     CGContextSetLineWidth(context,320);
     CGContextSetRGBStrokeColor(context, 250.0/255, 250.0/255, 210.0/255, 1.0);
     CGContextStrokeRect(context, CGRectMake(0, 0, 320, 460));
     UIGraphicsPopContext();
     */
    
    /*NO.6椭圆
     
     CGRect aRect= CGRectMake(80, 80, 160, 100);
     CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
     CGContextSetLineWidth(context, 3.0);
     CGContextAddEllipseInRect(context, aRect); //椭圆
     CGContextDrawPath(context, kCGPathStroke);
     */
    
    /*NO.7
     CGContextBeginPath(context);
     CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
     CGContextMoveToPoint(context, 100, 100);
     CGContextAddArcToPoint(context, 50, 100, 50, 150, 50);
     CGContextStrokePath(context);
     */
    
    /*NO.8渐变
     CGContextClip(context);
     CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
     CGFloat colors[] =
     {
     204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
     29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
     0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
     };
     CGGradientRef gradient = CGGradientCreateWithColorComponents
     (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
     CGColorSpaceRelease(rgb);
     CGContextDrawLinearGradient(context, gradient,CGPointMake
     (0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
     kCGGradientDrawsBeforeStartLocation);
     */
    
    
    /* NO.9四条线画一个正方形
     //画线
     UIColor *aColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0];
     CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
     CGContextSetFillColorWithColor(context, aColor.CGColor);
     CGContextSetLineWidth(context, 4.0);
     CGPoint aPoints[5];
     aPoints[0] =CGPointMake(60, 60);
     aPoints[1] =CGPointMake(260, 60);
     aPoints[2] =CGPointMake(260, 300);
     aPoints[3] =CGPointMake(60, 300);
     aPoints[4] =CGPointMake(60, 60);
     CGContextAddLines(context, aPoints, 5);
     CGContextDrawPath(context, kCGPathStroke); //开始画线
     */
    
    
    
    /*  NO.10
     UIColor *aColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0];
     CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
     CGContextSetFillColorWithColor(context, aColor.CGColor);
     //椭圆
     CGRect aRect= CGRectMake(80, 80, 160, 100);
     CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
     CGContextSetLineWidth(context, 3.0);
     CGContextSetFillColorWithColor(context, aColor.CGColor);
     CGContextAddRect(context, rect); //矩形
     CGContextAddEllipseInRect(context, aRect); //椭圆
     CGContextDrawPath(context, kCGPathStroke);
     */
    
    
    
    /*  NO.11
     画一个实心的圆
     
     CGContextFillEllipseInRect(context, CGRectMake(95, 95, 100.0, 100));
     */
    
    
    
    /*NO.12
     画一个菱形
     CGContextSetLineWidth(context, 2.0);
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     CGContextMoveToPoint(context, 100, 100);
     CGContextAddLineToPoint(context, 150, 150);
     CGContextAddLineToPoint(context, 100, 200);
     CGContextAddLineToPoint(context, 50, 150);
     CGContextAddLineToPoint(context, 100, 100);
     CGContextStrokePath(context);
     */
    
    /*NO.13 画矩形
     CGContextSetLineWidth(context, 2.0);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     
     CGRect rectangle = CGRectMake(60,170,200,80);
     
     CGContextAddRect(context, rectangle);
     
     CGContextStrokePath(context);
     */
    
    
    /*椭圆
     CGContextSetLineWidth(context, 2.0);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     
     CGRect rectangle = CGRectMake(60,170,200,80);
     
     CGContextAddEllipseInRect(context, rectangle);
     
     CGContextStrokePath(context);
     */
    
    /*用红色填充了一段路径:
     
     CGContextMoveToPoint(context, 100, 100);
     CGContextAddLineToPoint(context, 150, 150);
     CGContextAddLineToPoint(context, 100, 200);
     CGContextAddLineToPoint(context, 50, 150);
     CGContextAddLineToPoint(context, 100, 100);
     CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
     CGContextFillPath(context);
     */
    
    /*填充一个蓝色边的红色矩形
     CGContextSetLineWidth(context, 2.0);
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     CGRect rectangle = CGRectMake(60,170,200,80);
     CGContextAddRect(context, rectangle);
     CGContextStrokePath(context);
     CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
     CGContextFillRect(context, rectangle);
     */
    
    /*画弧
     //弧线的是通过指定两个切点，还有角度，调用CGContextAddArcToPoint()绘制
     CGContextSetLineWidth(context, 2.0);
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     CGContextMoveToPoint(context, 100, 100);
     CGContextAddArcToPoint(context, 100,200, 300,200, 100);
     CGContextStrokePath(context);
     */
    
    
    /*
     绘制贝兹曲线
     //贝兹曲线是通过移动一个起始点，然后通过两个控制点,还有一个中止点，调用CGContextAddCurveToPoint() 函数绘制
     CGContextSetLineWidth(context, 2.0);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     
     CGContextMoveToPoint(context, 10, 10);
     
     CGContextAddCurveToPoint(context, 0, 50, 300, 250, 300, 400);
     
     CGContextStrokePath(context);
     */
    
    /*绘制二次贝兹曲线
     
     CGContextSetLineWidth(context, 2.0);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     
     CGContextMoveToPoint(context, 10, 200);
     
     CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
     
     CGContextStrokePath(context);
     */
    
    /*绘制虚线
     CGContextSetLineWidth(context, 5.0);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     
     CGFloat dashArray[] = {2,6,4,2};
     
     CGContextSetLineDash(context, 3, dashArray, 4);//跳过3个再画虚线，所以刚开始有6-（3-2）=5个虚点
     
     CGContextMoveToPoint(context, 10, 200);
     
     CGContextAddQuadCurveToPoint(context, 150, 10, 300, 200);
     
     CGContextStrokePath(context);
     */
    /*绘制图片
     NSString* imagePath = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
     UIImage* myImageObj = [[UIImage alloc] initWithContentsOfFile:imagePath];
     //[myImageObj drawAtPoint:CGPointMake(0, 0)];
     [myImageObj drawInRect:CGRectMake(0, 0, 320, 480)];
     
     NSString *s = @"我的小狗";
     
     [s drawAtPoint:CGPointMake(100, 0) withFont:[UIFont systemFontOfSize:34.0]];
     */
    
    /*
     NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
     UIImage *img = [UIImage imageWithContentsOfFile:path];
     CGImageRef image = img.CGImage;
     CGContextSaveGState(context);
     CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
     CGContextDrawImage(context, touchRect, image);
     CGContextRestoreGState(context);
     */
    
    
    /*NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
     UIImage *img = [UIImage imageWithContentsOfFile:path];
     CGImageRef image = img.CGImage;
     CGContextSaveGState(context);
     
     CGContextRotateCTM(context, M_PI);
     CGContextTranslateCTM(context, -img.size.width, -img.size.height);
     
     CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
     CGContextDrawImage(context, touchRect, image);
     CGContextRestoreGState(context);*/
    
    /*
     NSString *path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"png"];
     UIImage *img = [UIImage imageWithContentsOfFile:path];
     CGImageRef image = img.CGImage;
     
     CGContextSaveGState(context);
     
     CGAffineTransform myAffine = CGAffineTransformMakeRotation(M_PI);
     myAffine = CGAffineTransformTranslate(myAffine, -img.size.width, -img.size.height);
     CGContextConcatCTM(context, myAffine);
     
     CGContextRotateCTM(context, M_PI);
     CGContextTranslateCTM(context, -img.size.width, -img.size.height);
     
     CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
     CGContextDrawImage(context, touchRect, image);
     CGContextRestoreGState(context);
     */
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    for (Line *line in pointArr) {
        [[UIColor redColor] set];
        CGContextMoveToPoint(context, line.beginPoint.x, line.beginPoint.y);
        CGContextAddLineToPoint(context, line.endPoint.x, line.endPoint.y);
        CGContextStrokePath(context);
    }


}
#pragma mark - Public Method
//外部方法

#pragma mark - Private Method
//本类方法
- (CGPoint)getTouchSet:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
    
}
- (void)addLine:(Line*)line
{
    if (![pointArr containsObject:line]) {
        [pointArr addObject:line];

    }

    [self setNeedsDisplay];
}
- (void)ssytest{
    //    以下是指定路径：
    if (pointArr.count == 0) {
        return;
    }
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 10;
    pathAnimation.repeatCount = 1;
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    Line *s = pointArr[0];
    CGPathMoveToPoint(curvedPath, NULL, s.beginPoint.x, s.beginPoint.y);
    [pointArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Line *t = obj;
        if (idx%2 == 0) {
            CGPathAddQuadCurveToPoint(curvedPath, NULL, t.beginPoint.x, t.beginPoint.y, t.endPoint.x, t.endPoint.y);
            
        }
    }];
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    UIImageView *circleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wuyanzu.jpg"]];
    circleView.frame = CGRectMake(1, 1, 40, 40);
    [self addSubview:circleView];
    [circleView.layer addAnimation:pathAnimation
                            forKey:@"moveTheSquare"];
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 10;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1;
    
    [circleView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
    NSLog(@"ppp  %@",NSStringFromCGRect(circleView.frame));
    NSLog(@"ppp  %@",NSStringFromCGRect(circleView.layer.frame));
}
#pragma mark - Delegate
//代理方法
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point = [self getTouchSet:touches];
    Line *l = [[Line alloc] init];
    l.beginPoint = point;
    l.endPoint = point;
    currentLine = l;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //手指移动时记录上一次的点坐标和当前点坐标
    CGPoint location = [self getTouchSet:touches];
    currentLine.endPoint = location;
    if (currentLine) {
        [self addLine:currentLine];
    }
    Line *newLine = [[Line alloc] init];
    newLine.beginPoint = location;
    newLine.endPoint = location;
    currentLine = newLine;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self ssytest];
}
#pragma mark - Event Response
//点击响应事件



#pragma mark - getters and setters
//初始化页面
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = ({
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.userInteractionEnabled = YES;

            imageView;
        });
    }
    
    return _imageView;
}
@end
