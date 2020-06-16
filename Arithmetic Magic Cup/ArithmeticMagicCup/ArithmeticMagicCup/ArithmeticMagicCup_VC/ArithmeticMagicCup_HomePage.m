//
//  ArithmeticMagicCup_HomePage.m
//  ArithmeticMagicCup
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_HomePage.h"
#import "AppDelegate.h"

@interface ArithmeticMagicCup_HomePage ()

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@property (weak, nonatomic) IBOutlet UIButton *musicBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftM;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleM;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightM;

@end

@implementation ArithmeticMagicCup_HomePage

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:FontName size:TitleSize],NSForegroundColorAttributeName:[UIColor redColor]}];

   AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
   appdelegate.isForcePortrait = NO;
   appdelegate.isForceLandscape = YES;
   [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
   [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
   [UIViewController attemptRotationToDeviceOrientation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ArithmeticMagicCup_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
  
    [[NSNotificationCenter defaultCenter] postNotificationName:@"defaultCup" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ArithmeticMagicCup_jump:) name:@"MysteryBoard_gameAgain" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ArithmeticMagicCup_homePage:) name:@"MysteryBoard_jumpHomePage" object:nil];
    [self setCup];
    
    if kiPhone5 {
        self.leftM.constant = 70;
        self.middleM.constant = 70;
        self.rightM.constant = 70;
    }
}

- (void)ArithmeticMagicCup_homePage:(NSNotification *)info{
    [NSObject ArithmeticMagicCup_findFromeController:self];
}

- (void)setCup{
    NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cup_useing"];
    if(number == nil){
        [[NSUserDefaults standardUserDefaults] setObject:@(1) forKey:@"Cup_useing"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)ArithmeticMagicCup_jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        ArithmeticMagicCup_GamePage *vc = [[ArithmeticMagicCup_GamePage alloc]initWithLevel:1 state:0 showTip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if([str isEqualToString:@"2"]){
        ArithmeticMagicCup_GamePage *vc = [[ArithmeticMagicCup_GamePage alloc]initWithLevel:2 state:0 showTip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }
}

- (IBAction)aboutAction:(UIButton *)buttion {
    ArithmeticMagicCup_AboutPage *vc = [[ArithmeticMagicCup_AboutPage alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)esayAction:(id)sender {
    ArithmeticMagicCup_GamePage *vc = [[ArithmeticMagicCup_GamePage alloc]initWithLevel:1 state:0 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hardAction:(id)sender {
    ArithmeticMagicCup_GamePage *vc = [[ArithmeticMagicCup_GamePage alloc]initWithLevel:2 state:0 showTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)cupAction:(id)sender {
    ArithmeticMagicCup_CupVC *vc = [[ArithmeticMagicCup_CupVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)rankAction:(id)sender {
    ArithmeticMagicCup_RankPage *vc = [[ArithmeticMagicCup_RankPage alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)musicAction:(UIButton *)buttion {
    if(self.isMusic == YES){
       [buttion setBackgroundImage:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
        [self.player pause];
    }else{
       [buttion setBackgroundImage:[UIImage imageNamed:@"turn_off"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}

@end
