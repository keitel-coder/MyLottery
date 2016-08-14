
//
//  SettingsBaseController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/14.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsBaseController.h"
#import "SettingsBaseItemModel.h"
#import "SettingsGroupModel.h"
#import "SettingsTableViewCell.h"
#import "SettingsArrowItemModel.h"
#import "SettingsSwitchItemModel.h"

@interface SettingsBaseController()

@end

@implementation SettingsBaseController

-(instancetype)init{
//    [self.tabBarItem.is
    self.hidesBottomBarWhenPushed=YES;
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    self.hidesBottomBarWhenPushed=YES;
    return [super initWithStyle:style];
}



-(void)viewDidLoad{
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
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
    self.selectedIndex=indexPath;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];  //取消选中这一行
    
    SettingsGroupModel *group= self.data[indexPath.section];
    SettingsBaseItemModel *item=group.items[indexPath.row];
    
    if(item.click){
        item.click();
    }
    
    //箭头样式跳转
    if([item isKindOfClass:[SettingsArrowItemModel class]]){
        SettingsArrowItemModel*itemModel=(SettingsArrowItemModel*)item;
        if([itemModel.targetClass isSubclassOfClass:[UIViewController class]])
        {
            UIViewController *vc=[[itemModel.targetClass alloc]init];
            vc.title=itemModel.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if([item isKindOfClass:[SettingsSwitchItemModel class]]){
        //开关样式
        SettingsSwitchItemModel *itemModel=(SettingsSwitchItemModel*)item;
        //是否需要点击行切换开关
        if(itemModel.isRowClickSwitch){
            //拿出UISwitch
            UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
            UISwitch* us= (UISwitch*)cell.accessoryView;
            [us setOn:![us isOn] animated:YES];
            [itemModel switchValueChanged:us];
        }
    }
}

@end
