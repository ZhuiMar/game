//
//  MysteryBoard_FlagStoneVC.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "MysteryBoard_FlagStoneVC.h"

@interface MysteryBoard_FlagStoneVC ()

@property (weak, nonatomic) IBOutlet UIView *starbg;
@property (weak, nonatomic) IBOutlet UILabel *satrCount;

@property (weak, nonatomic) IBOutlet UIButton *colorBtn;
@property (weak, nonatomic) IBOutlet UIButton *fruitBtn;
@property (weak, nonatomic) IBOutlet UIButton *animalBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widtrh;

@end

@implementation MysteryBoard_FlagStoneVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Flagstone";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.starbg.layer.cornerRadius = 10;
    self.starbg.layer.masksToBounds = YES;
    self.starbg.layer.borderColor = [NSObject MysteryBoard_colorWithHexString:@"#B46E7F"].CGColor;
    self.starbg.layer.borderWidth = 1;
    self.starbg.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.6];
    
    NSNumber *count = [[NSUserDefaults standardUserDefaults] objectForKey:@"MysteryBoard_star"];
    if(count == nil){
        self.satrCount.text = [NSString stringWithFormat:@"%@",@"0"];
        [self.animalBtn setBackgroundImage:[UIImage imageNamed:@"animal_1"] forState:UIControlStateNormal];
    }else{
        NSInteger COUNT = [count integerValue];
        self.satrCount.text = [NSString stringWithFormat:@"%ld",COUNT];
        if(COUNT >= 20){
            [self.animalBtn setBackgroundImage:[UIImage imageNamed:@"animal"] forState:UIControlStateNormal];
        }else{
            [self.animalBtn setBackgroundImage:[UIImage imageNamed:@"animal_1"] forState:UIControlStateNormal];
        }
    }

    if iPhone5 {
        self.widtrh.constant = 70;
    }
}

- (IBAction)colorAction:(id)sender {
    MysteryBoard_ShowVC *vc = [[MysteryBoard_ShowVC alloc]initWithTittle:@"Colour"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)fruitAction:(id)sender {
    MysteryBoard_ShowVC *vc = [[MysteryBoard_ShowVC alloc]initWithTittle:@"Fruits"];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)animalAction:(id)sender {
    NSNumber *count = [[NSUserDefaults standardUserDefaults] objectForKey:@"MysteryBoard_star"];
    if(count == nil){
       
    }else{
        NSInteger COUNT = [count integerValue];
        if(COUNT >= 20){
            MysteryBoard_ShowVC *vc = [[MysteryBoard_ShowVC alloc]initWithTittle:@"Animal"];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
