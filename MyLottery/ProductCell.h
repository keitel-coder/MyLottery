//
//  ProductCell.h
//  MyLottery
//
//  Created by 李贵 on 16/8/21.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ProductModel;

@interface ProductCell : UICollectionViewCell

/**
 *  cell数据
 */
@property(strong,nonatomic) ProductModel *model;

@end
