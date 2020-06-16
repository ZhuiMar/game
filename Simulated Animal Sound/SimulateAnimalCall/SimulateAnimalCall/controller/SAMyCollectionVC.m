//
//  SAMyCollectionVC.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAMyCollectionVC.h"

@interface SAMyCollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,assign) NSInteger selfType;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *datas;
@property (weak, nonatomic) IBOutlet UILabel *noneLabel;

@end

@implementation SAMyCollectionVC

- (void)noneView{
    if(self.datas.count == 0){
        [self.noneLabel setHidden:NO];
        [self.collectionView setHidden:YES];
    }else{
        [self.noneLabel setHidden:YES];
        [self.collectionView setHidden:NO];
        [self.collectionView reloadData];
    }
}

- (instancetype)initWithType:(NSInteger)type{
    if(self = [super init]){
        self.selfType = type;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(self.selfType == 0){
        self.navigationItem.title = @"History";
    }else{
        self.navigationItem.title = @"My collection";
    }
    [self getData];
}

- (void)getData{
    RLMResults *results = [SAAnimalDataModel allObjects];
    if(self.selfType == 0){
        for (SAAnimalDataModel *model in results) {
            if([model.type isEqualToString:@"SA_play"]){
                [self.datas addObject:model];
            }
        }
    }else{
        for (SAAnimalDataModel *model in results) {
            if([model.type isEqualToString:@"SA_collection"]){
                [self.datas addObject:model];
            }
        }
    }
    [self noneView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SAAnimalCell *cell = (SAAnimalCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SAAnimalCell" forIndexPath:indexPath];
    SAAnimalDataModel *model = self.datas[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:model.name];
    cell.nameLabel.text = model.name;
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
    SAAnimalDataModel *model = self.datas[indexPath.row];
    SAPlayVC *play = [[SAPlayVC alloc]initWithType:model.name];
    [self yc_bottomPresentController:play presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {}];
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGFloat top = 64;
        if kiPhone5 {
            top = 64;
        }
        if IS_IPHONE_X_orMore {
            top = 88;
        }
        CGRect frame = CGRectMake(0, top, Iphone_Width, Iphone_Height-top-54);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"SAAnimalCell" bundle:nil] forCellWithReuseIdentifier:@"SAAnimalCell"];
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

- (NSMutableArray *)datas{
    if(_datas == nil){
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}

@end
