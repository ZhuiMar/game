//
//  MBBall_RecordPageVC.m
//  MathematicsBasketball
//
//  Created by zy on 2020/5/26.
//  Copyright © 2020 zhongba. All rights reserved.
//

#import "MBBall_RecordPageVC.h"
#import "MBBall_RecordCell.h"
#import "NSArray+MBBall_rank.h"


@interface MBBall_RecordPageVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *oneArr;
@property (nonatomic,strong) NSMutableArray *twoArr;
@property (nonatomic,strong) NSMutableArray *threeArr;

@end

@implementation MBBall_RecordPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Record";
    
    [self.view addSubview:self.collectionView];
    
    NSArray *arr1 = [NSArray MBBallgetRankingKey:@"MBBall_first"];
    NSArray *arr2 = [NSArray MBBallgetRankingKey:@"MBBall_second"];
    NSArray *arr3 = [NSArray MBBallgetRankingKey:@"MBBall_third"];

    for (NSNumber *num in arr1) {
        [self.oneArr addObject:num];
    }
    for (NSNumber *num in arr2) {
        [self.twoArr addObject:num];
    }
    for (NSNumber *num in arr3) {
        [self.threeArr addObject:num];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MBBall_RecordCell *cell = (MBBall_RecordCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MBBall_RecordCell" forIndexPath:indexPath];
    NSInteger index = indexPath.item;
    if(index == 0){
        cell.type.text = @"Simple";
        [cell setArr:self.oneArr];
    }else if (index == 1){
        cell.type.text = @"General";
        [cell setArr:self.twoArr];
    }else{
        cell.type.text = @"Hard";
        [cell setArr:self.threeArr];
    }
    return (UITableViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(Iphone_Width, 200);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if kiPhone5 {
        return CGSizeMake(300, 226);
    }else {
        return CGSizeMake(292, 226);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   __unused MBBall_RecordCell *cell = (MBBall_RecordCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGFloat top = 64;
        if IS_IPHONE_X_orMore {
            top = 88;
        }
        CGRect frame = CGRectMake(0, top, Iphone_Width, Iphone_Height-top);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"MBBall_RecordCell" bundle:nil] forCellWithReuseIdentifier:@"MBBall_RecordCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(292, 226);
       _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
       _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return _flowLayout;
}

- (NSMutableArray *)oneArr{
    if(_oneArr == nil){
        _oneArr = [[NSMutableArray alloc]init];
    }
    return _oneArr;
}
- (NSMutableArray *)twoArr{
    if(_twoArr == nil){
        _twoArr = [[NSMutableArray alloc]init];
    }
    return _twoArr;
}
- (NSMutableArray *)threeArr{
    if(_threeArr == nil){
        _threeArr = [[NSMutableArray alloc]init];
    }
    return _threeArr;
}

@end
