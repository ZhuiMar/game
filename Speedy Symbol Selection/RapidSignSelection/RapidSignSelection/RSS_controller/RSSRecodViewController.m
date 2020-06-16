//
//  RSSRecodViewController.m
//  RapidSignSelection
//
//  Created by zy on 2020/6/5.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "RSSRecodViewController.h"
#import "RSSRecodCell.h"
#import "NSArray+arrays.h"

@interface RSSRecodViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *oneArr;
@property (nonatomic,strong) NSMutableArray *twoArr;
@property (nonatomic,strong) NSMutableArray *threeArr;

@end

@implementation RSSRecodViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr1 = [NSArray RSSgetRankingKey:@"RapidSignSelection_1"];
    NSArray *arr2 = [NSArray RSSgetRankingKey:@"RapidSignSelection_2"];
    NSArray *arr3 = [NSArray RSSgetRankingKey:@"RapidSignSelection_3"];
    for (NSNumber *num in arr1) {
       [self.oneArr addObject:num];
    }
    for (NSNumber *num in arr2) {
       [self.twoArr addObject:num];
    }
    for (NSNumber *num in arr3) {
       [self.threeArr addObject:num];
    }
    [self.view addSubview:self.collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RSSRecodCell *cell = (RSSRecodCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"RSSRecodCell" forIndexPath:indexPath];
    NSInteger index = indexPath.item;
    if(index == 0){
        cell.type.text = @"Simple";
        [cell setModel:self.oneArr];
    }else if (index == 1){
        cell.type.text = @"Medium";
        [cell setModel:self.threeArr];
    }else{
        cell.type.text = @"Difficult";
        [cell setModel:self.threeArr];
    }
    return (UITableViewCell *)cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(286, 320);
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
        [_collectionView registerNib:[UINib nibWithNibName:@"RSSRecodCell" bundle:nil] forCellWithReuseIdentifier:@"RSSRecodCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(286, 320);
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
