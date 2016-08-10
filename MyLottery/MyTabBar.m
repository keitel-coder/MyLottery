//
//  MyTabBar.m
//  MyLottery
//
//  Created by 李贵 on 16/8/10.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "MyTabBar.h"
#import "MyTabBarButton.h"

@interface MyTabBar()

/**
 *  选中的button
 */
@property(nonatomic, weak) MyTabBarButton *selectedButton;

@end

@implementation MyTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
*  布局控件
*/
-(void)layoutSubviews
{
    //设置按钮的布局
    int count=self.subviews.count;
   CGFloat barWidth= self.frame.size.width;
    CGFloat barHeight= self.frame.size.height;
    CGFloat itemBarWidth=barWidth/count;
    for (int i=0; i<count; i++) {
        MyTabBarButton *button=self.subviews[i];
        button.tag=i;
        CGFloat x=i*itemBarWidth;
        CGFloat y=0;
        CGFloat width=itemBarWidth;
        CGFloat height=barHeight;
        button.frame= CGRectMake(x, y, width, height);
    }
}

/**
 *  添加tab按钮
 *
 *  @param imageSrc      正常图片
 *  @param selectedImage 选中图片
 */
-(void)addMyTabButtonWithImage:(NSString *)imageSrc :(NSString *) selectedImage{
    MyTabBarButton *button=[[MyTabBarButton alloc]init];
    //设置图片和背景图
    [button setBackgroundImage:[UIImage imageNamed:imageSrc] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    //添加监听事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];
    if(self.subviews.count==1){
        [self buttonClick:button];
    }
}

/**
 *  按钮的点击事件
 *
 *  @param target 点击的按钮
 */
-(void)buttonClick:(MyTabBarButton*)button{
    //代理
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]){
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
}

@end
