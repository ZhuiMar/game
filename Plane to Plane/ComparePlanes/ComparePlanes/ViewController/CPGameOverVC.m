//
//  CPGameOverVC.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/16.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "CPGameOverVC.h"

@interface CPGameOverVC ()

@property(nonatomic, copy)CPOverBlock home;
@property(nonatomic, copy)CPOverBlock again;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (nonatomic, assign) NSInteger score;
@property(nonatomic,assign) NSInteger type;

@end

@implementation CPGameOverVC

- (instancetype)initWithScore:(NSInteger)score type:(NSInteger)type home:(CPOverBlock)home again:(CPOverBlock)again{
    if(self = [super init]){
        self.home = home;
        self.again = again;
        self.score = score;
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    // highest
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSString *typeStr = [NSString stringWithFormat:@"%ld",self.type];

    RLMResults *results = [CPScoreModel objectsWhere:@"cp_type == %@",typeStr];
    for (CPScoreModel *model in results) {
        [arr addObject:model.cp_score];
    }
    NSMutableArray *arrNum = [[NSMutableArray alloc]init];
    for (NSString *num in arr) {
        [arrNum addObject:num];
    }
    NSArray *result = [arrNum sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj2 compare:obj1];
    }];
    NSInteger kk = [result.firstObject integerValue];
    self.highScoreLabel.text = [NSString stringWithFormat:@"#Highest record: %ld",kk];
}

- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}
- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}

@end
