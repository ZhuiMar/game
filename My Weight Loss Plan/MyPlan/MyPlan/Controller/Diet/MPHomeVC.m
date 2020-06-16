//
//  MPHomeVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/20.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPHomeVC.h"

@interface MPHomeVC ()<UITableViewDelegate,UITableViewDataSource,MPCheckInHeaderDelegate>

@property (nonatomic,strong) UIBarButtonItem *rightItem;

@property (weak, nonatomic) IBOutlet UIView *dateBgView;
@property (weak, nonatomic) IBOutlet UILabel *datelabel;
@property (weak, nonatomic) IBOutlet UILabel *xinqi;
@property (weak, nonatomic) IBOutlet UILabel *screenMiddleLaebl;

@property(nonatomic,strong)NSMutableArray *topArr;
@property(nonatomic,strong)NSMutableArray *middleArr;
@property(nonatomic,strong)NSMutableArray *bottomArr;

@property(nonatomic,strong)MPCheckInHeader *header1;
@property(nonatomic,strong)MPCheckInHeader *header2;
@property(nonatomic,strong)MPCheckInHeader *header3;

@property(nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy) NSString *week;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topView;

@end

@implementation MPHomeVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Clock in diet";
    self.navigationItem.rightBarButtonItem = self.rightItem;
}

- (void)setFond{
    self.datelabel.font = [UIFont fontWithName:FontName size:20];
    self.xinqi.font = [UIFont fontWithName:FontName size:20];
    self.screenMiddleLaebl.font = [UIFont fontWithName:FontName size:25];;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self setFond];
    self.datelabel.text = [[NSDate getTaday] stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    self.week = [NSDate getweekDayStringWithDate:[NSDate date]];
    self.xinqi.text = self.week;
    [self getData];
    
    MPWeightSetVC *weightVC = [[MPWeightSetVC alloc]init];
    weightVC.modalPresentationStyle = 0;
    [self presentViewController:weightVC animated:NO completion:^{
        
    }];
    
    NSString *startTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"startTime"];
    if(!startTime){
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate getTaday] forKey:@"startTime"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
//    if kiPhone5 {
//        self.topView.constant = 64;
//    }
    
    MPNavigateVC *navigate = (MPNavigateVC *)self.navigationController;
    navigate.backBlock = ^{
       [self getData];
    };
}

- (void)getData{
    
    [self.topArr removeAllObjects];
    [self.middleArr removeAllObjects];
    [self.bottomArr removeAllObjects];
    
    RLMResults *result = [PlanModel objectsWhere:@"week == %@",self.week];
    for (PlanModel *model in result) {
        if([model.type isEqual:@"Breakfast"]){
            [self.topArr addObject:model];
        }
        if([model.type isEqual:@"Lunch"]){
            [self.middleArr addObject:model];
        }
        if([model.type isEqual:@"Dinner"]) {
            [self.bottomArr addObject:model];
        }
    }
    
    if(self.topArr.count == 0 && self.middleArr.count == 0 && self.bottomArr.count == 0){
        [self.tableView setHidden:YES];
        [self.screenMiddleLaebl setHidden:NO];
    }else{
        [self.tableView setHidden:NO];
        [self.screenMiddleLaebl setHidden:YES];
    }
    
    [self.tableView reloadData];
}

- (void)clcikRight:(UIButton *)buttion{
    MPAddPlanVC *addPlanVC = [[MPAddPlanVC alloc]init];
    [self.navigationController pushViewController:addPlanVC animated:YES];
}

- (UIBarButtonItem *)rightItem{
    if(_rightItem == nil){
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(0, 0, 40, 40);
        [rightBtn setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(clcikRight:) forControlEvents:UIControlEventTouchUpInside];
        _rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    }
    return _rightItem;
}

