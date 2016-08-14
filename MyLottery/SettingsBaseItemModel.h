//
//  SettingItemModel.h
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^voidBlock)();

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

/**
 *  点击事件
 */
@property(strong,nonatomic)voidBlock click;

/**
 *  <#Description#>
 *
 *  @param icon  图标
 *  @param title 标题
 *
 *  @return 对象
 */
+(instancetype)initWithIcon:(NSString*)icon title:(NSString*)title;

/**
 *  <#Description#>
 *
 *  @param title 标题
 *
 *  @return duix
 */
+(instancetype)initWithTitle:(NSString*)title;

@end
