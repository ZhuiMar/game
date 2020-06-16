//
//  SAMenuView.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAMenuView.h"

@interface SAMenuView()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *arrs;
@property (nonatomic,copy) MenuVauleBlock textBlock;

@end

@implementation SAMenuView

+ (instancetype)getMenuViewMenuClass:(MenuVauleBlock)classStr{
    SAMenuView *view = [[SAMenuView alloc]init];
    view.textBlock = classStr;
    return view;
}

- (void)roadData{
    [self addSubview:self.tableView];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 1;}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ return self.arrs.count; }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{ return 44.0; }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SAMenuCell *cell = (SAMenuCell *)[tableView dequeueReusableCellWithIdentifier:@"SAMenuCell" forIndexPath:indexPath];
    cell.tttts.text = self.arrs[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    NSString *str = self.arrs[row];
    if(self.textBlock){
        self.textBlock(str);
    }
}
- (UITableView *)tableView{
    if(_tableView == nil){
        CGRect frame = CGRectMake(0, 0, 120, self.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [NSObject colorWithHexString:@"#2F2C45"];
        [_tableView registerNib:[UINib nibWithNibName:@"SAMenuCell" bundle:nil] forCellReuseIdentifier:@"SAMenuCell"];
    }
    return _tableView;
}
- (NSMutableArray *)arrs{
    if(_arrs == nil){
        _arrs = [[NSMutableArray alloc]initWithArray:@[@"News",
                                                    @"Beasts",
                                                    @"Birds",
                                                    @"Insect",
                                                    @"Other"]];
    }
    return _arrs;
}

@end
