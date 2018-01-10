//
//  LYLCloseMenu.m
//  LYLTreeNodeListView
//
//  Created by wlx on 2018/1/10.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLCloseMenu.h"
static const CGFloat kLeftMargin = 40;
static const CGFloat kTopMargin = 40;
static const CGFloat kLineSpace = 20;
static const CGFloat kLineLength = 60;
static const CGFloat kLineWidth = 5;
@implementation LYLCloseMenu
{
    CAShapeLayer *_firstLayer;
    CAShapeLayer *_secondLayer;
    CAShapeLayer *_thirdLayer;
    int _flag;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _flag = 0;
        [self creatBaseLine];
    }
    return self;
}
-(void)creatBaseLine
{
    _firstLayer = [CAShapeLayer layer];
    _firstLayer.lineWidth = kLineWidth;
    _firstLayer.strokeColor = [UIColor redColor].CGColor;
    _firstLayer.fillColor = [UIColor clearColor].CGColor;
    _firstLayer.lineCap = kCALineCapRound;
    _firstLayer.lineJoin = kCALineJoinRound;
    UIBezierPath *p1 = [UIBezierPath bezierPath];
    [p1 moveToPoint:CGPointMake(kLeftMargin, kTopMargin)];
    [p1 addLineToPoint:CGPointMake(kLeftMargin + kLineLength, kTopMargin)];
    _firstLayer.path = p1.CGPath;
    
    [self.layer addSublayer:_firstLayer];
    _secondLayer = [CAShapeLayer layer];
    _secondLayer.lineWidth = kLineWidth;
    _secondLayer.strokeColor = [UIColor redColor].CGColor;
    _secondLayer.fillColor = [UIColor clearColor].CGColor;
    _secondLayer.lineCap = kCALineCapRound;
    _secondLayer.lineJoin = kCALineJoinRound;
    UIBezierPath *p2 = [UIBezierPath bezierPath];
    [p2 moveToPoint:CGPointMake(kLeftMargin, kTopMargin + kLineSpace)];
    [p2 addLineToPoint:CGPointMake(kLeftMargin + kLineLength, kTopMargin + kLineSpace)];
    _secondLayer.path = p2.CGPath;
    [self.layer addSublayer:_secondLayer];
    _thirdLayer = [CAShapeLayer layer];
    _thirdLayer.lineWidth = kLineWidth;
    _thirdLayer.strokeColor = [UIColor redColor].CGColor;
    _thirdLayer.fillColor = [UIColor clearColor].CGColor;
    _thirdLayer.lineCap = kCALineCapRound;
    _thirdLayer.lineJoin = kCALineJoinRound;
    UIBezierPath *p3 = [UIBezierPath bezierPath];
    [p3 moveToPoint:CGPointMake(kLeftMargin, kTopMargin + 2*kLineSpace)];
    [p3 addLineToPoint:CGPointMake(kLeftMargin + kLineLength,kTopMargin + 2*kLineSpace)];
    _thirdLayer.path = p3.CGPath;
    [self.layer addSublayer:_thirdLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(kLeftMargin + 10, kTopMargin + kLineSpace)];
    [path addLineToPoint:CGPointMake(kLeftMargin + kLineLength + 5, kTopMargin + kLineSpace)];
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.repeatCount = 1;
    animation.duration = 0.5;
    animation.fromValue = (__bridge id)p2.CGPath;
    animation.toValue = (__bridge id)path.CGPath;
    animation.keyPath = @"path";
    animation.delegate = self;
    [_secondLayer addAnimation:animation forKey:@"path"];
    _secondLayer.path = path.CGPath;
    
}
-(void)animationDidStart:(CAAnimation *)anim{
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (_flag == 0) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(kLeftMargin + 10, kTopMargin + kLineSpace)];
        [path addLineToPoint:CGPointMake(kLeftMargin + kLineLength + 5, kTopMargin + kLineSpace)];
        
        UIBezierPath *path2 = [UIBezierPath bezierPath];
        [path2 moveToPoint:CGPointMake(kLeftMargin + kLineLength - 30, kTopMargin + kLineSpace)];
        [path2 addLineToPoint:CGPointMake(kLeftMargin + kLineLength + 5, kTopMargin + kLineSpace)];
        [path2 addArcWithCenter:CGPointMake(kLeftMargin + kLineLength*0.5, kTopMargin + kLineSpace) radius:kLineLength*0.5 + 5 startAngle:0 endAngle:M_PI*1.9 clockwise:NO];
        
        CABasicAnimation *animation = [[CABasicAnimation alloc] init];
        animation.repeatCount = 1;
        animation.duration = 0.5;
        animation.fromValue = (__bridge id)path.CGPath;
        animation.toValue = (__bridge id)path2.CGPath;
        animation.keyPath = @"path";
        animation.delegate = self;
        [_secondLayer addAnimation:animation forKey:@"path"];
        _secondLayer.path = path2.CGPath;
    }else if (_flag == 1){
        UIBezierPath *path2 = [UIBezierPath bezierPath];
        [path2 moveToPoint:CGPointMake(kLeftMargin + kLineLength - 30, kTopMargin + kLineSpace)];
        [path2 addLineToPoint:CGPointMake(kLeftMargin + kLineLength + 5, kTopMargin + kLineSpace)];
        [path2 addArcWithCenter:CGPointMake(kLeftMargin + kLineLength*0.5, kTopMargin + kLineSpace) radius:kLineLength*0.5 + 5 startAngle:0 endAngle:M_PI*1.9 clockwise:NO];
        
        UIBezierPath *path3 = [UIBezierPath bezierPath];
        [path3 moveToPoint:CGPointMake(kLeftMargin + kLineLength + 5, kTopMargin + kLineSpace)];
        [path3 addArcWithCenter:CGPointMake(kLeftMargin + kLineLength*0.5, kTopMargin + kLineSpace) radius:kLineLength*0.5 + 5 startAngle:0 endAngle:M_PI clockwise:NO];
        
        CABasicAnimation *animation = [[CABasicAnimation alloc] init];
        animation.repeatCount = 1;
        animation.duration = 0.5;
        animation.fromValue = (__bridge id)path2.CGPath;
        animation.toValue = (__bridge id)path3.CGPath;
        animation.keyPath = @"path";
        animation.delegate = self;
        [_secondLayer addAnimation:animation forKey:@"path"];
        _secondLayer.path = path3.CGPath;
    }
    _flag += 1;
}
@end
