//
//  RedChess.h
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YLAnimal;
@interface RedChess : NSObject
@property(nonatomic,assign)int score;
@property(nonatomic,strong)NSArray*chesses;
+(instancetype)creatRedChesses;
-(void)removeRedChessesWhenBeEat:(YLAnimal*)animal;
@end
