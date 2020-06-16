//
//  CatchBall_RankingView.m
//  RushingToCatch
//
//  Created by zy on 2020/6/1.
//  Copyright © 2020 shijicheng. All rights reserved.
//

#import "CatchBall_RankingView.h"

@interface CatchBall_RankingView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UIView *collectBg;

@property (weak, nonatomic) IBOutlet UILabel *challLabel;
@property (weak, nonatomic) IBOutlet UILabel *ariLabel;

@property (weak, nonatomic) IBOutlet UIView *challView;
@property (weak, nonatomic) IBOutlet UIView *arithView;

@end


@implementation CatchBall_RankingView


- (IBAction)challButtionAction:(id)sender {
    self.challLabel.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
    self.challView.backgroundColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
    self.ariLabel.textColor = [UIColor blackColor];
    self.arithView.backgroundColor = [UIColor blackColor];
    
    [self.array removeAllObjects];
    
    RLMResults *reuslt = [CatchBall_RankModel objectsWhere:@"type == %@",@"pass"];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (CatchBall_RankModel *model in reuslt) {
        [arr addObject:model];
    }
    NSArray *sortArray = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CatchBall_RankModel *model1 = obj1;
        CatchBall_RankModel *model2 = obj2;
        if ([model1.score floatValue] < [model2.score floatValue]) {
            return NSOrderedDescending;
        }
        else if ([model1.score floatValue] < [model2.score floatValue]){
            return NSOrderedAscending;
        }
        else {
            return NSOrderedSame;
        }
    }];

    for (CatchBall_RankModel *model in sortArray) {
        [self.array addObject:model];
        if(self.array.count == 10){
            break;
        }
    }
    [self.collectionView reloadData];
}
- (IBAction)arithAction:(id)sender {
    self.ariLabel.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
    self.arithView.backgroundColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
    self.challLabel.textColor = [UIColor blackColor];
    self.challView.backgroundColor = [UIColor blackColor];
    
    [self.array removeAllObjects];
    
    RLMResults *reuslt = [CatchBall_RankModel objectsWhere:@"type == %@",@"math"];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (CatchBall_RankModel *model in reuslt) {
        [arr addObject:model];
    }
    NSArray *sortArray = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CatchBall_RankModel *model1 = obj1;
        CatchBall_RankModel *model2 = obj2;
        if ([model1.score floatValue] < [model2.score floatValue]) {
            return NSOrderedDescending;
        }
        else if ([model1.score floatValue] < [model2.score floatValue]){
            return NSOrderedAscending;
        }
        else {
            return NSOrderedSame;
        }
    }];

    for (CatchBall_RankModel *model in sortArray) {
        [self.array addObject:model];
        if(self.array.count == 10){
            break;
        }
    }
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Leaderboard(top10)";
    [self.collectBg addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    self.challLabel.textColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
    self.challView.backgroundColor = [NSObject CatchBallcolorWithHexString:@"#FF460D"];
    self.ariLabel.textColor = [UIColor blackColor];
    self.arithView.backgroundColor = [UIColor blackColor];
    
    [self.collectionView reloadData];
    RLMResults *reuslt = [CatchBall_RankModel objectsWhere:@"type == %@",@"pass"];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (CatchBall_RankModel *model in reuslt) {
        [arr addObject:model];
    }
    NSArray *sortArray = [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CatchBall_RankModel *model1 = obj1;
        CatchBall_RankModel *model2 = obj2;
        if ([model1.score floatValue] < [model2.score floatValue]) {
            return NSOrderedDescending;
        }
        else if ([model1.score floatValue] < [model2.score floatValue]){
            return NSOrderedAscending;
        }
        else {
            return NSOrderedSame;
        }
    }];
   
    for (CatchBall_RankModel *model in sortArray) {
        [self.array addObject:model];
        if(self.array.count == 10){
            break;
        }
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
    CatchBall_RankingCell *cell = (CatchBall_RankingCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CatchBall_RankingCell" forIndexPath:indexPath];
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    cell.tag = indexPath.row + 100;
    [cell setModel:self.array[indexPath.row]];
    return (UITableViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(300, 25);
}


- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGRect frame = CGRectMake(0, 0, 0,0);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"CatchBall_RankingCell" bundle:nil] forCellWithReuseIdentifier:@"CatchBall_RankingCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
       _flowLayout = [[UICollectionViewFlowLayout alloc]init];
       _flowLayout.itemSize = CGSizeMake(300, 25);
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
