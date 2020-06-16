//
//  BuoyMath_HomePageVC.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_HomePageVC.h"
#import "AppDelegate.h"

@interface BuoyMath_HomePageVC ()


@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@property (weak, nonatomic) IBOutlet UIButton *musicBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutAction;

@end

@implementation BuoyMath_HomePageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"BuoyMath_bg.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"setBackground" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BuoyMath_jump:) name:@"BuoyMath_gameAgain" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BuoyMath_homePage:) name:@"homePage" object:nil];
}

- (void)BuoyMath_homePage:(NSNotification *)info{
    [NSObject BuoyMath_findFromeController:self];
}

- (void)BuoyMath_jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        BuoyMath_gamePageVC *vc = [[BuoyMath_gamePageVC alloc]initWithScore:0 level:1 life:3 tip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if([str isEqualToString:@"2"]){
       BuoyMath_gamePageVC *vc = [[BuoyMath_gamePageVC alloc]initWithScore:0 level:2 life:3 tip:NO];
       [self.navigationController pushViewController:vc animated:NO];
    }
}

- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
        [self.player pause];
    }else{
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music-no"] forState:UIControlStateNormal];
       [self.player play];
    }
    self.isMusic = !self.isMusic;
}

- (IBAction)aboutAction:(id)sender {
    BuoyMath_AboutPageVC *vc = [[BuoyMath_AboutPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)comAction:(id)sender {
    BuoyMath_gamePageVC *vc = [[BuoyMath_gamePageVC alloc]initWithScore:0 level:1 life:3 tip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)takeAction:(id)sender {
    BuoyMath_gamePageVC *vc = [[BuoyMath_gamePageVC alloc]initWithScore:0 level:2 life:3 tip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)recodAction:(id)sender {
    BuoyMath_MyRecordPageVC *vc = [[BuoyMath_MyRecordPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
