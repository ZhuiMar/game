//
//  DEHomePage.m
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import "DEHomePage.h"

@interface DEHomePage ()

@property (weak, nonatomic) IBOutlet UIButton *nusicBtn;
@property (weak, nonatomic) IBOutlet UIButton *aboutBtn;

@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;

@end

@implementation DEHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isMusic = YES;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"de_bg_music.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jump:) name:@"gameAgain" object:nil];
}

- (void)jump:(NSNotification *)info{
    NSString *str = info.object;
    if([str isEqualToString:@"1"]){
        DEGamePage *vc = [[DEGamePage alloc]initWithLevel:1 isShowTip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }else if([str isEqualToString:@"2"]){
        DEGamePage *vc = [[DEGamePage alloc]initWithLevel:2 isShowTip:NO];
        [self.navigationController pushViewController:vc animated:NO];
    }else{
        DEGamePage *vc = [[DEGamePage alloc]initWithLevel:3 isShowTip:NO];
        [self.navigationController pushViewController:vc animated:NO ];
    }
}

- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
       [self.nusicBtn setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
       [self pauseMusic];
    }else{
       [self.nusicBtn setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
       [self playMusic];
    }
    self.isMusic = !self.isMusic;
}

- (IBAction)aboutAction:(id)sender {
    DEAboutPage *vc = [[DEAboutPage alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)simAction:(id)sender {
    DEGamePage *vc = [[DEGamePage alloc]initWithLevel:1 isShowTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)genAction:(id)sender {
    DEGamePage *vc = [[DEGamePage alloc]initWithLevel:2 isShowTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)diffAction:(id)sender {
    DEGamePage *vc = [[DEGamePage alloc]initWithLevel:3 isShowTip:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)recAction:(id)sender {
    DERankPage *vc = [[DERankPage alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
