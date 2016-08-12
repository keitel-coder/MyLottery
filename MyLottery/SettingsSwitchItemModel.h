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

/**
 *  初始化
 *
 *  @param icon            图标
 *  @param title           标题
 *  @param switchChecked   开关打开事件
 *  @param switchUnChecked 开关关闭事件
 *
 *  @return 返回实例
 */
+(instancetype)initWithIcon:(NSString*)icon :(NSString*)title :(switchBlock)switchChecked :(switchBlock)switchUnChecked;
-(void)switchValueChanged:(id)sender;
@end
