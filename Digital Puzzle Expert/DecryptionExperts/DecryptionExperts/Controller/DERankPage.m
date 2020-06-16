//
//  DERankPage.m
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import "DERankPage.h"

@interface DERankPage ()

@property(nonatomic,assign)NSInteger level;

@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;

@property (weak, nonatomic) IBOutlet UIButton *simBt;
@property (weak, nonatomic) IBOutlet UIButton *genBt;
@property (weak, nonatomic) IBOutlet UIButton *diffBt;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;

@end

@implementation DERankPage

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.simBt setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [self.genBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    [self.diffBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    self.level = 1;
    [self setValue];
    
    if kiPhone5 {
        self.H.constant = 300;
        self.W.constant = 200;
        self.left.constant = 50;
    }
}

- (IBAction)simAc:(id)sender {
    self.level = 1;
    [self.simBt setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [self.genBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    [self.diffBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    [self setValue];
}
- (IBAction)genAc:(id)sender {
    self.level = 2;
    [self.simBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    [self.genBt setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [self.diffBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    [self setValue];
}
- (IBAction)diffAction:(id)sender {
    self.level = 3;
    [self.simBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    [self.genBt setBackgroundImage:[UIImage imageNamed:@"not_selected"] forState:UIControlStateNormal];
    [self.diffBt setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [self setValue];
}

- (void)setValue{
    if(self.level == 1){
        NSArray *arr = [NSObject DEgetRankingKey:@"DE_simple"];
        if(arr.count == 3){
            self.one.text = [arr[0] stringValue];
            self.two.text = [arr[1] stringValue];
            self.three.text = [arr[2] stringValue];
        }else if(arr.count == 2){
            self.one.text = [arr[0] stringValue];
            self.two.text = [arr[1] stringValue];
        }else if(arr.count == 1){
            self.one.text = [arr[0] stringValue];
        }
        
    }else if (self.level == 2){
        
        NSArray *arr = [NSObject DEgetRankingKey:@"DE_general"];
        if(arr.count == 3){
            self.one.text = [arr[0] stringValue];
            self.two.text = [arr[1] stringValue];
            self.three.text = [arr[2] stringValue];
        }else if(arr.count == 2){
            self.one.text = [arr[0] stringValue];
            self.two.text = [arr[1] stringValue];
        }else if(arr.count == 1){
            self.one.text = [arr[0] stringValue];
        }
    }else if (self.level == 3){
        
        NSArray *arr = [NSObject DEgetRankingKey:@"DE_difficult"];
        if(arr.count == 3){
            self.one.text = [arr[0] stringValue];
            self.two.text = [arr[1] stringValue];
            self.three.text = [arr[2] stringValue];
        }else if(arr.count == 2){
            self.one.text = [arr[0] stringValue];
            self.two.text = [arr[1] stringValue];
        }else if(arr.count == 1){
            self.one.text = [arr[0] stringValue];
        }
    }
}

@end
