//
//  SettingsBaseController.h
//  MyLottery
//
//  Created by 李贵 on 16/8/14.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsBaseController : UITableViewController
/**
 *  数据
 */
@property (nonatomic, strong) NSMutableArray *data;

/**
 *  选中的行
 */
@property(strong,nonatomic) NSIndexPath *selectedIndex;

@end
