//
//  YLAnimal.h
//  YLAnimalChess
//
//  Created by lyl on 2018/1/9.
//  Copyright © 2018年 lyl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,YLAnimalCategory) {
    YLAnimalCategoryElphent = 0,
    YLAnimalCategoryLion,
    YLAnimalCategoryTiger,
    YLAnimalCategoryLeopard,
    YLAnimalCategoryWolf,
    YLAnimalCategoryDog,
    YLAnimalCategoryCat,
    YLAnimalCategoryMouse
};
typedef NS_ENUM(int,YLAnimalEatLevel) {
    YLAnimalEatLevelElphent  = 1 << 0,
    YLAnimalEatLevelLion     = 1 << 1,
    YLAnimalEatLevelTiger    = 1 << 2,
    YLAnimalEatLevelLeopard  = 1 << 3,
    YLAnimalEatLevelWolf     = 1 << 4,
    YLAnimalEatLevelDog      = 1 << 5,
    YLAnimalEatLevelCat      = 1 << 6,
    YLAnimalEatLevelMouse    = 1 << 7,
};
typedef NS_ENUM(int,YLAnimalRoleType) {
    YLAnimalRoleTypeRed,
    YLAnimalRoleTypeBlue
};
@class YLAnimal;
@protocol YLAnimalDelegate
@optional;
//-(BOOL)animal:(YLAnimal*)animal eat
@end
@interface YLAnimal : NSObject
@property(nonatomic,copy,readonly)NSString *animalName;
@property(nonatomic,copy,readonly)NSString *animalImageName;
@property(nonatomic,assign,readonly)YLAnimalEatLevel eatLevel;
@property(nonatomic,assign,readonly)YLAnimalCategory category;
@property(nonatomic,assign,readonly)YLAnimalRoleType roleType;
@property(nonatomic,strong)NSArray *eatRoles;
+(instancetype)creatAnimalWithCategoryType:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType;

-(instancetype)initWithEatLevel:(YLAnimalEatLevel)level animalClass:(NSString*)cls animalImageName:(NSString*)imageName animalCategory:(YLAnimalCategory)category roleType:(YLAnimalRoleType)rType;
-(void)run;
-(void)eat:(YLAnimal*)animal;
@end
