//
//  SettingsGroupModel.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsGroupModel.h"

@implementation SettingsGroupModel

+(instancetype)initWithHead:(NSString *)headText :(NSString *)footerText :(NSMutableArray *)items{
    SettingsGroupModel *group=[[SettingsGroupModel alloc]init];
    group.headerTitle=headText;
    group.footerTitle=footerText;
    group.items=items;
    return group;
}
@end
