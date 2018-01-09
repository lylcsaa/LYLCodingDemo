//
//  GameClass.m
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "GameClass.h"
#import "RedChess.h"
#import "BlueChess.h"
@interface GameClass ()
@property(nonatomic,assign)int level;
@property(nonatomic,strong)RedChess *redChess;
@property(nonatomic,strong)BlueChess *blueChess;
@end
@implementation GameClass
+(instancetype)creatANewGameWithLevel:(int)level{
    return [[GameClass alloc] initWithLevel:level];
}
- (instancetype)initWithLevel:(int)level
{
    self = [super init];
    if (self) {
        _level = level;
    }
    return self;
}
-(void)startGame{
    
}
-(void)gameOver{
    
}
@end
