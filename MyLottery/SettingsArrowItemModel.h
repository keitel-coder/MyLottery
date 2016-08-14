//
//  SettingsArrowItemModel.h
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsBaseItemModel.h"


@interface SettingsArrowItemModel : SettingsBaseItemModel

/**
 *  目标控制器
 */
@property(assign,nonatomic)Class targetClass;

/**
 *  初始化
 *
 *  @param icon        图标
 *  @param title       标题
 *  @param targetClass 跳转控制器
 *
 *  @return 返回模型
 */
+(instancetype) initWithIcon:(NSString *)icon title:(NSString *)title targetClass:(Class) targetClass;

/**
 *  初始化
 *
 *  @param icon        图标
 *  @param title       标题
 *  @param click       点击
 *
 *  @return 返回模型
 */
+(instancetype) initWithTitle:(NSString *)title click:(voidBlock) click;

/**
 *  初始化
 *
 *  @param icon        图标
 *  @param title       标题
 *  @param click       点击
 *
 *  @return 返回模型
 */
+(instancetype) initWithIcon:(NSString *)icon title:(NSString *)title click:(voidBlock) click;

/**
 *  初始化
 *
 *  @param title       标题
 *  @param targetClass 跳转控制器
 *
 *  @return 返回模型
 */
+(instancetype)initWithTitle:(NSString*)title targetClass:(Class) targetClass;
@end
