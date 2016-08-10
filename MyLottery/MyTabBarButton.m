//
//  MyTabBarButton.m
//  MyLottery
//
//  Created by 李贵 on 16/8/10.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "MyTabBarButton.h"

@implementation MyTabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


/**
*  初始化
*
*  @param frame <#frame description#>
*
*  @return <#return value description#>
*/
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/**
*  覆盖了这个方法,按钮就不存在高亮状态
*
*  @param highlighted <#highlighted description#>
*/
-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
