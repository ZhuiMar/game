//
//  DCTHomePageVC.m
//  DigitalChildrenToy
//
//  Created by luzhaoyang on 2020/4/13.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "DCTHomePageVC.h"

@interface DCTHomePageVC ()
@property (weak, nonatomic) IBOutlet UIButton *musicBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W3;

@end

@implementation DCTHomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"dct_bg_music.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jump:) name:@"gameAgain" object:nil];
    if(kiPhone5){
        self.W1.constant = 20;
        self.W2.constant = 20;
        self.W3.constant = 20;
    }
}

- (void)jump:(NSNotification *)info{
    NSString *str = info.object;
    NSArray *arr = [str componentsSeparatedByString:@"="];
    
    NSInteger level;
    NSInteger tip;
    NSInteger score;
    NSInteger life;
    
    if(arr.count == 4){
        level = [arr[0] integerValue];
        tip = [arr[1] integerValue];
        score = [arr[2] integerValue];
        life = [arr[3] integerValue];
    }
    
    DCTGameIngPageVC *vc = [[DCTGameIngPageVC alloc]initWithLevel:level isTip:tip score:score life:life];
    [self.navigationController pushViewController:vc animated:NO];
}


- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)easyAc:(id)sender {
    DCTGameIngPageVC *vc = [[DCTGameIngPageVC alloc]initWithLevel:1 isTip:1 score:0 life:3];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)generalAc:(id)sender {
    DCTGameIngPageVC *vc = [[DCTGameIngPageVC alloc]initWithLevel:2 isTip:1 score:0 life:3];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)hardAc:(id)sender {
    DCTGameIngPageVC *vc = [[DCTGameIngPageVC alloc]initWithLevel:3 isTip:1 score:0 life:3];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)recordAc:(id)sender {
    DCTRecordsPageVC *vc = [[DCTRecordsPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)aboutAc:(id)sender {
    DCTAboutPageVC *vc = [[DCTAboutPageVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
       [self pauseMusic];
    }else{
       [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
       [self playMusic];
    }
    self.isMusic = !self.isMusic;
}

@end
