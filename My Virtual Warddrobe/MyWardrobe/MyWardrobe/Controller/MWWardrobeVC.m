//
//  MWWardrobeVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWWardrobeVC.h"

@interface MWWardrobeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *wordArray;

@end

@implementation MWWardrobeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.wordArray.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MWWardrobeCell *cell = (MWWardrobeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MWWardrobeCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.wordArray[indexPath.row]];
    cell.imageName.text = self.wordArray[indexPath.row];
    cell.tittle = self.wordArray[indexPath.row];
    return (UITableViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(Iphone_Width, 100);
    }else{
        return CGSizeMake(Iphone_Width, 0);
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if kiPhone5{
        return CGSizeMake(135, 160);
    }else{
        return CGSizeMake(160, 160);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MWWardrobeCell *cell = (MWWardrobeCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    NSString *string = cell.tittle;
    MWDetailsVC *detailsVc = [[MWDetailsVC alloc]initWithTitle:string];
    [self.navigationController pushViewController:detailsVc animated:YES];
}
- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        
        CGFloat top = 0;
        if kiPhone5 {
            top = 20;
        }
        CGRect frame = CGRectMake(0, top, Iphone_Width, Iphone_Height-64);
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
    
        if kiPhone5{
            _flowLayout.itemSize = CGSizeMake(135, 160);
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        }else{
            _flowLayout.itemSize = CGSizeMake(160, 160);
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            _flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        }
    }
    return _flowLayout;
}
- (NSMutableArray *)wordArray{
    if(_wordArray == nil){
        _wordArray = [[NSMutableArray alloc]initWithArray:@[@"Tops",
                                                        @"Bottoms",
                                                        @"Footwear",
                                                        @"Caps",
                                                        @"Bags",
                                                        @"Accessories"]];
    }
    return _wordArray;
}
@end
