//
//  SAMineVC.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAMineVC.h"

@interface SAMineVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISwitch *switchView;

@end

@implementation SAMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [NSObject colorWithHexString:BgColor];
    [self.view addSubview:self.tableView];
    self.switchView.onTintColor = [NSObject colorWithHexString:@"#01FDD9"];
    self.switchView.transform = CGAffineTransformMakeScale(0.75, 0.75);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 1;}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ return 4; }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{ return 44.0; }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SAmineCell *cell = (SAmineCell *)[tableView dequeueReusableCellWithIdentifier:@"SAmineCell" forIndexPath:indexPath];
    cell.backgroundColor = [NSObject colorWithHexString:@"#2F2C45"];
    if(indexPath.row == 0){
        cell.title.text = @"My collection";
    }else if (indexPath.row == 1){
        cell.title.text = @"History";
    }else if (indexPath.row == 2){
        cell.title.text = @"About";
    }else{
        cell.title.text = @"Privacy";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    if(row == 0){
        SAMyCollectionVC *vc = [[SAMyCollectionVC alloc]initWithType:1];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1){
        SAMyCollectionVC *vc = [[SAMyCollectionVC alloc]initWithType:0];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2){
        SAAboutVC *aboutVC = [[SAAboutVC alloc]init];
        [self.navigationController pushViewController:aboutVC animated:YES];
    }else{
        [NSObject findFromeController:self];
    }
}

- (UITableView *)tableView{
    if(_tableView == nil){
        CGRect frame = CGRectMake(0, 226, Iphone_Width, Iphone_Height - 300);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [NSObject colorWithHexString:@"#2F2C45"];
        [_tableView registerNib:[UINib nibWithNibName:@"SAmineCell" bundle:nil] forCellReuseIdentifier:@"SAmineCell"];
    }
    return _tableView;
}

@end
