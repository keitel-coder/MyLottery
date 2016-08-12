//
//  MineViewController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/12.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "MineViewController.h"
#import "UIImage+Extension.h"
#import "SettingsController.h"

@interface MineViewController()
/**
 *  登录按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

/**
 *  设置按钮点击
 */
- (IBAction)btnSettingClick;

@end

@implementation MineViewController

-(void)viewDidLoad{
    //设置按钮状态
    [self.btnLogin setBackgroundImage:[UIImage resizableImage:@"RedButton"] forState:UIControlStateNormal];
    [self.btnLogin setBackgroundImage:[UIImage resizableImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

- (IBAction)btnSettingClick {
    SettingsController *controller=[[SettingsController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
