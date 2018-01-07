//
//  LYLDrawView.m
//  LYLTreeNodeListView
//
//  Created by lyl on 2018/1/7.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLDrawView.h"
@implementation LYLDrawView
{
    CGPoint _startPoint;
    NSArray *_visableRedPointArr;
    NSArray *_visableGreenPointArr;
    NSArray *_visableBluePointArr;
    CGFloat _distace;
    int _visableCount;
    CGFloat _kPointSpace;
    CGFloat _scale;
    CGFloat _yScale;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat width = CGRectGetWidth(frame);
        _kPointSpace = 4.0;
        _yScale = 1;
        _scale = 1.0;
        _distace = 0;
        int numberOfPoints = width/_kPointSpace + 1;
        _visableCount = numberOfPoints;
        NSMutableArray *_arr = [NSMutableArray array];
        NSMutableArray *_arr1 = [NSMutableArray array];
        NSMutableArray *_arr2 = [NSMutableArray array];
        for (int i = 0; i < numberOfPoints; i++) {
            [_arr addObject:[NSNumber numberWithInt:(arc4random_uniform(200) + 40)]];
             [_arr1 addObject:[NSNumber numberWithInt:(arc4random_uniform(300) + 120)]];
             [_arr2 addObject:[NSNumber numberWithInt:(arc4random_uniform(250) + 60)]];
        }
        _visableRedPointArr = [_arr copy];
        _visableGreenPointArr = [_arr1 copy];
        _visableBluePointArr = [_arr2 copy];
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(p_pinch:)];
        [self addGestureRecognizer:pinch];
    }
    return self;
}
-(void)p_pinch:(UIPinchGestureRecognizer *)pinch{
    CGFloat scale = 1 - (_scale - pinch.scale);
    NSLog(@"--------scale = %f",scale);
//    _scale = 1 - (scale - )
    if([self p_scaleKLine:scale]){
        _scale = pinch.scale;
    }
}
-(BOOL)p_scaleKLine:(CGFloat)scale
{
    CGFloat pointSpace = _kPointSpace*fabs(scale);
    CGFloat width = CGRectGetWidth(self.frame);
    int numberOfPoints = width/pointSpace + 1;
    if (numberOfPoints > 1000) {
        return NO;
    }
    _kPointSpace = pointSpace;
    _yScale = fabs(scale);
    if (numberOfPoints != _visableCount) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            @synchronized(self){
            NSMutableArray *_arr0 = [_visableRedPointArr mutableCopy];
            NSMutableArray *_arr1 = [_visableGreenPointArr mutableCopy];
            NSMutableArray *_arr2 = [_visableBluePointArr mutableCopy];
            if (numberOfPoints > _visableRedPointArr.count) {
                
                _visableCount = numberOfPoints;
                int ch = numberOfPoints - _visableRedPointArr.count;
                for (int i = 0; i < ch; i++) {
                    if (i<ch/2) {
                        [_arr0 insertObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50] atIndex:0];
                        [_arr1 insertObject:[NSNumber numberWithInt:(arc4random_uniform(300) + 120)] atIndex:0];
                        [_arr2 insertObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50] atIndex:0];
                    }else{
                        [_arr0 addObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50]];
                        [_arr1 addObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50]];
                        [_arr2 addObject:[NSNumber numberWithInt:(arc4random_uniform(250) + 60)]];
                    }
                }
            }else if(numberOfPoints < _visableRedPointArr.count){
                _visableCount = numberOfPoints;
                int ch = _visableRedPointArr.count - numberOfPoints;
                [_arr0 removeObjectsInRange:NSMakeRange(0, ch)];
                [_arr1 removeObjectsInRange:NSMakeRange(0, ch)];
                [_arr2 removeObjectsInRange:NSMakeRange(0, ch)];
            }
           
                    _visableRedPointArr = [_arr0 copy];
                    _visableGreenPointArr = [_arr1 copy];
                    _visableBluePointArr = [_arr2 copy];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setNeedsDisplay];
            });
        });
    }
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _startPoint = [touches.anyObject locationInView:self];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint currentPoint = [touches.anyObject locationInView:self];
    CGFloat moveDistance = currentPoint.x - _startPoint.x;
    BOOL moveDirectionRight = moveDistance >= 0;
    _distace += moveDistance;
    if (moveDirectionRight) {
        NSLog(@"应该向右滑动");
        int numberOfNews = fabs(moveDistance)/_kPointSpace;
        if (numberOfNews > 0) {
            _distace = 0;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                @synchronized(self){
                NSMutableArray *_arr0 = [_visableRedPointArr mutableCopy];
                 NSMutableArray *_arr1 = [_visableGreenPointArr mutableCopy];
                 NSMutableArray *_arr2 = [_visableBluePointArr mutableCopy];
                for (int i = 0; i < numberOfNews; i++) {
                    [_arr0 insertObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50] atIndex:0];
                     [_arr1 insertObject:[NSNumber numberWithInt:(arc4random_uniform(300) + 120)] atIndex:0];
                     [_arr2 insertObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50] atIndex:0];
                    
                }
                [_arr0 removeObjectsInRange:NSMakeRange(_visableCount, numberOfNews)];
                [_arr1 removeObjectsInRange:NSMakeRange(_visableCount, numberOfNews)];
                [_arr2 removeObjectsInRange:NSMakeRange(_visableCount, numberOfNews)];
                _visableRedPointArr = [_arr0 copy];
                _visableGreenPointArr = [_arr1 copy];
                _visableBluePointArr = [_arr2 copy];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self setNeedsDisplay];
                });
            });
        }
    }else{
        NSLog(@"应该向左滑动");
        int numberOfNews = fabs(moveDistance)/_kPointSpace;
        if (numberOfNews > 0) {
            _distace = 0;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                @synchronized(self){
                NSMutableArray *_arr0 = [_visableRedPointArr mutableCopy];
                NSMutableArray *_arr1 = [_visableGreenPointArr mutableCopy];
                NSMutableArray *_arr2 = [_visableBluePointArr mutableCopy];
                for (int i = 0; i < numberOfNews; i++) {
                    [_arr0 addObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50]];
                    [_arr1 addObject:[NSNumber numberWithInt:arc4random_uniform(200) + 50]];
                    [_arr2 addObject:[NSNumber numberWithInt:(arc4random_uniform(250) + 60)]];
                }
                [_arr0 removeObjectsInRange:NSMakeRange(0, numberOfNews)];
                [_arr1 removeObjectsInRange:NSMakeRange(0, numberOfNews)];
                [_arr2 removeObjectsInRange:NSMakeRange(0, numberOfNews)];
                _visableRedPointArr = [_arr0 copy];
                _visableGreenPointArr = [_arr1 copy];
                _visableBluePointArr = [_arr2 copy];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self setNeedsDisplay];
                });
            });
        }
    }
  
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
-(void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGMutablePathRef path2 = CGPathCreateMutable();
    @synchronized(self){
        for (int i = 0; i < _visableRedPointArr.count; i++) {
            if (i == 0) {
                CGPathMoveToPoint(path, nil, i * _kPointSpace, [_visableRedPointArr[i] intValue]*_yScale);
                CGPathMoveToPoint(path1, nil, i * _kPointSpace, [_visableGreenPointArr[i] intValue]*_yScale);
                CGPathMoveToPoint(path2, nil, i * _kPointSpace, [_visableBluePointArr[i] intValue]*_yScale);
            }else{
                CGPathAddLineToPoint(path, nil, i*_kPointSpace, [_visableRedPointArr[i] intValue]*_yScale);
                CGPathAddLineToPoint(path1, nil, i*_kPointSpace, [_visableGreenPointArr[i] intValue]*_yScale);
                CGPathAddLineToPoint(path2, nil, i*_kPointSpace, [_visableBluePointArr[i] intValue]*_yScale);
            }
        }
        [self p_drawLine:path context:ctx lineWidth:1 strokeColor:[UIColor redColor] fillColor:[UIColor clearColor] shadowSize:CGSizeZero shadowColor:[UIColor clearColor]];
        [self p_drawLine:path1 context:ctx lineWidth:1 strokeColor:[UIColor greenColor] fillColor:[UIColor clearColor] shadowSize:CGSizeZero shadowColor:[UIColor clearColor]];
        [self p_drawLine:path2 context:ctx lineWidth:1 strokeColor:[UIColor blueColor] fillColor:[UIColor clearColor] shadowSize:CGSizeZero shadowColor:[UIColor clearColor]];
    }
   
    CGPathRelease(path);
     CGPathRelease(path1);
     CGPathRelease(path2);
    
}
//-(void)drawRect:(CGRect)rect{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();//获取上下文 - 创建一个画布
//
//    CGMutablePathRef path = CGPathCreateMutable();//创建路径
//
//    CGPathMoveToPoint(path, nil, 20, 50);//移动到指定的位置
//
//    CGPathAddLineToPoint(path, nil, 20, 500);//从起点开始绘制直线
//
//
//
//    [self p_drawLine:path context:ctx lineWidth:20 strokeColor:[UIColor purpleColor] fillColor:[UIColor clearColor] shadowSize:CGSizeMake(2, 2) shadowColor:[UIColor yellowColor]];
//
//    CGMutablePathRef path2 = CGPathCreateMutable();
//    CGPathMoveToPoint(path2, nil, 100, 100);
//    CGPathAddLineToPoint(path2, nil, 150, 300);
//    CGPathAddLineToPoint(path2, nil, 200, 200);
//    CGContextAddPath(ctx, path2);
//
//     [self p_drawLine:path2 context:ctx lineWidth:30 strokeColor:[UIColor brownColor] fillColor:[UIColor clearColor] shadowSize:CGSizeMake(2, 2) shadowColor:[UIColor yellowColor]];
//    CGPathRelease(path);
//    CGPathRelease(path2);
//
//}
-(void)p_drawLine:(CGMutablePathRef)path
          context:(CGContextRef)ctx
        lineWidth:(CGFloat)lineWidth
      strokeColor:(UIColor*)strokeColor
        fillColor:(UIColor*)fillColor
       shadowSize:(CGSize)shadowSize
      shadowColor:(UIColor*)shadowColor{
    
    CGContextAddPath(ctx, path);//把路径绘制到上下文中
    CGContextSetLineWidth(ctx, lineWidth);//设置笔触宽度
    [strokeColor setStroke];
    [fillColor setFill];
    CGContextSetLineCap(ctx, kCGLineCapRound);//设置定点样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);//设置连接样式
    CGContextSetShadowWithColor(ctx, shadowSize, 3, shadowColor.CGColor);//
    CGContextDrawPath(ctx, kCGPathFillStroke);
}
@end
