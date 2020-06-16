//
//  MWDetialLookVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWDetialLookVC.h"

@interface MWDetialLookVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *topArray;
@property (nonatomic,strong) NSMutableArray *bottomArray;

@end

@implementation MWDetialLookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.topArray.count;
    }else{
        return self.bottomArray.count;
    }
}

- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MWWardrobeCell *cell = (MWWardrobeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MWWardrobeCell" forIndexPath:indexPath];
    return (UITableViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(160, 160);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MWWardrobeCell *cell = (MWWardrobeCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    NSString *string = cell.tittle;
    MWDetailsVC *detailsVc = [[MWDetailsVC alloc]initWithTitle:string];
    [self.navigationController pushViewController:detailsVc animated:YES];
}
- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGRect frame = CGRectMake(0, 0, Iphone_Width, Iphone_Height-64);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"MWWardrobeCell" bundle:nil] forCellWithReuseIdentifier:@"MWWardrobeCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(160, 160);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);;
    }
    return _flowLayout;
}
- (NSMutableArray *)topArray{
    if(_topArray == nil){
        _topArray = [[NSMutableArray alloc]init];
    }
    return _topArray;
}
- (NSMutableArray *)bottomArray{
    if (_bottomArray == nil) {
        _bottomArray = [[NSMutableArray alloc]init];
    }
    return _bottomArray;
}
@end
