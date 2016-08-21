//
//  ProductModel.m
//  MyLottery
//
//  Created by 李贵 on 16/8/21.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

+(instancetype)initWithDict:(NSDictionary *)dict{
    ProductModel *model=[[ProductModel alloc]init];
    model.title=dict[@"title"];
    model.ID=dict[@"id"];
    model.url=dict[@"url"];
    model.customUrl=dict[@"customUrl"];
    model.icon=dict[@"icon"];
    return model;
}

@end
