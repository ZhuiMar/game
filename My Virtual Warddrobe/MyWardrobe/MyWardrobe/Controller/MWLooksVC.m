//
//  MWLooksVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWLooksVC.h"

@interface MWLooksVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,MWAddLooksVCDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSMutableArray *wordArray;
@property (nonatomic,copy) NSString *titleStr;


@property (weak, nonatomic) IBOutlet UIButton *buttion;
@property (weak, nonatomic) IBOutlet UIImageView *addImage;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation MWLooksVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Looks";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addBgView.layer.cornerRadius = 8;
    self.addBgView.layer.masksToBounds = YES;
    
    [self.view addSubview:self.collectionView];
    [self refreshData];
}

- (IBAction)addAction:(id)sender {
    MWAddLooksVC *vc = [[MWAddLooksVC alloc]initWithType:@"Add"];
    vc.delegate = self;
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.wordArray.count > 0){
        return self.wordArray.count + 1;
    }else{
        return self.wordArray.count;
    }
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.wordArray>0 && indexPath.row == self.wordArray.count){
        
        MWAddLookCell *cell = (MWAddLookCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MWAddLookCell" forIndexPath:indexPath];
        return  (UITableViewCell *)cell;
        
    }else{
        
        MWWardrobeCell *cell = (MWWardrobeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MWWardrobeCell" forIndexPath:indexPath];
        MWLooks *model = self.wordArray[indexPath.row];
        NSString *base64 = [NSString getStringWithFileName:model.imageName];
        if(base64 == nil){
            cell.imageView.backgroundColor = [UIColor whiteColor];
        }else{
            cell.imageView.image = [UIImage decodeBase64ToImage:base64];
        }
        cell.imageName.text = model.top;
        return (UITableViewCell *)cell;
    }
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
    
    if(self.wordArray>0 && indexPath.row == self.wordArray.count){
    
       MWAddLooksVC *vc = [[MWAddLooksVC alloc]initWithType:@"Add"];
       vc.delegate = self;
       [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        
    }else{
        
       MWLooks *look = self.wordArray[indexPath.row];
       MWAddLooksVC *vc = [[MWAddLooksVC alloc]initWithType:look.name];
       vc.delegate = self;
       [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
    }
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
        CGRect frame = CGRectMake(0, top, Iphone_Width, Iphone_Height-top);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"MWWardrobeCell" bundle:nil] forCellWithReuseIdentifier:@"MWWardrobeCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"MWAddLookCell" bundle:nil] forCellWithReuseIdentifier:@"MWAddLookCell"];
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

- (void)saveReloadData{
    [self refreshData];
}

- (void)refreshData{

    [self.wordArray removeAllObjects];
    RLMResults *results = [MWLooks allObjects];
    for (MWLooks *model in results) {
        [self.wordArray addObject:model];
    }
    if(self.wordArray.count > 0){
        
        [self.addImage setHidden:YES];
        [self.addBgView setHidden:YES];
        [self.textLabel setHidden:YES];
        [self.collectionView setHidden:NO];
        [self.collectionView reloadData];
    }else{
        
        [self.addImage setHidden:NO];
        [self.addBgView setHidden:NO];
        [self.textLabel setHidden:NO];
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
