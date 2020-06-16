//
//  MysteryBoard_ShowVC.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "MysteryBoard_ShowVC.h"

@interface MysteryBoard_ShowVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *ColorDatas;
@property (nonatomic,strong) NSMutableArray *FruitDatas;
@property (nonatomic,strong) NSMutableArray *AnimalDatas;

@property (nonatomic,assign) NSInteger type;

@end

@implementation MysteryBoard_ShowVC

- (instancetype)initWithTittle:(NSString *)tittle{
    if(self = [super init]){
        self.title = tittle;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
    if([self.title isEqualToString:@"Colour"]){
        self.type = 1;
        for (NSString *str in self.ColorDatas) {
            [self.datas addObject:str];
        }
    }else if ([self.title isEqualToString:@"Fruits"]){
        self.type = 2;
        for (NSString *str in self.FruitDatas) {
            [self.datas addObject:str];
        }
    }else{
        self.type = 3;
       for (NSString *str in self.AnimalDatas) {
            [self.datas addObject:str];
        }
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MysteryBoard_PlayItem *cell = (MysteryBoard_PlayItem *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MysteryBoard_PlayItem" forIndexPath:indexPath];
    [cell setData:self.datas[indexPath.row] type:self.type];
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
    if iPhone5 {
        return CGSizeMake(135, 160);
    }
    else if iPhoneX_MORE {
        return CGSizeMake(190, 195);
    }
    else{
        return CGSizeMake(175, 195);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MysteryBoard_PlayItem *cell = (MysteryBoard_PlayItem *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGFloat top = 64;
        if iPhoneX_MORE {
            top = 88;
        }
        CGRect frame = CGRectMake(0, top, Iphone_Width, Iphone_Height-top);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"MysteryBoard_PlayItem" bundle:nil] forCellWithReuseIdentifier:@"MysteryBoard_PlayItem"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        if iPhone5 {
            _flowLayout.itemSize = CGSizeMake(135, 160);
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        }
        else if iPhoneX_MORE {
            _flowLayout.itemSize = CGSizeMake(190, 190);
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        }
        else{
            _flowLayout.itemSize = CGSizeMake(175, 190);
            _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
            _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        }
    }
    return _flowLayout;
}
- (NSMutableArray *)ColorDatas{
    if(_ColorDatas == nil){
        _ColorDatas = [[NSMutableArray alloc]initWithArray:@[@"red",@"white",@"yellow",@"green",@"blue",@"purple",@"cyan",@"gray"]];
    }
    return _ColorDatas;
}
- (NSMutableArray *)FruitDatas{
    if(_FruitDatas == nil){
        _FruitDatas = [[NSMutableArray alloc]initWithArray:@[@"apple",@"banana",@"cherry",@"grape",@"lemon",@"mango",@"orange",@"pear"]];
    }
    return _FruitDatas;
}
- (NSMutableArray *)AnimalDatas{
    if(_AnimalDatas == nil){
       _AnimalDatas = [[NSMutableArray alloc]initWithArray:@[@"bear",@"bird",@"cat",@"dolphin",@"monkey",@"panda",@"pig",@"tiger"]];
    }
    return _AnimalDatas;
}
- (NSMutableArray *)datas{
    if(_datas == nil){
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}

@end
