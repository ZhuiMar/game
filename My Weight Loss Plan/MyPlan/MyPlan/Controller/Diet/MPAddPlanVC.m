//
//  MPAddPlanVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/28.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPAddPlanVC.h"

@interface MPAddPlanVC ()<UITableViewDelegate,UITableViewDataSource,MPAddFooterViewDelegate,MPHeaderViewDelegate>

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *topArr;
@property(nonatomic,strong)NSMutableArray *middleArr;
@property(nonatomic,strong)NSMutableArray *bottomArr;
@property(nonatomic,strong)NSMutableArray *weekBtns;

@property(nonatomic,strong)MPHeaderView *header1;
@property(nonatomic,strong)MPHeaderView *header2;
@property(nonatomic,strong)MPHeaderView *header3;

@property (weak, nonatomic) IBOutlet UIButton *mon;
@property (weak, nonatomic) IBOutlet UIButton *tues;
@property (weak, nonatomic) IBOutlet UIButton *wed;
@property (weak, nonatomic) IBOutlet UIButton *thur;
@property (weak, nonatomic) IBOutlet UIButton *fri;
@property (weak, nonatomic) IBOutlet UIButton *sat;
@property (weak, nonatomic) IBOutlet UIButton *sun;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top;

@property (nonatomic, copy) NSString *week;
@property (nonatomic, strong) PlanModel *currentPlan;

@end

@implementation MPAddPlanVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Add the plan";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    [self setFont];
    
    [self.weekBtns addObject:self.mon];
    self.mon.tag = 1;
    [self.weekBtns addObject:self.tues];
    self.tues.tag = 2;
    [self.weekBtns addObject:self.wed];
    self.wed.tag = 3;
    [self.weekBtns addObject:self.thur];
    self.thur.tag = 4;
    [self.weekBtns addObject:self.fri];
    self.fri.tag = 5;
    [self.weekBtns addObject:self.sat];
    self.sat.tag = 6;
    [self.weekBtns addObject:self.sun];
    self.sun.tag = 7;
    
    [self setWeekNomal];
    
    [self getData];
    
    if kiPhone5 {
//        self.top.constant = 70;
    }
    
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
    [self.tableView reloadData];
}


- (IBAction)monAction:(UIButton *)sender {
    self.week = @"Mon";
    [self changeColor:sender];
}
- (IBAction)tuesAction:(UIButton *)sender {
    self.week = @"Tues";
    [self changeColor:sender];
}
- (IBAction)wedAction:(UIButton *)sender {
    self.week = @"Wed";
    [self changeColor:sender];
}
- (IBAction)thurAction:(UIButton *)sender {
    self.week = @"Thur";
    [self changeColor:sender];
}
- (IBAction)friAction:(UIButton *)sender {
    self.week = @"Fri";
    [self changeColor:sender];
}
- (IBAction)satAction:(UIButton *)sender {
    self.week = @"Sat";
    [self changeColor:sender];
}
- (IBAction)sunAction:(UIButton *)sender {
    self.week = @"Sun";
    [self changeColor:sender];
}


- (void)jianAction:(NSInteger)count{
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    if(self.currentPlan == nil){
        return;
    }
    
    RLMResults *result = [PlanModel objectsWhere:@"ids == %@",self.currentPlan.ids];
    PlanModel *model = result.firstObject;
    
    if([model.foodName isEqualToString:@""] || model.foodName == nil){
        return;
    }
    
    [realm transactionWithBlock:^{
        [realm deleteObject:model];
    }];
    self.currentPlan = nil;
    [self getData];
}

- (void)chooseCount:(NSInteger)count{
   NSMutableArray *days = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5"]];
   MPSelectCountVC *selectVc = [[MPSelectCountVC alloc] initWithTitle:@"" days:days classes:nil selectBlock:^(NSString *string) {
       if(count == 0){
           self.header1.chooseCountLabel.text = string;
       }else if (count == 1){
           self.header2.chooseCountLabel.text = string;
       }else{
           self.header3.chooseCountLabel.text = string;
       }
   }];
   [self yc_bottomPresentController:selectVc presentedHeight:244 completeHandle:nil];
}

