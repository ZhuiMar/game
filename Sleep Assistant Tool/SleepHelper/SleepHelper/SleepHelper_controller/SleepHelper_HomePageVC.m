//
//  SleepHelper_HomePageVC.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_HomePageVC.h"

@interface SleepHelper_HomePageVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *gamesImage;

@end

@implementation SleepHelper_HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
    NSLog(@"%@",[self timeFormatted:200]);
    
}

- (NSString *)timeFormatted:(int)totalSeconds{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.gamesImage.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SleepHelper_GameCell *cell = (SleepHelper_GameCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SleepHelper_GameCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.gamesImage[indexPath.row]];
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
        return CGSizeMake(300, 100);
    }else {
        return CGSizeMake(345, 134);
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
        [_collectionView registerNib:[UINib nibWithNibName:@"SleepHelper_GameCell" bundle:nil] forCellWithReuseIdentifier:@"SleepHelper_GameCell"];
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(345, 134);
       _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
       _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return _flowLayout;
}

- (NSMutableArray *)gamesImage{
    if(_gamesImage == nil){
        _gamesImage = [[NSMutableArray alloc]init];
        [_gamesImage addObject:@"Counting lambs"];
        [_gamesImage addObject:@"Poke bubbles"];
        [_gamesImage addObject:@"Falling star"];
    }
    return _gamesImage;
}

@end
