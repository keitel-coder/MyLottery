
//
//  HelpController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/14.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "HelpController.h"
#import "HelpModel.h"
#import "SettingsArrowItemModel.h"
#import "SettingsGroupModel.h"
#import "HtmlViewController.h"
#import "MyNavigationController.h"

@interface HelpController()
@property(nonatomic,strong) NSArray *helpData;

@end

@implementation HelpController

-(NSArray*)helpData{
    if(_helpData==nil){
        NSString*path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        // 加载JSON文件
        NSData *data = [NSData dataWithContentsOfFile:path];
        // 将JSON数据转为NSArray或者NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *array=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            [array addObject:[HelpModel initWithDict:dict]];
        }
        _helpData=array;
    }
    return _helpData;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setData];
}

/**
 *  设置数据
 */
-(void)setData{
    int count=self.helpData.count;
    NSMutableArray *items=[NSMutableArray array];
    for (int i=0; i<count; i++) {
        HelpModel*model=  self.helpData[i];
        [items addObject:[SettingsArrowItemModel initWithTitle:model.title targetClass:[HtmlViewController class]]];
    }
    SettingsGroupModel *group=[[SettingsGroupModel alloc]init];
    group.items=items;
    [self.data addObject:group];
}

/**
 *  选中行
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HtmlViewController *vc=[[HtmlViewController alloc]init];
    vc.model=self.helpData[indexPath.row];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
