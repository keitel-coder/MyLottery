//
//  SettingsSwitchItemModel.h
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsBaseItemModel.h"
#import <UIKit/UIKit.h>

typedef void (^switchBlock)();

@interface SettingsSwitchItemModel : SettingsBaseItemModel

@property(assign,nonatomic,getter=isRowClickSwitch,readonly) Boolean rowClickSwitch;

#pragma 属性



/**
 *  初始化
 *
 *  @param icon            图标
 *  @param title           标题
 *  @param switchChecked   开关打开事件
 *  @param rowClickSwitch  点击行是否切换开关
 *  @param switchUnChecked 开关关闭事件
 *
 *  @return 返回实例
 */
+(instancetype)initWithIcon:(NSString*)icon title:(NSString*)title isRowClickSwitch:(Boolean) rowClickSwitch switchChecked:(switchBlock)switchChecked switchUnChecked:(switchBlock)switchUnChecked;

/**
 *  开关选择事件
 *
 *  @param sender 开关
 */
-(void)switchValueChanged:(id)sender;
@end
