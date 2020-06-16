//
//  MWUserVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWUserVC.h"

@interface MWUserVC ()<UITableViewDelegate,UITableViewDataSource,MWUserHeaderDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *datas;

@property (nonatomic,strong) MWUserHeader *headerView1;
@property (nonatomic,strong) MWUserHeader *headerView2;

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wightLayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation MWUserVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"User";
    
    self.headerView1 = [MWUserHeader getHeaderView];
    self.headerView1.titleLabel.text = @"Quantity of clothes";
    self.headerView1.delegate = self;
    
    self.headerView2 = [MWUserHeader getHeaderView];
    self.headerView2.titleLabel.text = @"About";
    self.headerView2.delegate = self;
    
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    
    [self.tableView reloadData];
    
    if kiPhone5 {
        self.bgView.layer.cornerRadius = 0;
        self.bgView.layer.masksToBounds = YES;
        self.wightLayout.constant = Iphone_Width;
        self.heightLayout.constant = Iphone_Height;
        self.topLayout.constant = 88;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MWUserClothesCell" bundle:nil] forCellReuseIdentifier:@"MWUserClothesCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MWUserAboutCell" bundle:nil] forCellReuseIdentifier:@"MWUserAboutCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 6;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        MWUserClothesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MWUserClothesCell"];
        if (cell == nil) {
            cell = [[MWUserClothesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MWUserClothesCell"];
        }
        cell.titleLabel.text = self.datas[indexPath.row];
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                RLMResults *results = [MWClothes objectsWhere:@"type == 'Tops'"];
                cell.numberLabel.text = [NSString stringWithFormat:@"%ld",results.count];
            }else if(indexPath.row == 1){
                RLMResults *results = [MWClothes objectsWhere:@"type == 'Bottoms'"];
                cell.numberLabel.text = [NSString stringWithFormat:@"%ld",results.count];
            }else if(indexPath.row == 2){
                RLMResults *results = [MWClothes objectsWhere:@"type == 'Footwear'"];
                cell.numberLabel.text = [NSString stringWithFormat:@"%ld",results.count];
            }else if(indexPath.row == 3){
                RLMResults *results = [MWClothes objectsWhere:@"type == 'Caps'"];
                cell.numberLabel.text = [NSString stringWithFormat:@"%ld",results.count];
            }else if(indexPath.row == 4){
                RLMResults *results = [MWClothes objectsWhere:@"type == 'Bags'"];
                cell.numberLabel.text = [NSString stringWithFormat:@"%ld",results.count];
            }else {
                RLMResults *results = [MWClothes objectsWhere:@"type == 'Accessories'"];
                cell.numberLabel.text = [NSString stringWithFormat:@"%ld",results.count];
            }
        }
        return cell;
    }else{
        MWUserAboutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MWUserAboutCell"];
        if (cell == nil) {
            cell = [[MWUserAboutCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MWUserAboutCell"];
        }
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
         return 37.0;
    }else{
        if kiPhone5 {
            return 90.0;
        }else{
            return 80.0;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return self.headerView1;
    }else{
        return self.headerView2;
    }
}

- (void)clickBtnuUp:(BOOL)isUp{
    [UIView animateWithDuration:1 animations:^{
        [self.tableView reloadData];
    }];
}

- (NSMutableArray *)datas{
    if(_datas == nil){
        _datas = [[NSMutableArray alloc]initWithArray:@[@"Tops",
                                                        @"Bottoms",
                                                        @"Footwear",
                                                        @"Caps",
                                                        @"Bags",
                                                        @"Accessories"]];
    }
    return _datas;
}

@end
