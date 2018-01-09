//
//  YLAnimal.m
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import "YLAnimal.h"
#import "YLElphent.h"
#import "YLCat.h"
#import "YLDog.h"
#import "YLWolf.h"
#import "YLMouse.h"
#import "YLTiger.h"
#import "YLLeopard.h"
#import "YLLion.h"
@implementation YLAnimal
+(instancetype)creatAnimalWithCategoryType:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    switch (category) {
        case YLAnimalCategoryElphent:
           return [self creatElphentCategory:category roleType:rType];
            break;
        case YLAnimalCategoryLion:
           return [self creatLionCategory:category roleType:rType];
            break;
        case YLAnimalCategoryTiger:
           return [self creatTigerCategory:category roleType:rType];
            break;
        case YLAnimalCategoryLeopard:
           return [self creatLeopardCategory:category roleType:rType];
            break;
        case YLAnimalCategoryWolf:
            return [self creatWolfCategory:category roleType:rType];
            break;
        case YLAnimalCategoryDog:
            return [self creatDogCategory:category roleType:rType];
            break;
        case YLAnimalCategoryCat:
            return [self creatCatCategory:category roleType:rType];
            break;
        case YLAnimalCategoryMouse:
            return [self creatMouseCategory:category roleType:rType];
            break;
        default:
            NSLog(@"error: you cannot init an animal by this category");
            return nil;
            break;
    }
}
-(instancetype)initWithEatLevel:(YLAnimalEatLevel)level animalClass:(NSString*)cls animalImageName:(NSString*)imageName animalCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType
{
    NSLog(@"error: you cannot init an animal using this method,please use Class Method 'creatAnimalWithCategoryType'");
    return nil;
}
+(instancetype)creatElphentCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLElphent *elphent = [[YLElphent alloc] initWithEatLevel:YLAnimalEatLevelLion|YLAnimalEatLevelTiger|YLAnimalEatLevelLeopard|YLAnimalEatLevelWolf|YLAnimalEatLevelDog|YLAnimalEatLevelCat animalClass:@"大象" animalImageName:@"elphent" animalCategory:category roleType:rType];
    
    return elphent;
}
+(instancetype)creatLionCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLLion *lion = [[YLLion alloc] initWithEatLevel:YLAnimalEatLevelTiger |YLAnimalEatLevelLeopard |YLAnimalEatLevelWolf |YLAnimalEatLevelDog |YLAnimalEatLevelCat |YLAnimalEatLevelMouse animalClass:@"狮子" animalImageName:@"lion"  animalCategory:category roleType:rType];
    return lion;
    
}
+(instancetype)creatTigerCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLTiger *tiger = [[YLTiger alloc] initWithEatLevel:YLAnimalEatLevelLeopard |YLAnimalEatLevelWolf |YLAnimalEatLevelDog |YLAnimalEatLevelCat |YLAnimalEatLevelMouse animalClass:@"老虎" animalImageName:@"tiger"  animalCategory:category roleType:rType];
   
    return tiger;
}
+(instancetype)creatLeopardCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLLeopard *tiger = [[YLLeopard alloc] initWithEatLevel:YLAnimalEatLevelWolf|YLAnimalEatLevelDog|YLAnimalEatLevelCat|YLAnimalEatLevelMouse animalClass:@"豹子" animalImageName:@"leopard"  animalCategory:category roleType:rType];
    return tiger;
}
+(instancetype)creatWolfCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLWolf *tiger = [[YLWolf alloc] initWithEatLevel:YLAnimalEatLevelDog |YLAnimalEatLevelCat |YLAnimalEatLevelMouse animalClass:@"狼" animalImageName:@"wolf"  animalCategory:category roleType:rType];

    return tiger;
}
+(instancetype)creatDogCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLDog *tiger = [[YLDog alloc] initWithEatLevel:YLAnimalEatLevelCat |YLAnimalEatLevelMouse animalClass:@"狗" animalImageName:@"dog"  animalCategory:category roleType:rType];
    return tiger;
}
+(instancetype)creatCatCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLCat *tiger = [[YLCat alloc] initWithEatLevel:YLAnimalEatLevelMouse animalClass:@"猫" animalImageName:@"cat"  animalCategory:category roleType:rType];
    return tiger;
}
+(instancetype)creatMouseCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType{
    YLMouse *tiger = [[YLMouse alloc] initWithEatLevel:YLAnimalEatLevelElphent animalClass:@"老鼠" animalImageName:@"mouse"  animalCategory:category roleType:rType];
    return tiger;
}
-(void)run{
    NSLog(@"animal run");
}
-(void)eat:(YLAnimal *)animal{
    NSLog(@">>>%@ 吃 %@",self.animalName,animal.animalName);
}
@end
