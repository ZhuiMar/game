//
//  FMFoodDetialVC.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/14.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMFoodDetialVC.h"

@interface FMFoodDetialVC ()<UICollectionViewDelegate,UICollectionViewDataSource,FMFooterDelegate,FMAddDetialsDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,copy) NSString *type;

@property (nonatomic, strong) NSMutableArray *normalArr;
@property (nonatomic, strong) NSMutableArray *recentlyArr;
@property (nonatomic, strong) NSMutableArray *nonArr;

@end

@implementation FMFoodDetialVC

- (instancetype)initWithTittle:(NSString *)title{
    if(self = [super init]){
        self.type = title;
    }
    return self;
}

- (void)getDatas{
    
    [self.nonArr removeAllObjects];
    [self.recentlyArr removeAllObjects];
    [self.normalArr removeAllObjects];
    
    RLMResults *results = [FMFoodClass objectsWhere:@"className==%@",self.type];
    
    NSLog(@"%@",results);
    
    for (FMFoodClass *class in results) {
        RLMArray *arr = class.foods;
        for (FMFood *food in arr) {
            NSInteger dd = [NSDate getDifferenceByDate:food.endTime];
            if(dd == 0 || dd > 0){
                [self.nonArr addObject:food];
            }else if (dd == -1){
                [self.recentlyArr addObject:food];
            }else if (dd < -1){
                [self.normalArr addObject:food];
            }
        }
    }
    [self.collectionView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.type;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self getDatas];
}

- (void)okAction{
    [self getDatas];
}

- (void)addFood{
    FMAddDetials *detialVC = [[FMAddDetials alloc]initWithType:self.type];
    detialVC.delegate = self;
    [self yc_bottomPresentController:detialVC presentedHeight:Iphone_Height completeHandle:nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0){
        if(self.normalArr.count == 0){
            return 1;
        }else{
            return self.normalArr.count;
        }
    }else if (section == 1){
        if(self.recentlyArr.count == 0){
            return 1;
        }else{
            return self.recentlyArr.count;
        }
    }else {
        if(self.nonArr.count == 0){
            return 1;
        }else{
            return self.nonArr.count;
        }
    }
}

- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0){
        if(self.normalArr.count == 0){
            FMNoneCell *cell = (FMNoneCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMNoneCell" forIndexPath:indexPath];
            return (UITableViewCell *)cell;
        }else{
            FMFoodCell *cell = (FMFoodCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMFoodCell" forIndexPath:indexPath];
            cell.imageView.image = [UIImage imageNamed:[self handleImageNameClass:self.type]];
            cell.name.text = self.type;
            return (UITableViewCell *)cell;
        }
    }else if (indexPath.section == 1){
        
        if(self.recentlyArr.count == 0){
            FMNoneCell *cell = (FMNoneCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMNoneCell" forIndexPath:indexPath];
            return (UITableViewCell *)cell;
        }else{
            FMFoodCell *cell = (FMFoodCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMFoodCell" forIndexPath:indexPath];
            cell.imageView.image = [UIImage imageNamed:[self handleImageNameClass:self.type]];
            cell.name.text = self.type;
            return (UITableViewCell *)cell;
        }

    }else {
        if(self.nonArr.count == 0){
            FMNoneCell *cell = (FMNoneCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMNoneCell" forIndexPath:indexPath];
            return (UITableViewCell *)cell;
        }else{
            FMFoodCell *cell = (FMFoodCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"FMFoodCell" forIndexPath:indexPath];
            cell.imageView.image = [UIImage imageNamed:[self handleImageNameClass:self.type]];
            cell.name.text = self.type;
            return (UITableViewCell *)cell;
        }
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(Iphone_Width, 50);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(Iphone_Width, 100);
    }else{
        return CGSizeMake(Iphone_Width, 0);
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView*)collectionView viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)indexPath;{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        [collectionView registerNib:[UINib nibWithNibName:@"FMSectionHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FMSectionHeader"];
        FMSectionHeader *tempHeaderView = (FMSectionHeader *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FMSectionHeader" forIndexPath:indexPath];
        
        if(indexPath.section == 0){
            tempHeaderView.titleLabel.text = @"Normal eating";
        }else if (indexPath.section == 1){
            tempHeaderView.titleLabel.text = @"Recently consumed";
        }else{
            tempHeaderView.titleLabel.text = @"Non-edible";
        }
        return  tempHeaderView;
        
    }else{
        
        [collectionView registerNib:[UINib nibWithNibName:@"FMFooter" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FMFooter"];
        FMFooter *tempFooterView = (FMFooter *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FMFooter" forIndexPath:indexPath];
        tempFooterView.delegate = self;
        return tempFooterView;
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(self.normalArr.count == 0){
            return CGSizeMake(Iphone_Width, 90);
        }else{
            return CGSizeMake(90, 90);
        }
    }else if (indexPath.section == 1){
        if(self.recentlyArr.count == 0){
            return CGSizeMake(Iphone_Width, 90);
        }else{
            return CGSizeMake(90, 90);
        }
    }else {
        if(self.nonArr.count == 0){
             return CGSizeMake(Iphone_Width, 90);
        }else{
            return CGSizeMake(90, 90);
        }
    }
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


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FMClassCell *cell = (FMClassCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    FMFood *food;
    if(indexPath.section == 0 && self.normalArr.count > 0){
        food = self.normalArr[indexPath.row];
    }else if (indexPath.section == 1 && self.recentlyArr.count > 0){
        food = self.recentlyArr[indexPath.row];
    }else if (indexPath.section == 2 && self.nonArr.count > 0){
        food = self.nonArr[indexPath.row];
    }
    FMDetialsVC *detialVC = [[FMDetialsVC alloc]init];
    
    detialVC.name = food.name;
    detialVC.data = [food.startTime stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    detialVC.shelf = food.shelfLife;
    
    NSInteger dd = [NSDate getDifferenceByDate:food.endTime];
    if(indexPath.section == 0){
        detialVC.time = [NSString stringWithFormat:@"%ld",-dd];
    }else if (indexPath.section == 1){
        detialVC.time = [NSString stringWithFormat:@"%ld",-dd];
    }else if (indexPath.section == 2){
        detialVC.time = [NSString stringWithFormat:@"%ld",0];
    }
    detialVC.note = food.note;
    [self yc_bottomPresentController:detialVC presentedHeight:Iphone_Height completeHandle:nil];
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGRect frame = CGRectMake(0, 0, Iphone_Width, Iphone_Height-64);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        [_collectionView registerNib:[UINib nibWithNibName:@"FMFoodCell" bundle:nil] forCellWithReuseIdentifier:@"FMFoodCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"FMNoneCell" bundle:nil] forCellWithReuseIdentifier:@"FMNoneCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(90, 90);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);;
    }
    return _flowLayout;
}
- (NSMutableArray *)normalArr{
    if(_normalArr == nil){
        _normalArr = [[NSMutableArray alloc]init];
    }
    return _normalArr;
}

- (NSMutableArray *)recentlyArr{
    if (_recentlyArr == nil) {
        _recentlyArr = [[NSMutableArray alloc]init];
    }
    return _recentlyArr;
}
- (NSMutableArray *)nonArr{
    if (_nonArr == nil) {
        _nonArr = [[NSMutableArray alloc]init];
    }
    return _nonArr;
}

@end
