//
//  HelModel.m
//  MyLottery
//
//  Created by 李贵 on 16/8/14.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "HelpModel.h"

@implementation HelpModel

+(instancetype)initWithDict:(NSDictionary *)dict{
    HelpModel *model=[[HelpModel alloc]init];
    model.title=dict[@"title"];
    model.html=dict[@"html"];
    model.ID=dict[@"id"];
    return model;
}
@end
