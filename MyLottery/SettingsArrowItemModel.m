//
//  SettingsArrowItemModel.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsArrowItemModel.h"

@implementation SettingsArrowItemModel

+(instancetype)initWithIcon:(NSString *)icon :(NSString *)title :(Class)targetClass{
    SettingsArrowItemModel *item=[[SettingsArrowItemModel alloc]init];
    item.icon=icon;
    item.title=title;
    item.targetClass=targetClass;
    return  item;
}

+(instancetype)initWithTitle:(NSString *)title :(Class)targetClass{
    SettingsArrowItemModel *item=[[SettingsArrowItemModel alloc]init];
    item.title=title;
    item.targetClass=targetClass;
    return  item;
}
@end
