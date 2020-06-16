//
//  DonutNotes_RecordViewController.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_RecordViewController.h"

@interface DonutNotes_RecordViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *itemBg;

@property (nonatomic,strong) NSMutableArray *dataOne;
@property (nonatomic,strong) NSMutableArray *dataTwo;
@property (nonatomic,strong) NSMutableArray *dataThree;

@end

@implementation DonutNotes_RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
    [self getData];
}

- (void)getData{
    RLMResults *results = [DonutNotes_Score allObjects];
    for (DonutNotes_Score *model in results) {
        if([model.DonutNotes_level isEqualToString:@"1"]){
            [self.dataOne addObject:model];
        }
        if([model.DonutNotes_level isEqualToString:@"2"]){
            [self.dataTwo addObject:model];
        }
        if([model.DonutNotes_level isEqualToString:@"3"]){
            [self.dataThree addObject:model];
        }
    }
    [self.collectionView reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0){
         return self.dataOne.count;
    }else if (section == 1){
         return self.dataTwo.count;
    }else{
         return self.dataThree.count;
    }
}

- (DonutNotes_RecordCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DonutNotes_RecordCollectionViewCell *cell = (DonutNotes_RecordCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DonutNotes_RecordCollectionViewCell" forIndexPath:indexPath];

    if(indexPath.section == 0){
        DonutNotes_Score *model = self.dataOne[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:model.DonutNotes_name];
        cell.cuont.text = model.DonutNotes_score;
        
    }else if (indexPath.section == 1){
         DonutNotes_Score *model = self.dataTwo[indexPath.row];
         cell.imageView.image = [UIImage imageNamed:model.DonutNotes_name];
         cell.cuont.text = model.DonutNotes_score;
    }else{
         DonutNotes_Score *model = self.dataThree[indexPath.row];
         cell.imageView.image = [UIImage imageNamed:model.DonutNotes_name];
         cell.cuont.text = model.DonutNotes_score;
    }
   return (DonutNotes_RecordCollectionViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(Iphone_Width, 50);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    if(section == 0){
        if(self.dataOne.count == 0){
            return CGSizeMake(Iphone_Width, 50);
        }else{
            return CGSizeMake(Iphone_Width, 0);
        }
    }else if(section == 1){
        if(self.dataTwo.count == 0){
            return CGSizeMake(Iphone_Width, 50);
        }else{
            return CGSizeMake(Iphone_Width, 0);
        }
    }else{
        if(self.dataThree.count == 0){
            return CGSizeMake(Iphone_Width, 50);
        }else{
            return CGSizeMake(Iphone_Width, 0);
        }
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView*)collectionView viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)indexPath;{

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        [collectionView registerNib:[UINib nibWithNibName:@"DonutNotes_HeadCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DonutNotes_HeadCollectionReusableView"];
        DonutNotes_HeadCollectionReusableView *tempHeaderView = (DonutNotes_HeadCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DonutNotes_HeadCollectionReusableView" forIndexPath:indexPath];

        if(indexPath.section == 0){
            tempHeaderView.tect.text = @"Find the name";
        }else if (indexPath.section == 1){
            tempHeaderView.tect.text = @"Find the stars";
        }else{
            tempHeaderView.tect.text = @"Find the beat";
        }
        return  tempHeaderView;
        
    }else{
        [collectionView registerNib:[UINib nibWithNibName:@"DonutNotes_FootCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DonutNotes_FootCollectionReusableView"];
        DonutNotes_FootCollectionReusableView *tempFooterView = (DonutNotes_FootCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"DonutNotes_FootCollectionReusableView" forIndexPath:indexPath];
        return tempFooterView;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if kiPhone5 {
        return CGSizeMake(85, 85);
    }else{
        return CGSizeMake(102, 102);
    }
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGFloat top = 64;
        if IS_IPHONE_X_orMore {
            top = 88;
        }
        CGRect frame = CGRectMake(0, top, Iphone_Width, Iphone_Height-top);
       _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"DonutNotes_RecordCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DonutNotes_RecordCollectionViewCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
         _flowLayout.itemSize = CGSizeMake(102, 102);
        if kiPhone5 {
            _flowLayout.itemSize = CGSizeMake(85, 85);
        }
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);;
    }
    return _flowLayout;
}
- (NSMutableArray *)itemBg{
    if(_itemBg == nil){
        _itemBg = [[NSMutableArray alloc]initWithArray:@[@"donuts",@"donuts2",@"donuts3",@"donuts4",@"donuts5"]];
    }
    return _itemBg;
}
- (NSMutableArray *)dataOne{
    if(_dataOne == nil){
        _dataOne = [[NSMutableArray alloc]init];
    }
    return _dataOne;
}
- (NSMutableArray *)dataTwo{
    if(_dataTwo == nil){
        _dataTwo = [[NSMutableArray alloc]init];
    }
    return _dataTwo;
}
- (NSMutableArray *)dataThree{
    if(_dataThree == nil){
        _dataThree = [[NSMutableArray alloc]init];
    }
    return _dataThree;
}
@end
