//
//  SettingsGroupModel.h
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsGroupModel : NSObject

/**
 *  头部文本
 */
@property(copy,nonatomic) NSString *headerTitle;

/**
 *  脚部文本
 */
@property(copy,nonatomic) NSString *footerTitle;

/**
 *  组中的数据
 */
@property(copy,nonatomic) NSMutableArray *items;

/**
 *  初始化一个实例
 *
 *  @param headText   头部文字
 *  @param footerText 脚部文字
 *
 *  @return 返回一个组实例
 */
+(instancetype)initWithHead:(NSString*)headText :(NSString*) footerText :(NSMutableArray*)items;
@end
