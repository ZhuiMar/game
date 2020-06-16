//
//  HWGChooseVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGChooseVC.h"

@interface HWGChooseVC ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) NSMutableArray *states;

@property (nonatomic,strong) UIButton *goBtn;
@property (nonatomic,copy) NSString *zimu;
@property (nonatomic,assign) BOOL isSelect;

@end

@implementation HWGChooseVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImageView *imaheView = [[UIImageView alloc]init];
    imaheView.frame = CGRectMake(0, 0, 100, 20);
    imaheView.image = [UIImage imageNamed:@"4_Choose"];
    self.navigationItem.titleView = imaheView;
    [self.goBtn setHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.goBtn setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.goBtn];
    self.isSelect = NO;
    [self.goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(64);
        make.height.mas_equalTo(64);
        make.bottom.mas_equalTo(-29);
        make.centerX.mas_equalTo(window.mas_centerX);
    }];
}

- (void)clcikGoBtn:(UIButton *)buttion{
    if(self.isSelect == YES){
        HWGDrawVC *drawVC = [[HWGDrawVC alloc]initWith:self.zimu];
        [self.navigationController pushViewController:drawVC animated:YES];
        [self.goBtn setHidden:YES];
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.datas.count;
}
- (HWGZiMuCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HWGZiMuCell *cell = (HWGZiMuCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HWGZiMuCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.datas[indexPath.row];
    cell.subTitleLabel.text = self.datas[indexPath.row];
    NSString *state = self.states[indexPath.row];
    if([state isEqualToString:@"1"]){
        cell.bgView.layer.borderColor = [UIColor colorWithHexString:@"#D7D41E"].CGColor;
        cell.bgView.layer.borderWidth = 2;
    }else{
        cell.bgView.layer.borderColor = [UIColor clearColor].CGColor;
        cell.bgView.layer.borderWidth = 2;
    }
    self.isSelect = YES;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.states removeAllObjects];
    for (int i = 0; i < 26; i ++){
        NSString *str = [[NSString alloc]init];
        str = @"0";
        [self.states addObject:str];
    }
    [self.states removeObjectAtIndex:indexPath.row];
    [self.states insertObject:@"1" atIndex:indexPath.row];
    self.zimu = self.datas[indexPath.row];
    [self.collectionView reloadData];
}

- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(158, 123);
        if kiPhone5 {
            _flowLayout.itemSize = CGSizeMake(135, 100);
        }
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
        [_collectionView registerNib:[UINib nibWithNibName:@"HWGZiMuCell" bundle:nil] forCellWithReuseIdentifier:@"HWGZiMuCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (NSMutableArray *)datas{
    if(_datas == nil){
        _datas = [[NSMutableArray alloc]initWithArray:@[@"A",
                                                        @"B",
                                                        @"C",
                                                        @"D",
                                                        @"E",
                                                        @"F",
                                                        @"G",
                                                        @"H",
                                                        @"I",
                                                        @"J",
                                                        @"K",
                                                        @"L",
                                                        @"M",
                                                        @"N",
                                                        @"O",
                                                        @"P",
                                                        @"Q",
                                                        @"R",
                                                        @"S",
                                                        @"T",
                                                        @"U",
                                                        @"V",
                                                        @"W",
                                                        @"X",
                                                        @"Y",
                                                        @"Z"]];
    }
    return _datas;
}

- (UIButton *)goBtn{
    if(_goBtn == nil){
        _goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goBtn addTarget:self action:@selector(clcikGoBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_goBtn setBackgroundImage:[UIImage imageNamed:@"4_GO"] forState:UIControlStateNormal];
    }
    return _goBtn;
}
- (NSMutableArray *)states{
    if(_states == nil){
        _states = [[NSMutableArray alloc]initWithArray:@[@"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0",
                                                         @"0"]];
    }
    return _states;
}

@end