- (void)setSuccess{
    PMSuccessVC *vc = [[PMSuccessVC alloc]init];
    [self yc_centerPresentController:vc presentedSize:CGSizeMake(150, 150) completeHandle:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [vc dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)checkInActionType:(NSInteger)type{
    
    if(type == 0){
        
        if(self.topArr.count > 0){
            PlanModel *model = self.topArr[0];
            if([model.isChockIn isEqualToString:@"0"] == NO){
                return;
            }
        }else{
            return;
        }
        
        RLMResults *result = [PlanModel objectsWhere:@"week == %@",self.week];
        RLMRealm *realm = [RLMRealm defaultRealm];
        for (PlanModel *model in result) {
            if([model.type isEqualToString:@"Breakfast"]){
                [realm transactionWithBlock:^{
                    model.isChockIn = @"1";
                }];
                [self setSuccess];
                [self getData];
            }
        }
        
        
    }else if (type == 1){
        
        if(self.middleArr.count > 0){
            PlanModel *model = self.middleArr[0];
            if([model.isChockIn isEqualToString:@"0"] == NO){
                return;
            }
        }else{
            return;
        }
        
        RLMResults *result = [PlanModel objectsWhere:@"week == %@",self.week];
        RLMRealm *realm = [RLMRealm defaultRealm];
        for (PlanModel *model in result) {
            if([model.type isEqualToString:@"Lunch"]){
                [realm transactionWithBlock:^{
                    model.isChockIn = @"1";
                }];
                [self setSuccess];
                [self getData];
            }
        }
        
    }else{
        
        if(self.bottomArr.count > 0){
            PlanModel *model = self.bottomArr[0];
            if([model.isChockIn isEqualToString:@"0"] == NO){
                return;
            }
        }else{
            return;
        }
        
        RLMResults *result = [PlanModel objectsWhere:@"week == %@",self.week];
        RLMRealm *realm = [RLMRealm defaultRealm];
        for (PlanModel *model in result) {
            if([model.type isEqualToString:@"Dinner"]){
                [realm transactionWithBlock:^{
                    model.isChockIn = @"1";
                }];
                [self setSuccess];
                [self getData];
            }
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return self.topArr.count;
    }else if (section == 1){
        return self.middleArr.count;
    }else{
        return self.bottomArr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"MPCell";
    MPCell *cell = (MPCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MPCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    PlanModel *model;
    if(indexPath.section == 0){
        model = self.topArr[indexPath.row];
    }else if (indexPath.section == 1){
        model = self.middleArr[indexPath.row];
    }else{
        model = self.bottomArr[indexPath.row];
    }
    cell.nameLabel.text = model.foodName;
    cell.countLabel.text = [NSString stringWithFormat:@"x%@",model.foodCount];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        self.header1 = [MPCheckInHeader getCheckInHeaderViewType:section];
        self.header1.delegate = self;
        if(self.topArr.count == 0){
            [self.header1.checkinBtn setBackgroundImage:[UIImage imageNamed:@"none"] forState:UIControlStateNormal];
        }else{
            PlanModel *model = self.topArr[0];
            if([model.isChockIn isEqualToString:@"0"]){
                [self.header1.checkinBtn setBackgroundImage:[UIImage imageNamed:@"sign in"] forState:UIControlStateNormal];
            }else{
                [self.header1.checkinBtn setBackgroundImage:[UIImage imageNamed:@"succeed"] forState:UIControlStateNormal];
            }
        }
    
        return self.header1;
    }else if (section == 1){
        self.header2 = [MPCheckInHeader getCheckInHeaderViewType:section];
        self.header2.delegate = self;
        if(self.middleArr.count == 0){
            [self.header2.checkinBtn setBackgroundImage:[UIImage imageNamed:@"none"] forState:UIControlStateNormal];
        }else{
            PlanModel *model = self.middleArr[0];
            if([model.isChockIn isEqualToString:@"0"]){
                [self.header2.checkinBtn setBackgroundImage:[UIImage imageNamed:@"sign in"] forState:UIControlStateNormal];
            }else{
                [self.header2.checkinBtn setBackgroundImage:[UIImage imageNamed:@"succeed"] forState:UIControlStateNormal];
            }
        }
        return self.header2;
    }else{
        self.header3 = [MPCheckInHeader getCheckInHeaderViewType:section];
        self.header3.delegate = self;
        if(self.bottomArr.count == 0){
            [self.header3.checkinBtn setBackgroundImage:[UIImage imageNamed:@"none"] forState:UIControlStateNormal];
        }else{
            PlanModel *model = self.bottomArr[0];
            if([model.isChockIn isEqualToString:@"0"]){
                [self.header3.checkinBtn setBackgroundImage:[UIImage imageNamed:@"sign in"] forState:UIControlStateNormal];
            }else{
                [self.header3.checkinBtn setBackgroundImage:[UIImage imageNamed:@"succeed"] forState:UIControlStateNormal];
            }
        }
        return self.header3;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    MPHomeFooter *view = [MPHomeFooter getHeaderViewType:section];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0){
        if(self.topArr.count > 0){
            return 0;
        }else{
            return 44;
        }
    }else if (section == 1){
        if(self.middleArr.count > 0){
            return 0;
        }else{
            return 44;
        }
    }else{
        if(self.bottomArr.count > 0){
            return 0;
        }else{
            return 44;
        }
    }
}

- (UITableView *)tableView{
    if(_tableView == nil){
        
        CGFloat top = 88;
        if IS_IPHONE_X_orMore {
            top = 120;
        }
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, top, Iphone_Width, Iphone_Height - top) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerNib:[UINib nibWithNibName:@"MPCell" bundle:nil] forCellReuseIdentifier:@"MPCell"];
    }
    return _tableView;
}
- (NSMutableArray *)topArr{
    if(_topArr == nil){
        _topArr = [[NSMutableArray alloc]init];
    }
    return _topArr;
}
- (NSMutableArray *)middleArr{
    if(_middleArr == nil){
        _middleArr = [[NSMutableArray alloc]init];
    }
    return _middleArr;
}
- (NSMutableArray *)bottomArr{
    if(_bottomArr == nil){
        _bottomArr = [[NSMutableArray alloc]init];
    }
    return _bottomArr;
}
@end
    



