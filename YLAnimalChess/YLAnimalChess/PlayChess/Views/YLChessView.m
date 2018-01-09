//
//  YLChessView.m
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "YLChessView.h"
#import "YLImageView.h"
static const CGFloat kMarginSpace = 20.0;

@implementation YLChessView
{
    NSArray *_animalViews;
}
-(void)drawChess{
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds) - 64;
    CGFloat cellWidth = (width - 5*kMarginSpace)/4.0;
    CGFloat cellHeight = cellWidth;
    CGFloat maxY = 0;
    NSMutableArray *_array = [NSMutableArray array];
    for (int i = 0; i < 8; i++) {
        CGRect rect = CGRectMake((i%4 + 1) * kMarginSpace + i%4*cellWidth, i/4*cellHeight + (i/4 + 1)*kMarginSpace, cellWidth, cellWidth);
        UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10];
        CAShapeLayer *layer = [CAShapeLayer layer];
        [self.layer addSublayer:layer];
        layer.frame = self.layer.bounds;
        layer.lineWidth = 4.0;
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.fillColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.5].CGColor;
        layer.path = path1.CGPath;
        maxY = CGRectGetMaxY(rect);
        YLImageView *imageView = [self creatImageViewWithTag:i frame:rect];
        [_array addObject:imageView];
    }
    CGFloat minY = 0;
    for (int i = 0; i < 8; i++) {
        CGRect rect = CGRectMake((i%4 + 1) * kMarginSpace + i%4*cellWidth, height - ((2 - i/4))*cellHeight - ((3 - i/4))*kMarginSpace, cellWidth, cellWidth);
        if (i == 1) {
            minY = CGRectGetMinY(rect);
        }
        
        UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10];
        CAShapeLayer *layer = [CAShapeLayer layer];
        [self.layer addSublayer:layer];
        layer.frame = self.layer.bounds;
        layer.lineWidth = 4.0;
        layer.strokeColor = [UIColor blueColor].CGColor;
        layer.fillColor = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.5].CGColor;
        layer.path = path1.CGPath;
        YLImageView *imageView = [self creatImageViewWithTag:i+8 frame:rect];
        [_array addObject:imageView];
    }
    
    for (int i = 0; i < 2; i++) {
        CGRect rect = CGRectMake((width/4 - cellWidth)*(i+1) + i*cellWidth*2 + i * kMarginSpace,maxY + (minY - maxY)*0.5 - cellWidth,cellWidth*2,cellWidth*2);
        UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:10];
        CAShapeLayer *layer = [CAShapeLayer layer];
        [self.layer addSublayer:layer];
        layer.frame = self.layer.bounds;
        layer.lineWidth = 4.0;
        layer.strokeColor = [UIColor greenColor].CGColor;
        layer.fillColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.5].CGColor;
        layer.path = path1.CGPath;
    }
    _animalViews = [_array copy];
}
-(YLImageView*)creatImageViewWithTag:(int)tag frame:(CGRect)frame{
    YLImageView *imageView = [[YLImageView alloc] initWithFrame:frame];
    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    [imageView setImage:[UIImage imageNamed:@"animal-default"] forState:YLControlStateNomal];
    imageView.tag = tag;
    [self addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_tap:)];
    [self addGestureRecognizer:tap];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_pan:)];
    [imageView addGestureRecognizer:pan];
    return imageView;
}
-(void)p_tap:(UITapGestureRecognizer*)gr{
    
}
-(void)p_pan:(UIPanGestureRecognizer*)gr{
    
}
@end
