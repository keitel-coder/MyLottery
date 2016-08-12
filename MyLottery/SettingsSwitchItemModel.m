//
//  SettingsSwitchItemModel.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsSwitchItemModel.h"

@interface SettingsSwitchItemModel()
/**
 *  切换开关事件
 */
@property(nonatomic,copy) switchBlock checkedBlock;
/**
 *  切换开关事件
 */
@property(nonatomic,copy) switchBlock unCheckedBlock;

@end

@implementation SettingsSwitchItemModel
+(instancetype)initWithIcon:(NSString *)icon :(NSString *)title :(switchBlock)checkedBlock :(switchBlock)unCheckedBlock{
    SettingsSwitchItemModel *item=[[SettingsSwitchItemModel alloc]init];
    item.icon=icon;
    item.title=title;
    item.checkedBlock=checkedBlock;
    item.unCheckedBlock=unCheckedBlock;
    return item;
}

-(void)switchValueChanged:(id)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        self.checkedBlock();
    }else {
        self.unCheckedBlock();
    }
}
@end
