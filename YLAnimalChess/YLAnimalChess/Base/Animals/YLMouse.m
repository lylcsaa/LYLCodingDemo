//
//  YLMouse.m
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "YLMouse.h"
@interface YLMouse ()
@property(nonatomic,copy,readwrite)NSString *animalName;
@property(nonatomic,copy,readwrite)NSString *animalImageName;
@property(nonatomic,assign,readwrite)YLAnimalEatLevel eatLevel;
@property(nonatomic,assign,readwrite)YLAnimalCategory category;
@property(nonatomic,assign,readwrite)YLAnimalRoleType roleType;

@end
@implementation YLMouse
@synthesize animalName;
@synthesize animalImageName;
@synthesize eatLevel;
@synthesize category;
@synthesize roleType;

-(instancetype)initWithEatLevel:(YLAnimalEatLevel)level animalClass:(NSString*)cls animalImageName:(NSString*)imageName animalCategory:(YLAnimalCategory)ct roleType:(YLAnimalRoleType)rType
{
    self = [super init];
    if (self) {
        animalName = cls;
        animalImageName = imageName;
        eatLevel = level;
        category = ct;
        roleType = rType;
    }
    return self;
}
@end
