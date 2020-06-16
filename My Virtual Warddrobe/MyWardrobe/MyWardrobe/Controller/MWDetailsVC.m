//
//  MWDetailsVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWDetailsVC.h"

@interface MWDetailsVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,MWEditorvcDelaagate>

@property (weak, nonatomic) IBOutlet UIImageView *topimageView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowimage;

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *wordArray;
@property (nonatomic,copy) NSString *titleStr;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addHeight;

@end

@implementation MWDetailsVC

- (instancetype)initWithTitle:(NSString *)title{
    if(self = [super init]){
        self.titleStr = title;
    }
    return self;
}

- (void)saveAction{
    [self refreshData];
}
- (void)deleteAction{
    [self refreshData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.titleStr;
    if IS_IPHONE_X_orMore {
        self.buttomLayout.constant = 34;
    }else{
        self.buttomLayout.constant = 0;
    }
    self.topimageView.image = [UIImage imageNamed:self.titleStr];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self refreshData];
}

- (IBAction)addAction:(id)sender {
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.wordArray.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MWWardrobeCell *cell = (MWWardrobeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MWWardrobeCell" forIndexPath:indexPath];
    MWClothes *model = self.wordArray[indexPath.row];
    NSString *base64 = [NSString getStringWithFileName:model.imageName];
    if(base64 == nil){
        cell.imageView.backgroundColor = [UIColor whiteColor];
    }else{
        cell.imageView.image = [UIImage decodeBase64ToImage:base64];
    }
    
    cell.imageName.text = model.name;
    cell.tittle = model.name;
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
    MWClothes *model = self.wordArray[indexPath.row];
    MWEditorvc *detailsVC = [[MWEditorvc alloc]initWithData:model];
    detailsVC.delegate = self;
    [self yc_bottomPresentController:detailsVC presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
    }];
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

- (IBAction)addBtnAction:(id)sender {
    MWAddVC *vc = [[MWAddVC alloc]initWithType:self.titleStr];
    vc.saveBlock = ^{
        [self refreshData];
    };
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {}];
}

- (void)refreshData{

    [self.wordArray removeAllObjects];
    RLMResults *results = [MWClothes allObjects];
    for (MWClothes *model in results) {
        if([model.type isEqualToString:self.titleStr]){
            [self.wordArray addObject:model];
        }
    }
    if(self.wordArray.count > 0){
        [self.topimageView setHidden:YES];
        [self.titlelabel setHidden:YES];
        [self.subTitleLabel setHidden:YES];
        [self.arrowimage setHidden:YES];
        [self.collectionView setHidden:NO];
        [self.collectionView reloadData];
    }else{
        [self.topimageView setHidden:NO];
        [self.titlelabel setHidden:NO];
        [self.subTitleLabel setHidden:NO];
        [self.arrowimage setHidden:NO];
        [self.collectionView setHidden:YES];
    }
}

- (NSMutableArray *)wordArray{
    if(_wordArray == nil){
        _wordArray = [[NSMutableArray alloc]init];
    }
    return _wordArray;
}

@end
