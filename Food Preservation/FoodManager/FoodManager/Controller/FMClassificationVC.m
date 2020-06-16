//
//  FMClassificationVC.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/13.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMClassificationVC.h"

@interface FMClassificationVC ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
FMAddClassVCDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *datas;

@end

@implementation FMClassificationVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Classification";
    [self getDatas];
}

- (void)getDatas{
    
    RLMResults *results = [FMFoodClass allObjects];
    NSLog(@"%@",results);
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (FMFoodClass *class in results) {
        [arr addObject:class.className];
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSString * str in arr) {
        [dict setObject:str forKey:str];
    }
    
    [self.datas removeAllObjects];
    NSArray *arrs = [dict allKeys];
    for (NSString *string in arrs) {
        [self.datas addObject:string];
    }
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.datas.count + 1;
}
- (FMClassCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FMClassCell *cell = (FMClassCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMClassCell" forIndexPath:indexPath];
    if(indexPath.row == self.datas.count){
        cell.imageView.image = [UIImage imageNamed:@"Add"];
        cell.imageName.text = @"Add";
    }else{
        NSString *className = self.datas[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[self handleImageNameClass:className]];
        cell.imageName.text = className;
        cell.title = className;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == self.datas.count){
        FMAddClassVC *addClassVC = [[FMAddClassVC alloc]init];
        addClassVC.delegate = self;
        CGFloat with = 340;
        CGFloat height = 180;
        if(kiPhone5){
            with = 270;
            height = 160;
        }
        [self yc_centerPresentController:addClassVC presentedSize:CGSizeMake(with, height) completeHandle:nil];
    }
    else{
        FMClassCell *cell = (FMClassCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
        FMFoodDetialVC *foodDetialVC = [[FMFoodDetialVC alloc]initWithTittle:cell.title];
        [self.navigationController pushViewController:foodDetialVC animated:YES];
    }
}

- (void)okActionWithName:(NSString *)name{
    RLMResults *results = [FMFoodClass allObjects];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (FMFoodClass *class in results) {
        [arr addObject:class.className];
    }
    if(![arr containsObject:name]){
        FMFoodClass *class = [[FMFoodClass alloc]init];
        class.className = [NSString firstCharacterAcapital:name];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:class];
        }];
        RLMResults *results = [FMFoodClass allObjects];
        NSLog(@"%@",results);
    }
    [self getDatas];
}

- (NSString *)handleImageNameClass:(NSString *)className{
    NSString *string;
    if ([className isEqualToString:@"Egg"]) {
        string = @"Egg";
    }else if ([className isEqualToString:@"Milk"]){
        string = @"Milk";
    }else if ([className isEqualToString:@"Fish"]){
        string = @"Fish";
    }else if ([className isEqualToString:@"Vegetable"]){
        string = @"Vegetable";
    }else if ([className isEqualToString:@"Meat"]){
        string = @"Meat";
    }else if ([className isEqualToString:@"Dessert"]){
        string = @"";
    }else if ([className isEqualToString:@"Fruit"]){
        string = @"Fruit";
    }else if ([className isEqualToString:@"Other"]){
        string = @"Other";
    }else{
        string = @"Other";
    }
    return string;
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGRect frame = CGRectMake(0, 0, Iphone_Width, Iphone_Height);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"FMClassCell" bundle:nil] forCellWithReuseIdentifier:@"FMClassCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(90, 120);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);;
    }
    return _flowLayout;
}
- (NSMutableArray *)datas{
    if (_datas == nil) {
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}
@end
