//
//  ProductController.m
//  MyLottery
//
//  Created by 李贵 on 16/8/21.
//  Copyright © 2016年 李贵. All rights reserved.
//

#import "ProductController.h"
#import "ProductModel.h"
#import "ProductCell.h"

#define ProductCellID @"product"

@interface ProductController()
@property(nonatomic,strong) NSArray *products;

@end

@implementation ProductController

-(NSArray*)products{
    if(_products==nil){
        //从json文件中读取数据
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"more_project" ofType:@"json"]];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *marray=[NSMutableArray array];
        for (int i=0; i<array.count; i++) {
            [marray addObject:[ProductModel initWithDict:array[i]]];
        }
        _products=marray;
    }
    return _products;
}

- (id)init
{
    // 1.流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 2.每个cell的尺寸
    layout.itemSize = CGSizeMake(80, 80);
    // 3.设置cell之间的水平间距
    layout.minimumInteritemSpacing = 0;
    // 4.设置cell之间的垂直间距
    layout.minimumLineSpacing = 10;
    // 5.设置四周的内边距
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    return [super initWithCollectionViewLayout:layout];
}

-(void)viewDidLoad{
    // 1.注册cell(告诉collectionView将来创建怎样的cell)
    UINib *nib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ProductCellID];
    
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MJProductCellID];
    
    // 2.设置collectionView的背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.products.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //UINib *nib=[UINib nibWithNibName:@"" bundle:nil];
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ProductCellID forIndexPath:indexPath];
    //取出数据
    ProductModel *model=self.products[indexPath.item];
    //设置数据
    cell.model=model;
    return cell;
}

#pragma 代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductModel *model=self.products[indexPath.item];
    [MBProgressHUD showSuccess:[NSString stringWithFormat:@"点击了%@",model.title]];
}

@end
