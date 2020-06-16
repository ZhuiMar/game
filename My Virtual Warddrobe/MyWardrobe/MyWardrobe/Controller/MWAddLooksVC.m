//
//  MWAddLooksVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWAddLooksVC.h"

@interface MWAddLooksVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,strong) NSMutableArray *topArray;
@property (nonatomic,strong) NSMutableArray *bottomArray;
@property (nonatomic,strong) NSMutableArray *footerArray;

@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@property (nonatomic,copy) NSString *top;
@property (nonatomic,copy) NSString *bottom;
@property (nonatomic,copy) NSString *foot;

@property (nonatomic,copy) NSString *selfType;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLay;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wightLay;

@end

@implementation MWAddLooksVC

- (instancetype)initWithType:(NSString *)type{
    if(self = [super init]){
        self.selfType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.alertView.layer.cornerRadius = 10;
    self.alertView.layer.masksToBounds = YES;
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.alertView.userInteractionEnabled = YES;
    [self.alertView addSubview:self.collectionView];
    [self getData];
    
    if([self.selfType isEqualToString:@"Add"]){
        
    }else{
        [self.saveBtn setTitle:@"Delete" forState:UIControlStateNormal];
        self.titleLabel.text = self.selfType;
        [self.nameLabel setHidden:YES];
        [self.nameTf setHidden:YES];
        self.topLayout.constant = 28;
    }
    
    if kiPhone5 {
        self.wightLay.constant = Iphone_Width;
        self.heightLay.constant = Iphone_Height;
        self.alertView.layer.cornerRadius = 0;
        self.alertView.layer.masksToBounds = YES;
    }
}

- (void)getData{
    RLMResults *result1 = [MWClothes objectsWhere:@"type == 'Tops'"];
    for (MWClothes *clothes in result1) {
        [self.topArray addObject:clothes];
    }
    RLMResults *result2 = [MWClothes objectsWhere:@"type == 'Bottoms'"];
    for (MWClothes *clothes in result2) {
        [self.bottomArray addObject:clothes];
    }
    RLMResults *result3 = [MWClothes objectsWhere:@"type == 'Footwear'"];
    for (MWClothes *clothes in result3) {
        [self.footerArray addObject:clothes];
    }
}

- (IBAction)clodeActin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveAction:(id)sender {
    if([self.selfType isEqualToString:@"Add"]){
        if([self.nameTf.text isEqualToString:@""]){
            return;
        }
        if([self.top isEqualToString:@""] || [self.bottom isEqualToString:@""] || [self.foot isEqualToString:@""]){
            return;
        }
        
        MWLooks *lookModel = [[MWLooks alloc]init];
        lookModel.type = @"look";
        lookModel.top = self.top;
        lookModel.bottom = self.bottom;
        lookModel.foot = self.foot;
        lookModel.name = self.nameTf.text;
        
        if([self.top isEqualToString:@""] == NO){
            RLMResults *result1 = [MWClothes objectsWhere:@"name == %@",self.top];
            MWClothes *model = result1.firstObject;
            lookModel.imageName = model.imageName;
        }
        if([self.bottom isEqualToString:@""] == NO){
               RLMResults *result1 = [MWClothes objectsWhere:@"name == %@",self.bottom];
               MWClothes *model = result1.firstObject;
               lookModel.imageName = model.imageName;
        }
        if([self.foot isEqualToString:@""] == NO){
               RLMResults *result1 = [MWClothes objectsWhere:@"name == %@",self.foot];
               MWClothes *model = result1.firstObject;
               lookModel.imageName = model.imageName;
        }
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:lookModel];
        }];
        if([self.delegate respondsToSelector:@selector(saveReloadData)]){
            [self.delegate saveReloadData];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
     
        RLMRealm *realm = [RLMRealm defaultRealm];
        RLMResults *result = [MWLooks objectsWhere:@"name == %@",self.selfType];
        MWLooks *look = result.firstObject;
        
        NSString *top = look.top;
        NSString *bottom = look.bottom;
        NSString *foot = look.foot;
        
        if(top != nil || [top isEqualToString:@""] == NO){
            RLMResults *result1 = [MWClothes objectsWhere:@"name == %@",top];
            MWClothes *model = result1.firstObject;
            [realm transactionWithBlock:^{
                model.isSelect = @"0";
            }];
        }
        if(bottom != nil || [bottom isEqualToString:@""] == NO){
            RLMResults *result1 = [MWClothes objectsWhere:@"name == %@",bottom];
            MWClothes *model = result1.firstObject;
            [realm transactionWithBlock:^{
                model.isSelect = @"0";
            }];
        }
        if(foot != nil || [foot isEqualToString:@""] == NO){
            RLMResults *result1 = [MWClothes objectsWhere:@"name == %@",foot];
            MWClothes *model = result1.firstObject;
            [realm transactionWithBlock:^{
                model.isSelect = @"0";
            }];
        }
        
        [realm transactionWithBlock:^{
            [realm deleteObject:look];
        }];
        
        if([self.delegate respondsToSelector:@selector(saveReloadData)]){
            [self.delegate saveReloadData];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.topArray.count;
    }else if (section == 1){
        return self.bottomArray.count;
    }else{
         return self.footerArray.count;
    }
}

