//
//  SleepHelper_AlertViewController.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_AlertViewController.h"

@interface SleepHelper_AlertViewController ()

@property(nonatomic,strong) SleepHelpeBlock cancel;
@property(nonatomic,strong) SleepHelpeBlock ok;

@end

@implementation SleepHelper_AlertViewController

- (instancetype)initWithCancelBlock:(SleepHelpeBlock)cancelBlock OkBlock:(SleepHelpeBlock)block{
    if(self = [super init]){
        self.cancel = cancelBlock;
        self.ok = block;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 10;
    self.view.layer.masksToBounds = YES;
}

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.cancel){
        self.cancel();
    }
}
- (IBAction)OkAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.ok){
        self.ok();
    }
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults *results = [SleepHelper_TimeModel allObjects];
    for (SleepHelper_TimeModel *friend in results) {
        [realm transactionWithBlock:^{
            [realm deleteObject:friend];
        }];
    }
}

@end
