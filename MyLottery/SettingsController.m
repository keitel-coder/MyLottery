//
//  SettingsController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsController.h"
#import "SettingsBaseController.h"
#import "SettingsBaseItemModel.h"
#import "SettingsArrowItemModel.h"
#import "SettingsSwitchItemModel.h"
#import "SettingsArrowItemModel.h"
#import "SettingsGroupModel.h"
#import "HelpController.h"
#import "ProductController.h"

@interface SettingsController()<UITableViewDelegate>

@end

@implementation SettingsController

-(void)viewDidLoad{
    self.title =@"设置";
    //  backgroundView 的优先级 >  backgroundColor
    [self setGroup1Data];
    [self setGroup2Data];
}

/**
 *  设置组1数据
 */
-(void) setGroup1Data{
    //设置数据
    NSMutableArray *items=[NSMutableArray array];
    
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MorePush" title:@"推送和提醒" click:^{
        [MBProgressHUD showSuccess:@"点击了推送和提醒"];
    }]];
    
    [items addObject:[SettingsSwitchItemModel initWithIcon:@"handShake" title:@"摇一摇机选" isRowClickSwitch:YES switchChecked:^{
        [MBProgressHUD showSuccess:@"打开了开关"];
    } switchUnChecked:^{
        [MBProgressHUD showSuccess:@"关闭了开关"];
    }]];
    
    SettingsSwitchItemModel* soundItem= [SettingsSwitchItemModel initWithIcon:@"sound_Effect" title:@"声音效果" isRowClickSwitch:YES switchChecked:^{
        [MBProgressHUD showSuccess:@"打开了声音效果"];
    } switchUnChecked:^{
        [MBProgressHUD showSuccess:@"关闭了声音效果"];
    }];
    [items addObject:soundItem];
    SettingsGroupModel *group=[[SettingsGroupModel alloc]init];
    group.items=items;
    [self.data addObject:group];
}

/**
 *  设置组2数据
 */
-(void) setGroup2Data{
    //设置数据
    NSMutableArray *items=[NSMutableArray array];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreHelp" title:@"帮助" targetClass:[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreShare" title:@"分享" targetClass:[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreMessage" title:@"查看消息" targetClass:[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreNetease" title:@"产品推荐" targetClass:[ProductController class]]];
    SettingsBaseItemModel *updateItem=[SettingsBaseItemModel initWithIcon:@"MoreUpdate" title:@"检查新版本"];
    __unsafe_unretained typeof (self) selfVC=self;
    updateItem.click=^{
        [MBProgressHUD showMessage:@"正在拼命检查中..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showSuccess:@"当前版本已经是最新版本"];
            
            //设置最新版本
            //刷新表格
            SettingsGroupModel *group= selfVC.data[selfVC.selectedIndex.section];
            SettingsBaseItemModel *model=group.items[selfVC.selectedIndex.row];
            model.title=@"已是最新版本";
            [selfVC.tableView reloadData];
        });
    };
    [items addObject:updateItem];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreAbout" title:@"关于" targetClass:[HelpController class]]];
    
    SettingsGroupModel *group=[[SettingsGroupModel alloc]init];
    group.items=items;
    [self.data addObject:group];
}

@end
