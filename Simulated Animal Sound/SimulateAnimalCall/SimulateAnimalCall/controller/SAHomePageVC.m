//
//  SAHomePageVC.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAHomePageVC.h"

@interface SAHomePageVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UIBarButtonItem *leftBtn;
@property(nonatomic,strong) UIBarButtonItem *rightBtn;

@property(nonatomic,strong) SASearchView *searchView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong) SAMenuView *menuView;

@property(nonatomic,copy) NSString *selfType;
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UIButton *refreshBtn;
@property(nonatomic,strong) NSMutableArray *datas;

@property(nonatomic,strong) NSMutableArray *totalArr;
@property (weak, nonatomic) IBOutlet UILabel *noneLabel;

@end

@implementation SAHomePageVC

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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSearchView];
    [self.view addSubview:self.collectionView];
    
    CGFloat top = 64;
    if kiPhone5 { top = 64;}
    if IS_IPHONE_X_orMore {top = 88;}
    
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(top);
        make.left.mas_equalTo(20);
        make.height.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.menuView];
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(top);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.refreshBtn];
    [self.refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(top);
        make.width.mas_equalTo(55/2);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(48/2);
    }];
    
    self.titleLabel.text = @"News";
    [self setDatasWith:self.titleLabel.text];
    [[NSNotificationCenter defaultCenter] postNotificationName:BaseColor object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homePage:) name:BgColor object:nil];
}

- (void)homePage:(NSNotification *)info{
    [NSObject findFromeController:self];
}

- (void)setSearchView{
    self.view.backgroundColor = [NSObject colorWithHexString:BgColor];
    self.navigationItem.leftBarButtonItem = self.leftBtn;
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    view.frame = CGRectMake(0, 0, 200, 40);
    [view addSubview:self.searchView];
    self.navigationItem.titleView = view;
}

- (void)clcikMenu:(UIButton *)buttion{
    [self.menuView setHidden:NO];
    [UIView animateWithDuration:0.3 animations:^{
        [self.menuView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(120);
        }];
        [self.view layoutIfNeeded];
    }];
    [self.menuView roadData];
}

// refresh
- (void)clickRefresh:(UIButton *)buttion{
    
    self.titleLabel.text = @"News";
    [self setDatasWith:self.titleLabel.text];
    self.searchView.textFiled.text = @"";
    [self.searchView.tishi setHidden:NO];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.menuView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
        [self.menuView setHidden:YES];
        [self.view layoutIfNeeded];
    }];
}

- (void)setDatasWith:(NSString *)title{
    
    [self.datas removeAllObjects];
    
    if([title isEqualToString:@"News"]){
       NSMutableArray *randomArray = [[NSMutableArray alloc] init];
        while ([randomArray count] < self.totalArr.count) {
           int r = arc4random() % [self.totalArr count];
            [randomArray addObject:[self.totalArr objectAtIndex:r]];
       }
       NSArray *newarr = [randomArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
       for (NSString *str in newarr) {
            [self.datas addObject:str];
       }
    }else if([title isEqualToString:@"Beasts"]){
        self.datas = [[NSMutableArray alloc]initWithArray:@[@"cow",@"elephant",@"monkey",@"tiger"]];
    }else if([title isEqualToString:@"Birds"]){
        self.datas = [[NSMutableArray alloc]initWithArray:@[@"kingfisher",@"chicken"]];
    }else if([title isEqualToString:@"Insect"]){
        self.datas = [[NSMutableArray alloc]initWithArray:@[@"cricket",@"cicadas"]];
    }else if([title isEqualToString:@"Other"]){
        for (NSString *str in self.totalArr) {
             [self.datas addObject:str];
        }
    }
    [self noneView];
}

- (void)clcikCancel:(UIButton *)buttion{
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}
- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SAAnimalCell *cell = (SAAnimalCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SAAnimalCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.datas[indexPath.row]];
    cell.nameLabel.text = self.datas[indexPath.row];
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
    NSString *name = self.datas[indexPath.row];
    SAPlayVC *play = [[SAPlayVC alloc]initWithType:name];
    [self yc_bottomPresentController:play presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {}];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.menuView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
        [self.menuView setHidden:YES];
        [self.view layoutIfNeeded];
    }];
}

- (SASearchView *)searchView{
    if(_searchView == nil){
        _searchView = [SASearchView getSearchViewText:^(NSString * text) {
            if([self.totalArr containsObject:text]){
                [self.datas removeAllObjects];
                [self.datas addObject:text];
                [self noneView];
            }else{
                [self.datas removeAllObjects];
                [self noneView];
            }
        }];
        _searchView.layer.cornerRadius = 6;
        _searchView.layer.masksToBounds = YES;
    }
    return _searchView;
}

- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        CGFloat top = 64 + 40;
        if kiPhone5 {
            top = 64 + 40;
        }
        if IS_IPHONE_X_orMore {
            top = 88 + 40;
        }
        CGRect frame = CGRectMake(0, top, Iphone_Width, Iphone_Height-top-54+5);
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
- (UIBarButtonItem *)leftBtn{
    if(_leftBtn == nil){
       UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
       btn.frame = CGRectMake(0, 0, 20, 18);
       [btn setBackgroundImage:[UIImage imageNamed:@"1_list_btn"] forState:UIControlStateNormal];
       [btn addTarget:self action:@selector(clcikMenu:) forControlEvents:UIControlEventTouchUpInside];
       _leftBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _leftBtn;
}
- (UIBarButtonItem *)rightBtn{
    if(_rightBtn == nil){
       UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
       btn.frame = CGRectMake(0, 0, 20, 18);
       [btn setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
       [btn addTarget:self action:@selector(clcikCancel:) forControlEvents:UIControlEventTouchUpInside];
       _rightBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _leftBtn;
}
- (SAMenuView *)menuView{
    if(_menuView == nil){
        _menuView = [SAMenuView getMenuViewMenuClass:^(NSString * text) {
            [UIView animateWithDuration:0.3 animations:^{
                [self.menuView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(0);
                }];
                [self.menuView setHidden:YES];
                [self.view layoutIfNeeded];
    
                self.titleLabel.text = text;
                [self setDatasWith:self.titleLabel.text];
            }];
            self.selfType = text;
        }];
    }
    return _menuView;
}
- (UILabel *)titleLabel{
    if(_titleLabel == nil){
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}
- (NSMutableArray *)datas{
    if(_datas == nil){
        _datas = [[NSMutableArray alloc]init];
    }
    return _datas;
}
- (UIButton *)refreshBtn{
    if(_refreshBtn == nil){
        _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_refreshBtn setBackgroundImage:[UIImage imageNamed:@"1_refresh"] forState:UIControlStateNormal];
        [_refreshBtn addTarget:self action:@selector(clickRefresh:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _refreshBtn;
}

- (NSMutableArray *)totalArr{
    if (_totalArr == nil){
        _totalArr = [[NSMutableArray alloc]initWithArray:@[@"chicken",
                                                        @"cicadas",
                                                        @"cow",
                                                        @"cricket",
                                                        @"dog",
                                                        @"donkey",
                                                        @"elephant",
                                                        @"kingfisher",
                                                        @"monkey",
                                                        @"rabbit",
                                                        @"sheep",
                                                        @"tiger",
                                                        @"zebra"]];
    }
    return _totalArr;
}

@end

