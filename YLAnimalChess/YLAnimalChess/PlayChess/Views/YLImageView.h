//
//  YLImageView.h
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,YLControlState) {
    YLControlStateNomal,
    YLControlStateSelected
};
@interface YLImageView : UIImageView
@property(nonatomic,assign)BOOL selected;
-(void)setImage:(UIImage *)image forState:(YLControlState)state;
@end
