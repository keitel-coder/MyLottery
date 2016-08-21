//
//  ProductCell.m
//  MyLottery
//
//  Created by 李贵 on 16/8/21.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "ProductCell.h"
#import "ProductModel.h"

@interface ProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation ProductCell

- (void)awakeFromNib
{
    self.icon.layer.cornerRadius = 8;
    self.icon.clipsToBounds = YES;
}

-(void)setModel:(ProductModel *)model{
    _model=model;
    self.icon.image=[UIImage imageNamed:self.model.icon];
    self.title.text=self.model.title;
}

@end