- (void)setWeekNomal{
    self.week = [NSDate getweekDayStringWithDate:[NSDate date]];
    for (UIButton *buttion in self.weekBtns) {
        NSString *btnTittle = [buttion titleForState:UIControlStateNormal];
        if([btnTittle isEqualToString:self.week]){
             [buttion setTitleColor:[UIColor colorWithHexString:@"#00A2FF"] forState:UIControlStateNormal];
        }else{
             [buttion setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
        }
    }
}

- (void)changeColor:(UIButton *)buttion{
    for (UIButton *bution in self.weekBtns) {
        if(bution == buttion){
            [bution setTitleColor:[UIColor colorWithHexString:@"#00A2FF"] forState:UIControlStateNormal];
        }else{
            [bution setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
        }
    }
    [self getData];
}

- (void)setFont{
    [self.mon setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
    [self.tues setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
    [self.wed setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
    [self.thur setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
    [self.fri setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
    [self.sat setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
    [self.sun setTitleColor:[UIColor colorWithHexString:@"#868FB3"] forState:UIControlStateNormal];
}

- (void)addActionWithType:(NSInteger)type{
    if(type == 0){
        if([self.header1.chooseCountLabel.text isEqualToString:@""] == NO && [self.header1.textFile.text isEqualToString:@""] == NO){
            PlanModel *model = [[PlanModel alloc]init];
            model.type = @"Breakfast";
            model.foodName = self.header1.textFile.text;
            model.foodCount = self.header1.chooseCountLabel.text;
            model.week = self.week;
            model.isChockIn = @"0";
            model.ids = [NSString randomStringWithLength:5];
            
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                [realm addObject:model];
            }];
            self.header1.textFile.text = @"";
        }
    }else if (type == 1){
        if([self.header2.chooseCountLabel.text isEqualToString:@""] == NO && [self.header2.textFile.text isEqualToString:@""] == NO){
            PlanModel *model = [[PlanModel alloc]init];
            model.type = @"Lunch";
            model.foodName = self.header2.textFile.text;
            model.foodCount = self.header2.chooseCountLabel.text;
            model.week = self.week;
            model.isChockIn = @"0";
            model.ids = [NSString randomStringWithLength:5];
            
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                [realm addObject:model];
            }];
            self.header2.textFile.text = @"";
        }
    }else{
        if([self.header3.chooseCountLabel.text isEqualToString:@""] == NO && [self.header3.textFile.text isEqualToString:@""] == NO){
            PlanModel *model = [[PlanModel alloc]init];
            model.type = @"Dinner";
            model.foodName = self.header3.textFile.text;
            model.foodCount = self.header3.chooseCountLabel.text;
            model.week = self.week;
            model.isChockIn = @"0";
            model.ids = [NSString randomStringWithLength:5];
            
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                [realm addObject:model];
            }];
            self.header3.textFile.text = @"";
        }
    }
    
    [self getData];
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        self.header1 = [MPHeaderView getHeaderViewType:section];
        self.header1.delegate = self;
        return self.header1;
    }else if (section == 1){
        self.header2 = [MPHeaderView getHeaderViewType:section];
        self.header2.delegate = self;
        return self.header2;
    }else{
        self.header3 = [MPHeaderView getHeaderViewType:section];
        self.header3.delegate = self;
        return self.header3;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 95;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    MPAddFooterView *view = [MPAddFooterView getAddFooterViewType:section];
    view.delegate = self;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0){
        if(self.topArr.count > 0){
            return 44;
        }else{
            return 44;
        }
    }else if (section == 1){
        if(self.middleArr.count > 0){
            return 44;
        }else{
            return 44;
        }
    }else{
        if(self.topArr.count > 0){
            return 44;
        }else{
            return 44;
        }
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        
        PlanModel *model = self.topArr[indexPath.row];
        self.currentPlan = model;
    
    }else if (indexPath.section == 1){
        
        PlanModel *model = self.middleArr[indexPath.row];
        self.currentPlan = model;
    
    }else{
        
        PlanModel *model = self.bottomArr[indexPath.row];
        self.currentPlan = model;
    }
}

- (UITableView *)tableView{
    if(_tableView == nil){
        CGFloat top = 88;
        if IS_IPHONE_X_orMore {
            top = 120;
        }
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, top, Iphone_Width, Iphone_Height-top) style:UITableViewStyleGrouped];
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
- (NSMutableArray *)weekBtns{
    if(_weekBtns == nil){
        _weekBtns = [[NSMutableArray alloc]init];
    }
    return _weekBtns;
}
@end
