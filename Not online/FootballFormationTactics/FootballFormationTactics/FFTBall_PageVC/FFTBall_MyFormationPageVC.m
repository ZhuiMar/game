//
//  FFTBall_MyFormationPageVC.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_MyFormationPageVC.h"
#import "FFTBall_MyCollectionViewCell.h"
#import "FFTBall_FormationDetailPageVC.h"
#import "FFTBall_PlanModel.h"


@interface FFTBall_MyFormationPageVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UIImageView *noneImage;

@end

@implementation FFTBall_MyFormationPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.array removeAllObjects];
    RLMResults *reuslt = [FFTBall_PlanModel allObjects];
    for (FFTBall_PlanModel *model in reuslt) {
        [self.array addObject:model];
    }
    if(self.array.count > 0){
        [self.noneImage setHidden:YES];
    }else{
        [self.noneImage setHidden:NO];
    }
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"My formation";
    [self.view addSubview:self.collectionView];
    
    RLMResults *reuslt = [FFTBall_PlanModel allObjects];
    for (FFTBall_PlanModel *model in reuslt) {
        [self.array addObject:model];
    }
    if(self.array.count > 0){
        [self.noneImage setHidden:YES];
    }else{
        [self.noneImage setHidden:NO];
    }
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FFTBall_MyCollectionViewCell *cell = (FFTBall_MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FFTBall_MyCollectionViewCell" forIndexPath:indexPath];
    [cell setModel:self.array[indexPath.row]];
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
    return CGSizeMake(Iphone_Width-40, 87);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    __used FFTBall_MyCollectionViewCell *cell = (FFTBall_MyCollectionViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    FFTBall_FormationDetailPageVC *vc = [[FFTBall_FormationDetailPageVC alloc]init];
    vc.model = self.array[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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
        [_collectionView registerNib:[UINib nibWithNibName:@"FFTBall_MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FFTBall_MyCollectionViewCell"];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(Iphone_Width-40, 87);
       _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
       _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return _flowLayout;
}

- (NSMutableArray *)array{
    if(_array == nil){
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
}

@end
