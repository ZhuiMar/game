//
//  CPRankingVC.m
//  ComparePlanes
//
//  Created by luzhaoyang on 2020/4/16.
//  Copyright © 2020 qingxiriver. All rights reserved.
//

#import "CPRankingVC.h"

@interface CPRankingVC ()

@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *sortLabel;
@property (weak, nonatomic) IBOutlet UIView *numline;
@property (weak, nonatomic) IBOutlet UIView *sortline;

@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;
@property (weak, nonatomic) IBOutlet UILabel *four;
@property (weak, nonatomic) IBOutlet UILabel *five;

@property (weak, nonatomic) IBOutlet UIView *simline;
@property (weak, nonatomic) IBOutlet UIView *comline;
@property (weak, nonatomic) IBOutlet UIView *diffline;

@property(nonatomic,assign) NSInteger type;
@property(nonatomic,assign) NSInteger level;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation CPRankingVC

- (instancetype)init{
    if(self = [super init]){
        [[SavePlanTool shareTool] showPrivacy];
        [CPScoreManagee shareManager];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"My record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.type = 1;
    self.level = 1;
    
    self.numLabel.textColor = [NSObject CPcolorWithHexString:@"#F3430C"];
    self.numline.backgroundColor = [NSObject CPcolorWithHexString:@"#F3430C"];
    self.sortLabel.textColor = [NSObject CPcolorWithHexString:@"#601986"];
    self.sortline.backgroundColor = [NSObject CPcolorWithHexString:@"#601986"];
    [self.simline setHidden:NO];
    [self.comline setHidden:YES];
    [self.diffline setHidden:YES];
    
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.borderWidth = 1;
    self.bgView.layer.borderColor = [NSObject CPcolorWithHexString:@"#514149"].CGColor;
    [self setVaule];
}

- (IBAction)numberAction:(id)sender {
    self.type = 1;
    self.numLabel.textColor = [NSObject CPcolorWithHexString:@"#F3430C"];
    self.numline.backgroundColor = [NSObject CPcolorWithHexString:@"#F3430C"];
    self.sortLabel.textColor = [NSObject CPcolorWithHexString:@"#601986"];
    self.sortline.backgroundColor = [NSObject CPcolorWithHexString:@"#601986"];
    [self setVaule];
}

- (IBAction)sortingAction:(id)sender {
    self.type = 2;
    self.numLabel.textColor = [NSObject CPcolorWithHexString:@"#601986"];
    self.numline.backgroundColor = [NSObject CPcolorWithHexString:@"#601986"];
    self.sortLabel.textColor = [NSObject CPcolorWithHexString:@"#F3430C"];
    self.sortline.backgroundColor = [NSObject CPcolorWithHexString:@"#F3430C"];
    [self setVaule];
}

- (IBAction)simAction:(id)sender {
    self.level = 1;
    [self.simline setHidden:NO];
    [self.comline setHidden:YES];
    [self.diffline setHidden:YES];
    [self setVaule];
}
- (IBAction)comAction:(id)sender {
    self.level = 2;
    [self.simline setHidden:YES];
    [self.comline setHidden:NO];
    [self.diffline setHidden:YES];
    [self setVaule];
}
- (IBAction)diffAction:(id)sender {
    self.level = 3;
    [self.simline setHidden:YES];
    [self.comline setHidden:YES];
    [self.diffline setHidden:NO];
    [self setVaule];
}

- (void)setVaule{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSString *type = [NSString stringWithFormat:@"%ld",self.type];
    NSString *level = [NSString stringWithFormat:@"%ld",self.level];
    
    RLMResults *results = [CPScoreModel objectsWhere:@"cp_type == %@ AND cp_level BEGINSWITH %@",type,level];
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
    
    [self setTextWithArr:result];
}

- (void)setTextWithArr:(NSMutableArray *)arr{
    if(arr.count == 0){
        self.one.text = @"0";
        self.two.text = @"0";
        self.three.text = @"0";
        self.four.text = @"0";
        self.five.text = @"0";
    }
    if(arr.count == 1){
        self.one.text = arr[0];
        self.two.text = @"0";
        self.three.text = @"0";
        self.four.text = @"0";
        self.five.text = @"0";
    }
    if(arr.count == 2){
        self.one.text = arr[0];
        self.two.text = arr[1];
        self.three.text = @"0";
        self.four.text = @"0";
        self.five.text = @"0";
    }
    if(arr.count == 4){
        self.one.text = arr[0];
        self.two.text = arr[1];
        self.three.text = arr[2];
        self.four.text = @"0";
        self.five.text = @"0";
    }
    if(arr.count == 4){
        self.one.text = arr[0];
        self.two.text = arr[1];
        self.three.text = arr[2];
        self.four.text = arr[3];
        self.five.text = @"0";
    }
    if(arr.count == 5 || arr.count > 5){
        self.one.text = arr[0];
        self.two.text = arr[1];
        self.three.text = arr[2];
        self.four.text = arr[3];
        self.five.text = arr[4];
    }
}

@end
