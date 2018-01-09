//
//  GameClass.h
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameClass : NSObject
+(instancetype)creatANewGameWithLevel:(int)level;
-(void)startGame;
-(void)gameOver;
@end
