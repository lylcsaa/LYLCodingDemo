//
//  BlueChess.m
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "BlueChess.h"
#import "YLAnimal.h"
@implementation BlueChess
{
    NSMutableArray *_arrayM;
}
+(instancetype)creatBlueChesses{
    return [[self alloc] init];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _arrayM = [NSMutableArray array];
        for (int i = 0; i < 8; i++) {
            YLAnimal *animal = [YLAnimal creatAnimalWithCategoryType:i roleType:YLAnimalRoleTypeBlue];
            [_arrayM addObject:animal];
        }
    }
    return self;
}
-(NSArray *)chesses{
    return [_arrayM copy];
}
-(void)removeBlueChessesWhenBeEat:(YLAnimal*)animal{
    [_arrayM removeObject:animal];
}
@end
