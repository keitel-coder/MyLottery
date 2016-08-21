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

+(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title isRowClickSwitch:(Boolean)rowClickSwitch switchChecked:(switchBlock)switchChecked switchUnChecked:(switchBlock)switchUnChecked{
    SettingsSwitchItemModel *item=[[SettingsSwitchItemModel alloc]init];
    item.icon=icon;
    item.title=title;
    item.checkedBlock=switchChecked;
    item.unCheckedBlock=switchUnChecked;
    [item setRowClickSwitch:rowClickSwitch];
    return item;
}

-(void)switchValueChanged:(id)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    BOOL isButtonOn = [switchButton isOn];
    //保存设置
    [defaults setBool:isButtonOn forKey:self.title];
    [defaults synchronize];
    if (isButtonOn) {
        self.checkedBlock();
    }else {
        self.unCheckedBlock();
    }
}

-(void)setRowClickSwitch:(Boolean)rowClickSwitch{
    _rowClickSwitch=rowClickSwitch;
}
@end
