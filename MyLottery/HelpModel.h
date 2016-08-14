//
//  HelModel.h
//  MyLottery
//
//  Created by 李贵 on 16/8/14.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsBaseItemModel.h"

@interface HelpModel : NSObject

/**
 *  标题
 */
@property(copy,nonatomic) NSString *title;

/**
 *  html文件
 */
@property(copy,nonatomic) NSString *html;

/**
 *  位置id
 */
@property(copy,nonatomic) NSString *ID;

/**
 *  使用字典初始化实例
 *
 *  @param dict 字典
 *
 *  @return 实例
 */
+(instancetype)initWithDict:(NSDictionary*)dict;

@end
