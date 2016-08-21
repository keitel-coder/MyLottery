//
//  ProductModel.h
//  MyLottery
//
//  Created by 李贵 on 16/8/21.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject
/**
 *  标题
 */
@property(copy,nonatomic) NSString *title;

/**
 *  id
 */
@property(copy,nonatomic) NSString *ID;

/**
 *  ituns地址
 */
@property(copy,nonatomic) NSString *url;

/**
 *  应用图标
 */
@property(copy,nonatomic) NSString *icon;

/**
 *  自定义url地址
 */
@property(copy,nonatomic) NSString *customUrl;

+(instancetype)initWithDict:(NSDictionary*)dict;

@end
