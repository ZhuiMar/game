//
//  SecretOfRain_RecordViewController.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_RecordViewController.h"

@interface SecretOfRain_RecordViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *oneArr;
@property (nonatomic,strong) NSMutableArray *twoArr;
@property (nonatomic,strong) NSMutableArray *threeArr;

@end

@implementation SecretOfRain_RecordViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
    NSArray *arr1 = [NSObject SecretOfRain_getRankingKey:@"SecretOfRain_1"];
    NSArray *arr2 = [NSObject SecretOfRain_getRankingKey:@"SecretOfRain_2"];
    NSArray *arr3 = [NSObject SecretOfRain_getRankingKey:@"SecretOfRain_3"];

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
    SecretOfRain_RecodCell *cell = (SecretOfRain_RecodCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SecretOfRain_RecodCell" forIndexPath:indexPath];
    NSInteger index = indexPath.item;
    if(index == 0){
        cell.imageView.image = [UIImage imageNamed:@"record_s"];
        [cell setModel:self.oneArr];
    }else if (index == 1){
        cell.imageView.image = [UIImage imageNamed:@"record_m"];
        [cell setModel:self.threeArr];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"record_d"];
        [cell setModel:self.threeArr];
    }
    return (UITableViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(Iphone_Width, 20);
    }else{
        return CGSizeMake(Iphone_Width, 0);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if kiPhone5 {
        return CGSizeMake(300, 235);
    }else {
        return CGSizeMake(324, 235);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SecretOfRain_RecodCell *cell = (SecretOfRain_RecodCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
   
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
        [_collectionView registerNib:[UINib nibWithNibName:@"SecretOfRain_RecodCell" bundle:nil] forCellWithReuseIdentifier:@"SecretOfRain_RecodCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(324, 235);
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
