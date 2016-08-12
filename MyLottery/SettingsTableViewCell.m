
//
//  SettingsTableViewCell.m
//  MyLottery
//
//  Created by 李贵 on 16/8/13.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "SettingsTableViewCell.h"
#import "SettingsBaseItemModel.h"
#import "SettingsArrowItemModel.h"
#import "SettingsSwitchItemModel.h"

@implementation SettingsTableViewCell

+(instancetype)initWithTableView:(UITableView *)tableView{
    NSString* identity=@"settingCell";
    SettingsTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:identity];
    if(cell==nil){
        cell=[[SettingsTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
    }
    return cell;
}

+(instancetype)initWithTableView:(UITableView *)tableView :(SettingsBaseItemModel *)data{
    SettingsTableViewCell *cell= [self initWithTableView:tableView];
    cell.data=data;
    return cell;
}

-(instancetype)init{
    return [super init];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}

/**
 *  设置下划线
 */
-(void)setDivider{
    UIView *divider=[[UIView alloc]init];
    divider.frame=CGRectMake(0, self.bounds.size.height-1, 1, self.bounds.size.width);
    [self.contentView addSubview:divider];
}

/**
 *  设置数据
 */
-(void)setupData{
    if(self.data.icon){
        self.imageView.image=[UIImage imageNamed:self.data.icon];
    }
    //带箭头的
    if([self.data isKindOfClass:[SettingsArrowItemModel class]]){
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }else if([self.data isKindOfClass:[SettingsSwitchItemModel class]]){
        //带开关的
        self.accessoryType=UITableViewCellAccessoryNone;
        UISwitch *st=[[UISwitch alloc]init];
        //添加开关事件
        SettingsSwitchItemModel *item=(SettingsSwitchItemModel*)self.data;
        [st addTarget:item action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
        self.accessoryView=st;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    self.textLabel.text=self.data.title;
}

-(void)setData:(SettingsBaseItemModel *)data{
    _data=data;
    [self setupData];   //设置数据
    [self setDivider];  //设置下划线
}
@end
