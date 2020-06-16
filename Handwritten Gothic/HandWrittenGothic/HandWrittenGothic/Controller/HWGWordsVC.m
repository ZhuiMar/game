//
//  HWGWordsVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGWordsVC.h"

@interface HWGWordsVC ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *empyImageView;

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong) NSMutableArray *images;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *w;

@end

@implementation HWGWordsVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImageView *imaheView = [[UIImageView alloc]init];
    imaheView.frame = CGRectMake(0, 0, 100, 20);
    imaheView.image = [UIImage imageNamed:@"7_tittle"];
    self.navigationItem.titleView = imaheView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.images.count == 0 || self.images == nil){
        [self.empyImageView setHidden:NO];
    }else{
        [self.empyImageView setHidden:YES];
        [self.view addSubview:self.collectionView];
    }
    if kiPhone5 {
        self.H.constant = 400;
        self.w.constant = 300;
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}
- (HWGWordsCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HWGWordsCell *cell = (HWGWordsCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HWGWordsCell" forIndexPath:indexPath];
    cell.imageView.image = self.images[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(300, 180);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);;
    }
    return _flowLayout;
}
- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGRect frame = CGRectMake(0, 0, Iphone_Width, Iphone_Height);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"HWGWordsCell" bundle:nil] forCellWithReuseIdentifier:@"HWGWordsCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (NSMutableArray *)images{
    if(_images == nil){
       _images = [[NSMutableArray alloc]init];
       NSString *path_sandox = NSHomeDirectory();
       NSString *newPath = [path_sandox stringByAppendingPathComponent:@"/Documents/pic.plist"];
       NSArray *data2 = [NSArray arrayWithContentsOfFile:newPath];
       if(data2 != nil && data2.count > 0){
            for (NSString *imageStr in data2) {
                NSData *imageData = [[NSData alloc] initWithBase64EncodedString:imageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
                UIImage *image = [UIImage imageWithData:imageData];
                [self.images addObject:image];
            }
       }
    }
    return _images;
}
@end
