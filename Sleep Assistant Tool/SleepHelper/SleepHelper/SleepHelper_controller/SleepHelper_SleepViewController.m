//
//  SleepHelper_SleepViewController.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_SleepViewController.h"

@interface SleepHelper_SleepViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UILabel *noneLebel;

@end

@implementation SleepHelper_SleepViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.array removeAllObjects];
    
    RLMResults *results = [SleepHelper_TimeModel allObjects];
    for (SleepHelper_TimeModel *model in results) {
        [self.array addObject:model];
    }
    
    if(self.array.count > 0){
        [self.noneLebel setHidden:YES];
    }else{
        [self.noneLebel setHidden:NO];
    }
    
    [self.collectionView reloadData];
}

- (NSString *)getToday{
    NSDate *date = [NSDate date];
    NSDateFormatter *format1 = [[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy/MM/dd"];
    NSString *dateStr;
    dateStr = [format1 stringFromDate:date];
    return dateStr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionView];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SleepHelperSleepCell *cell = (SleepHelperSleepCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SleepHelperSleepCell" forIndexPath:indexPath];
    SleepHelper_TimeModel *model = self.array[indexPath.row];
    [cell setModel:model];
    return (UITableViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(KWidth, 20);
    }else{
        return CGSizeMake(KHeight, 0);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if kiPhone5 {
        return CGSizeMake(300, 184);
    }else {
        return CGSizeMake(345, 184);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    SleepHelper_GameCell *cell = (SleepHelper_GameCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    if(indexPath.row == 0){
        SleepHelper_SheepViewController *vc = [[SleepHelper_SheepViewController alloc]init];
        [self.navigationController pushViewController:vc  animated:YES];
    }else if (indexPath.row == 1){
        SleepHelper_PopViewController *vc = [[SleepHelper_PopViewController alloc]init];
        [self.navigationController pushViewController:vc  animated:YES];
    }else{
        SleepHelper_StarViewController *vc = [[SleepHelper_StarViewController alloc]init];
        [self.navigationController pushViewController:vc  animated:YES];
    }
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGFloat top = 64;
        if IS_IPHONE_X_orMore {
            top = 88;
        }
        CGRect frame = CGRectMake(0, top,KWidth, KHeight-top);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"SleepHelperSleepCell" bundle:nil] forCellWithReuseIdentifier:@"SleepHelperSleepCell"];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(345, 184);
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
