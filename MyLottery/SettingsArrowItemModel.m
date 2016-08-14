//
//  SettingsArrowItemModel.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsArrowItemModel.h"

@implementation SettingsArrowItemModel

+(instancetype)initWithTitle:(NSString *)title targetClass:(Class)targetClass{
    SettingsArrowItemModel *item=[[SettingsArrowItemModel alloc]init];
    item.title=title;
    item.targetClass=targetClass;
    return  item;
}

+(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title targetClass:(Class)targetClass{
    SettingsArrowItemModel *item=[SettingsArrowItemModel initWithTitle:title targetClass:targetClass];
    item.icon=icon;
    return item;
}

+(instancetype)initWithTitle:(NSString *)title click:(voidBlock)click{
    SettingsArrowItemModel *item=[[SettingsArrowItemModel alloc]init];
    item.title=title;
    item.click=click;
    return item;
}

+(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title click:(voidBlock)click{
    SettingsArrowItemModel *item=[SettingsArrowItemModel initWithTitle:title click:click];
    item.icon=icon;
    return item;
}
@end
