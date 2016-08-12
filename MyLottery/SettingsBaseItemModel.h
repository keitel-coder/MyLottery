//
//  SettingItemModel.h
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsBaseItemModel : NSObject

/**
 *  图标
 */
@property(copy,nonatomic) NSString *icon;

/**
 *  标题
 */
@property(copy,nonatomic) NSString *title;

/**
 *  副标题
 */
@property(copy,nonatomic) NSString *subTitle;

@end
