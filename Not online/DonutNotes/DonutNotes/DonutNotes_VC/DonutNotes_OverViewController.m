//
//  DonutNotes_OverViewController.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_OverViewController.h"

@interface DonutNotes_OverViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTittleLabel;

@property(nonatomic, copy)DNOverBlock home;
@property(nonatomic, copy)DNOverBlock again;

@property(nonatomic, assign)NSInteger score;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation DonutNotes_OverViewController

- (instancetype)initWithScore:(NSInteger)score home:(DNOverBlock)home again:(DNOverBlock)again{
    if(self == [super init]){
        self.score = score;
        self.home = home;
        self.again = again;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.bgView.layer.cornerRadius = 16;
    self.bgView.layer.masksToBounds = YES;
    
    if(self.score == 8){
        // all
        self.titleLabel.text = @"Challenge success";
        self.titleLabel.textColor = [NSObject DonutNotes_colorWithHexString:@"#FF4A67"];
        self.subTittleLabel.text = @"Congratulations!";
        self.subTittleLabel.textColor = [NSObject DonutNotes_colorWithHexString:@"#83250A"];
        
    }else{
        
        self.titleLabel.text = @"Challenge failed";
        self.titleLabel.textColor = [NSObject DonutNotes_colorWithHexString:@"#83250A"];
        self.subTittleLabel.text = @"You made the wrong choice";
        self.subTittleLabel.textColor = [NSObject DonutNotes_colorWithHexString:@"#83250A"];
    }
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