- (UITableViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MWAddLooksCell *cell = (MWAddLooksCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MWAddLooksCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        MWClothes *model = self.topArray[indexPath.row];
        NSString *base64 = [NSString getStringWithFileName:model.imageName];
        cell.imageView.image = [UIImage decodeBase64ToImage:base64];
        cell.nameLabel.text = model.name;
        NSString *isSelect = model.isSelect;
        if([isSelect isEqualToString:@"0"]){
            [cell.selectImage setHidden:YES];
        }else{
            [cell.selectImage setHidden:NO];
        }
       
    }else if (indexPath.section == 1){
        MWClothes *model = self.bottomArray[indexPath.row];
        NSString *base64 = [NSString getStringWithFileName:model.imageName];
        cell.imageView.image = [UIImage decodeBase64ToImage:base64];
        cell.nameLabel.text = model.name;
        NSString *isSelect = model.isSelect;
        if([isSelect isEqualToString:@"0"]){
            [cell.selectImage setHidden:YES];
        }else{
            [cell.selectImage setHidden:NO];
        }
    }else{
       MWClothes *model = self.footerArray[indexPath.row];
       NSString *base64 = [NSString getStringWithFileName:model.imageName];
       cell.imageView.image = [UIImage decodeBase64ToImage:base64];
       cell.nameLabel.text = model.name;
       NSString *isSelect = model.isSelect;
       if([isSelect isEqualToString:@"0"]){
           [cell.selectImage setHidden:YES];
       }else{
           [cell.selectImage setHidden:NO];
       }
    }
    return (UITableViewCell *)cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(120, 120);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   if([self.selfType isEqualToString:@"Add"]){
       MWClothes *model;
       if(indexPath.section == 0){
          model = self.topArray[indexPath.row];
           if([model.isSelect isEqualToString:@"0"]){
               RLMRealm *realm = [RLMRealm defaultRealm];
               RLMResults *result = [MWClothes objectsWhere:@"name == %@",model.name];
               MWClothes *clothsModel = result.firstObject;
               [realm transactionWithBlock:^{
                   clothsModel.isSelect = @"1";
               }];
               self.top = model.name;
           }else{
               RLMRealm *realm = [RLMRealm defaultRealm];
               RLMResults *result = [MWClothes objectsWhere:@"name == %@",model.name];
               MWClothes *clothsModel = result.firstObject;
               [realm transactionWithBlock:^{
                   clothsModel.isSelect = @"0";
               }];
               self.top = model.name;
           }

           RLMResults *resultAll = [MWClothes objectsWhere:@"type == %@",model.type];
           RLMRealm *realm = [RLMRealm defaultRealm];
           for (MWClothes *model1 in resultAll) {
               if([model1.name isEqualToString:model.name]){
                   
               }else{
                   [realm transactionWithBlock:^{
                       model1.isSelect = @"0";
                   }];
               }
           }
       }else if (indexPath.section == 1){
          model = self.bottomArray[indexPath.row];
           if([model.isSelect isEqualToString:@"0"]){
               RLMRealm *realm = [RLMRealm defaultRealm];
               RLMResults *result = [MWClothes objectsWhere:@"name == %@",model.name];
               MWClothes *clothsModel = result.firstObject;
               [realm transactionWithBlock:^{
                   clothsModel.isSelect = @"1";
               }];
               
               self.bottom = model.name;
               
               
           }else{
               RLMRealm *realm = [RLMRealm defaultRealm];
               RLMResults *result = [MWClothes objectsWhere:@"name == %@",model.name];
               MWClothes *clothsModel = result.firstObject;
               [realm transactionWithBlock:^{
                   clothsModel.isSelect = @"0";
               }];
               
               self.bottom = @"";
           }

           RLMResults *resultAll = [MWClothes objectsWhere:@"type == %@",model.type];
           RLMRealm *realm = [RLMRealm defaultRealm];
           for (MWClothes *model1 in resultAll) {
               if([model1.name isEqualToString:model.name]){
                   
               }else{
                   [realm transactionWithBlock:^{
                       model1.isSelect = @"0";
                   }];
               }
           }
       }else{
           
          model = self.footerArray[indexPath.row];
           if([model.isSelect isEqualToString:@"0"]){
               RLMRealm *realm = [RLMRealm defaultRealm];
               RLMResults *result = [MWClothes objectsWhere:@"name == %@",model.name];
               MWClothes *clothsModel = result.firstObject;
               [realm transactionWithBlock:^{
                   clothsModel.isSelect = @"1";
               }];
               self.foot = model.name;
               
           }else{
               RLMRealm *realm = [RLMRealm defaultRealm];
               RLMResults *result = [MWClothes objectsWhere:@"name == %@",model.name];
               MWClothes *clothsModel = result.firstObject;
               [realm transactionWithBlock:^{
                   clothsModel.isSelect = @"0";
               }];
               self.foot = @"";
           }

           RLMResults *resultAll = [MWClothes objectsWhere:@"type == %@",model.type];
           RLMRealm *realm = [RLMRealm defaultRealm];
           for (MWClothes *model1 in resultAll) {
               if([model1.name isEqualToString:model.name]){
                   
               }else{
                   [realm transactionWithBlock:^{
                       model1.isSelect = @"0";
                   }];
               }
           }
       }

       [self.collectionView reloadData];
   }else{
       
   }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(Iphone_Width, 30);
}

