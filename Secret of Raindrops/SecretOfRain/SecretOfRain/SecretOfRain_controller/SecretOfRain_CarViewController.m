//
//  SecretOfRain_CarViewController.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_CarViewController.h"

@interface SecretOfRain_CarViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *questions;
@property (nonatomic,strong) NSMutableArray *score;

@property(nonatomic, strong) SecretOfRain_countView *rightView;
@property(nonatomic, assign) NSInteger count;

@property (nonatomic,strong) UIBarButtonItem *item;


@end

@implementation SecretOfRain_CarViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Card";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.navigationItem.rightBarButtonItem = self.item;
    
    SecretOfRain_navigate *navi = (SecretOfRain_navigate *)self.navigationController;
    navi.backBlock = ^{
        NSArray *arr = self.navigationController.viewControllers;
        if([arr[1] isKindOfClass:[SecretOfRain_ChooseDifficulty class]]){
            [self.navigationController popToViewController:arr[1] animated:YES];
        }else{
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    };
    
    NSInteger total = 0;
    NSArray *arr1 = [NSObject SecretOfRain_getRankingKey:@"SecretOfRain_1"];
    NSArray *arr2 = [NSObject SecretOfRain_getRankingKey:@"SecretOfRain_2"];
    NSArray *arr3 = [NSObject SecretOfRain_getRankingKey:@"SecretOfRain_3"];
    
    for (NSNumber *num in arr1) {
        total = total + [num integerValue];
    }
    for (NSNumber *num in arr2) {
        total = total + [num integerValue];
    }
    for (NSNumber *num in arr3) {
        total = total + [num integerValue];
    }
    [self.rightView setTittleCount:total];
    self.count = total;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.questions.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SecretOfRain_CarCell *cell = (SecretOfRain_CarCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SecretOfRain_CarCell" forIndexPath:indexPath];
    [cell.scoreBtn setTitle:self.score[indexPath.row] forState:UIControlStateNormal];
    cell.question.text = self.questions[indexPath.row];
    cell.number = [self.score[indexPath.row] integerValue];

    if(cell.number > self.count){
        cell.contentView.alpha = 0.7;
        cell.question.alpha = 0.1;
    }
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
    if kiPhone5 {
        return CGSizeMake(300, 80);
    }else {
        return CGSizeMake(345, 89);
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
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"SecretOfRain_CarCell" bundle:nil] forCellWithReuseIdentifier:@"SecretOfRain_CarCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(345, 89);
       _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
       _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return _flowLayout;
}

- (NSMutableArray *)questions{
    if(_questions == nil){
        _questions = [[NSMutableArray alloc]initWithArray:@[@"Snails are the most toothed animals on earth, with more than 20,000 teeth.",
                                                        @"Hot water extinguishes fire better than cold water.",
                                                        @"Your eye muscles work up to 100,000 times a day.",
                                                        @"The lighter was invented before the match.",
                                                        @"The giraffe can't cough.",
                                                        @"Drink vinegar when you have hiccups. It's very effective.",
                                                        @"Chocolate was used as currency long ago.",
                                                        @"Spicy is not taste, but pain.",
                                                        @"Bamboo is a grass, not a tree.",
                                                        @"Seventy percent of the earth's surface is covered with water."]];
    }
    return _questions;
}

- (NSMutableArray *)score{
    if(_score == nil){
        _score = [[NSMutableArray alloc]initWithArray:@[@"10",@"30",@"50",@"100",@"300",@"500",@"1000",@"3000",@"5000",@"10000"]];
    }
    return _score;
}



- (SecretOfRain_countView *)rightView{
    if(_rightView == nil){
        _rightView = [SecretOfRain_countView getSecretOfRain_countView];
        _rightView.frame = CGRectMake(0, 0, 80, 30);
    }
    return _rightView;
}

- (UIBarButtonItem *)item{
    if(_item == nil){
        UIButton *Buttion = [UIButton buttonWithType:UIButtonTypeCustom];
        Buttion.frame = CGRectMake(0, 0, 80, 30);
        [Buttion addSubview:self.rightView];
        _item = [[UIBarButtonItem alloc]initWithCustomView:Buttion];
    }
    return _item;
}

@end

