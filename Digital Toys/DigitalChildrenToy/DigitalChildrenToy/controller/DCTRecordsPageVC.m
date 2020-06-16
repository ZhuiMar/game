//
//  DCTRecordsPageVC.m
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "DCTRecordsPageVC.h"

@interface DCTRecordsPageVC ()

@property (weak, nonatomic) IBOutlet UILabel *easyOne;
@property (weak, nonatomic) IBOutlet UILabel *easyTwo;
@property (weak, nonatomic) IBOutlet UILabel *easyThree;

@property (weak, nonatomic) IBOutlet UILabel *genOne;
@property (weak, nonatomic) IBOutlet UILabel *genTwo;
@property (weak, nonatomic) IBOutlet UILabel *genThree;

@property (weak, nonatomic) IBOutlet UILabel *hardOne;
@property (weak, nonatomic) IBOutlet UILabel *hardTwo;
@property (weak, nonatomic) IBOutlet UILabel *hardThree;

@end

@implementation DCTRecordsPageVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue];
}

- (void)setValue{
    
    NSArray *easy = [NSObject DCTgetRankingKey:@"DCT_easy"];
    if(easy.count == 3){
        self.easyOne.text = [easy[0] stringValue];
        self.easyTwo.text = [easy[1] stringValue];
        self.easyThree.text = [easy[2] stringValue];
    }else if(easy.count == 2){
        self.easyOne.text = [easy[0] stringValue];
        self.easyTwo.text = [easy[1] stringValue];
    }else if(easy.count == 1){
        self.easyOne.text = [easy[0] stringValue];
    }
    
    NSArray *general = [NSObject DCTgetRankingKey:@"DCT_general"];
    if(general.count == 3){
        self.genOne.text = [general[0] stringValue];
        self.genTwo.text = [general[1] stringValue];
        self.genThree.text = [general[2] stringValue];
    }else if(general.count == 2){
        self.genOne.text = [general[0] stringValue];
        self.genTwo.text = [general[1] stringValue];
    }else if(general.count == 1){
        self.genOne.text = [general[0] stringValue];
    }
    
    NSArray *hard = [NSObject DCTgetRankingKey:@"DCT_hard"];
    if(hard.count == 3){
        self.genOne.text = [hard[0] stringValue];
        self.genTwo.text = [hard[1] stringValue];
        self.genThree.text = [hard[2] stringValue];
    }else if(hard.count == 2){
        self.genOne.text = [hard[0] stringValue];
        self.genTwo.text = [hard[1] stringValue];
    }else if(hard.count == 1){
        self.genOne.text = [hard[0] stringValue];
    }
}

@end
