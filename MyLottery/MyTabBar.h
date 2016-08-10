//
//  MyTabBar.h
//  MyLottery
//
//  Created by 李贵 on 16/8/10.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBar;

@protocol MyTabBarDelegete <NSObject>

@optional

- (void)tabBar:(MyTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end



@interface MyTabBar : UIView
/**
 *  定义代理
 */
@property (nonatomic, weak) id<MyTabBarDelegete> delegate;

-(void)addMyTabButtonWithImage:(NSString *)imageSrc :(NSString *) selectedImage;

@end
