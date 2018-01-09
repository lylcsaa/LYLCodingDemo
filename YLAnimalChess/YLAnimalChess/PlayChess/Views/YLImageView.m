//
//  YLImageView.m
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "YLImageView.h"

@implementation YLImageView
{
    UIImage *_nomalImage;
    UIImage *_selectImage;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _selected = NO;
    }
    return self;
}
-(void)setImage:(UIImage *)image forState:(YLControlState )state{
    switch (state) {
        case YLControlStateNomal:
            _nomalImage = image;
            break;
        case YLControlStateSelected:
            _selectImage = image;
            break;
        default:
            break;
    }
    if (_selected) {
        [self setImage:_selectImage ? _selectImage : _nomalImage];
    }else{
        [self setImage:_nomalImage];
    }
}
-(void)setSelected:(BOOL)selected{
    _selected = selected;
    if (selected) {
        [self setImage:_selectImage ? _selectImage : _nomalImage];
    }else{
        [self setImage:_nomalImage];
    }
}
@end
