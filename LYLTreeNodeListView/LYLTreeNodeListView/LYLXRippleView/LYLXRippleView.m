//
//  LYLXRippleView.m
//  LYLTreeNodeListView
//
//  Created by wlx on 2018/1/10.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "LYLXRippleView.h"

@implementation LYLXRippleView
{
    UIBezierPath *_basePath;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawBaseCircle];
        [self drawWave];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self drawWave];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self drawWave];
            });
        });
        
    }
    return self;
}
-(void)drawBaseCircle{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 2.0;
    layer.strokeColor = [UIColor blueColor].CGColor;
    layer.fillColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.25].CGColor;
    [self.layer addSublayer:layer];
    _basePath = path;
}
-(void)drawWave{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:400 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 2.0;
    layer.strokeColor = [UIColor blueColor].CGColor;
    layer.fillColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1].CGColor;
    [self.layer addSublayer:layer];
    
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.repeatCount = MAXFLOAT;
//    animation.autoreverses = YES;
    animation.duration = 3;
    animation.fromValue = (__bridge id)_basePath.CGPath;
    animation.toValue = (__bridge id)path.CGPath;
    animation.keyPath = @"path";
    animation.delegate = self;
    [layer addAnimation:animation forKey:@"path"];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}
@end
