//
//  MainTabBarController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/10.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "MainTabBarController.h"
#import "MyTabBar.h"

@interface MainTabBarController ()<MyTabBarDelegete>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用自定义的tabbar
    MyTabBar *myBar=[[MyTabBar alloc]init];
    myBar.frame=self.tabBar.bounds;
    myBar.delegate=self;
    [self.tabBar addSubview:myBar];
    
    int count=self.viewControllers.count;
    for (int i=0; i<count; i++) {
        NSString *nomalImage=[NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selectImage=[NSString stringWithFormat:@"TabBar%dSel",i+1];
        [myBar addMyTabButtonWithImage:nomalImage :selectImage];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma MyTabBarDelegete
/**
 *  选择按钮事件
 *
 *  @param tabBar 点击的按钮
 *  @param from   原始按钮位置
 *  @param to     点击按钮位置
 */
-(void)tabBar:(MyTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to{
    
}

@end
