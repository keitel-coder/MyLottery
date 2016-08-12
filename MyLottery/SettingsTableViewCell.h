//
//  SettingsTableViewCell.h
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingsBaseItemModel;

@interface SettingsTableViewCell : UITableViewCell

/**
 *  cell数据
 */
@property(strong,nonatomic) SettingsBaseItemModel *data;

/**
 *  初始化
 *
 *  @param tableView tableView
 *
 *  @return instancetype
 */
+(instancetype)initWithTableView:(UITableView*)tableView;

/**
 *  初始化
 *
 *  @param tableView tableView
 *  @param data      data
 *
 *  @return instancetype
 */
+(instancetype)initWithTableView:(UITableView*)tableView :(SettingsBaseItemModel*) data;
@end
