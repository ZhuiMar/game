//
//  DETipsPage.m
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import "DETipsPage.h"

@interface DETipsPage ()

@end

@implementation DETipsPage

- (instancetype)initWithIKnow:(IKnowBlock)ikonwBlock{
    if(self = [super init]){
        self.know = ikonwBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
}

- (IBAction)ikonwAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.know){
        self.know();
    }
}

@end
