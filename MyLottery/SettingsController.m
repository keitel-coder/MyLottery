//
//  SettingsController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsController.h"
#import "SettingsBaseItemModel.h"
#import "SettingsGroupModel.h"
#import "SettingsTableViewCell.h"
#import "SettingsArrowItemModel.h"
#import "SettingsSwitchItemModel.h"
#import "HelpController.h"

@interface SettingsController()<UITableViewDelegate>

@end

@implementation SettingsController

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [super initWithStyle:style];
}

-(void)viewDidLoad{
    self.title =@"设置";
    //  backgroundView 的优先级 >  backgroundColor
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    [self setGroup1Data];
    [self setGroup2Data];
}

/**
 *  设置组1数据
 */
-(void) setGroup1Data{
    //设置数据
    NSMutableArray *items=[NSMutableArray array];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MorePush" :@"推送和提醒":[HelpController class]]];
    [items addObject:[SettingsSwitchItemModel initWithIcon:@"handShake" :@"摇一摇机选" :^{
        [MBProgressHUD showSuccess:@"打开了开关"];
    } :^{
        [MBProgressHUD showSuccess:@"关闭了开关"];
    }]
     ];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"sound_Effect" :@"声音效果":[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithTitle:@"测试效果" :[HelpController class]]];
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
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreHelp" :@"帮助":[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreShare" :@"分享":[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreMessage" :@"查看消息":[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreNetease" :@"产品推荐":[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreUpdate" :@"检查新版本":[HelpController class]]];
    [items addObject:[SettingsArrowItemModel initWithIcon:@"MoreAbout" :@"关于":[HelpController class]]];
    
    SettingsGroupModel *group=[[SettingsGroupModel alloc]init];
    group.items=items;
    [self.data addObject:group];
}

-(NSMutableArray*)data{
    if(_data==nil){
        _data=[NSMutableArray array];
    }
    return _data;
}

#pragma table数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SettingsGroupModel *group =self.data[section];
    return group.items.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

/**
 *  返回cell
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *
 *  @return cell
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingsGroupModel *group =self.data[indexPath.section];
    SettingsBaseItemModel *item= group.items[indexPath.row];
    return [SettingsTableViewCell initWithTableView:tableView :item];
}

/**
 *  组头标题
 *
 *  @param tableView tableView
 *  @param section   组
 *
 *  @return 组头标题
 */
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    SettingsGroupModel *group= self.data[section];
    return group.headerTitle;
}

/**
 *  组尾文字
 *
 *  @param tableView tableView
 *  @param section   组
 *
 *  @return 组尾文字
 */
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    SettingsGroupModel *group= self.data[section];
    return group.footerTitle;
}

#pragma table数据源代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];  //取消选中这一行
    
    SettingsGroupModel *group= self.data[indexPath.section];
    SettingsBaseItemModel *item=group.items[indexPath.row];
    //跳转
    if([item isKindOfClass:[SettingsArrowItemModel class]]){
        SettingsArrowItemModel*itemModel=(SettingsArrowItemModel*)item;
        UIViewController *vc=[[itemModel.targetClass alloc]init];
        vc.title=itemModel.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
