//
//  MPWeightSetVC.m
//  MyPlan
//
//  Created by  luzhaoyang on 2020/3/24.
//  Copyright © 2020 yunxi. All rights reserved.
//

#import "MPWeightSetVC.h"

@interface MPWeightSetVC ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *OkBtn;
@property (weak, nonatomic) IBOutlet UILabel *weightText;
@property (weak, nonatomic) IBOutlet UILabel *targetText;
@property (weak, nonatomic) IBOutlet UITextField *textTfOne;
@property (weak, nonatomic) IBOutlet UITextField *textTfTwo;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation MPWeightSetVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.titleLabel.font = [UIFont fontWithName:FontName size:30];
    self.titleLabel.textColor = [UIColor colorWithHexString:@"#284962"];
    if IS_IPHONE_X_orMore {
        self.topLayout.constant = 64;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#E9FCEA"];
    [self.OkBtn setTitleColor:[UIColor colorWithHexString:@"#284962"] forState:UIControlStateNormal];
    self.OkBtn.titleLabel.font = [UIFont fontWithName:FontName size:25];
    self.textTfOne.layer.borderColor = [UIColor colorWithHexString:@"#284962"].CGColor;
    self.textTfOne.layer.borderWidth = 1;
    self.textTfOne.layer.cornerRadius = 6;
    self.textTfOne.layer.masksToBounds = YES;
    self.textTfTwo.layer.borderColor = [UIColor colorWithHexString:@"#284962"].CGColor;
    self.textTfTwo.layer.borderWidth = 1;
    self.textTfTwo.layer.cornerRadius = 6;
    self.textTfTwo.layer.masksToBounds = YES;
    self.textTfOne.textColor = [UIColor colorWithHexString:@"#868FB3"];
    self.textTfTwo.textColor = [UIColor colorWithHexString:@"#868FB3"];
    self.textTfOne.font = [UIFont fontWithName:FontName size:18];
    self.textTfTwo.font = [UIFont fontWithName:FontName size:18];
    
    RLMResults *result = [SetModel objectsWhere:@"type == %@",@"weightSet"];
    SetModel *model = result.firstObject;
    self.textTfTwo.text = model.targetWeight;
    
}

- (IBAction)okBtnAction:(id)sender {
    
    RLMResults *result = [SetModel objectsWhere:@"type == %@",@"weightSet"];
    SetModel *model = result.firstObject;
    NSString *string = model.weight;
    
    NSString *days = model.days;
    NSInteger day = [days integerValue];
    day = day + 1;
    
    NSArray *arr1 = [string componentsSeparatedByString:@"="];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:arr1];
    
    [arr addObject:self.textTfOne.text];
    
    if(arr.count > 7){
        [arr removeObjectAtIndex:0];
    }
    
    SetModel *set = [[SetModel alloc]init];
    
    if(arr == nil){
        set.weight = self.textTfOne.text;
    }else{
        set.weight = [arr componentsJoinedByString:@"="];
    }
    
    set.type = @"weightSet";
    set.targetWeight = self.textTfTwo.text;
    set.days = [NSString stringWithFormat:@"%ld",day];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    if(model){
        [realm transactionWithBlock:^{
            [realm deleteObject:model];
        }];
        [realm transactionWithBlock:^{
            [realm addObject:set];
        }];
    }else{
        [realm transactionWithBlock:^{
            [realm addObject:set];
        }];
    }

    RLMResults *result2 = [SetModel allObjects];
    
    NSLog(@"%@",result2);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
