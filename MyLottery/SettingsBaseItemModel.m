//
//  SettingItemModel.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsBaseItemModel.h"

@implementation SettingsBaseItemModel

+(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title{
    SettingsBaseItemModel* item= [[self alloc]init];
    item.icon=icon;
    item.title=title;
    return item;
}

+(instancetype)initWithTitle:(NSString *)title{
    SettingsBaseItemModel* item= [[self alloc]init];
    item.title=title;
    return item;
}

@end
