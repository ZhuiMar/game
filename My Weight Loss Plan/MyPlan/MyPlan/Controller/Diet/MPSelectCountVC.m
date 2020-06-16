//
//  MPSelectCountVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/29.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPSelectCountVC.h"

@interface MPSelectCountVC ()

<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * _menu1OptionTitles;
    NSMutableArray * _menu2OptionTitles;
}

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *datas;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *type;

@end

@implementation MPSelectCountVC

- (instancetype)initWithTitle:(NSString *)title days:(NSMutableArray *)days classes:(NSMutableArray *)classes selectBlock:(SelectBlock)block{
    self = [super init];
    if(self){
        self.type = title;
        self.selectBlock = block;
        _menu1OptionTitles = days;
        _menu2OptionTitles = classes;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layOutUi];
    [self loadData];
}

- (void)loadData{
    [self.tableView reloadData];
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)layOutUi{
    [self.view addSubview:self.tableView];
    self.view.layer.cornerRadius = 0;
    self.view.layer.masksToBounds = YES;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 1;}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ return self.items.count; }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{ return 50.0; }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *name = self.items[indexPath.row];
    cell.textLabel.text = name;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont fontWithName:FontName size:20];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"#868FB3"];
    UIView *lineView = [[UIView alloc]init];

    [cell addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
        make.bottom.mas_equalTo(0);
    }];
    
    lineView.backgroundColor = [UIColor colorWithHexString:@"#868FB3"];
    [cell addSubview:lineView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    NSString *title = self.items[row];
    
    if(self.selectBlock){
        self.selectBlock(title);
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.estimatedRowHeight = 0;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}

- (NSMutableArray *)items{
    if(_items == nil){
        if([self.type isEqualToString:@"class"]){
            _items = [[NSMutableArray alloc]initWithArray:_menu2OptionTitles];
        }else{
            _items = [[NSMutableArray alloc]initWithArray:_menu1OptionTitles];
        }
    }
    return _items;
}


@end