- (UICollectionReusableView *)collectionView:(UICollectionView*)collectionView viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)indexPath;{

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        [collectionView registerNib:[UINib nibWithNibName:@"MWSectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MWSectionHeaderView"];
        MWSectionHeaderView *tempHeaderView = (MWSectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MWSectionHeaderView" forIndexPath:indexPath];

        if(indexPath.section == 0){
            tempHeaderView.titleLabel.text = @"Tops";
        }else if (indexPath.section == 1){
            tempHeaderView.titleLabel.text = @"Bottoms";
        }else{
            tempHeaderView.titleLabel.text = @"Footwear";
        }
        return  tempHeaderView;
    }
    return nil;
}


- (UICollectionView *)collectionView{
    if(_collectionView == nil){
        
        CGFloat top = 130;
        if([self.selfType isEqualToString:@"Add"]){
        }else{
            top = 90;
        }
    
        CGRect frame = CGRectMake(0, top, self.alertView.frame.size.width, self.alertView.frame.size.height-130-40);
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"MWAddLooksCell" bundle:nil] forCellWithReuseIdentifier:@"MWAddLooksCell"];
    }
    return _collectionView;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if(_flowLayout == nil){
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(120, 120);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);;
    }
    return _flowLayout;
}
- (NSMutableArray *)topArray{
    if(_topArray == nil){
        _topArray = [[NSMutableArray alloc]init];
    }
    return _topArray;
}
- (NSMutableArray *)bottomArray{
    if (_bottomArray == nil) {
        _bottomArray = [[NSMutableArray alloc]init];
    }
    return _bottomArray;
}
- (NSMutableArray *)footerArray{
    if(_footerArray == nil){
        _footerArray = [[NSMutableArray alloc]init];
    }
    return _footerArray;
}
@end
