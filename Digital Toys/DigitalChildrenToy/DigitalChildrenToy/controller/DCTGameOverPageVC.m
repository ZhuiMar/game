//
//  DCTGameOverPageVC.m
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "DCTGameOverPageVC.h"

@interface DCTGameOverPageVC ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic,assign) NSInteger score;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BTNTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cent;

@end

@implementation DCTGameOverPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    if kiPhone5 {
        self.BTNTop.constant = 10;
        self.cent.constant = -45;
    }
}

- (instancetype)initWithScore:(NSInteger)score
                         home:(GameOverBlock)home
                        again:(GameOverBlock)again{
    
    if(self = [super init]){
        self.homeBlock = home;
        self.againBlock = again;
        self.score = score;
    }
    return self;
}
- (IBAction)homeAction:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
    if(self.homeBlock){
        self.homeBlock();
    }
}
- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.againBlock){
        self.againBlock();
    }
}

@end
