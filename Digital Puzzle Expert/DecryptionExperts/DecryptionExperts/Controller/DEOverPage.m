//
//  DEOverPage.m
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import "DEOverPage.h"

@interface DEOverPage ()

@property(nonatomic, copy)DEOverBlock home;
@property(nonatomic, copy)DEOverBlock again;

@property(nonatomic, assign)NSInteger score;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation DEOverPage

- (instancetype)initWithScore:(NSInteger)score home:(DEOverBlock)home again:(DEOverBlock)again{
    if(self = [super init]){
        self.score = score;
        self.home = home;
        self.again = again;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
}

- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.home){
        self.home();
    }
}
- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.again){
        self.again();
    }
}
@end
