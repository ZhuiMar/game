

#import "SACHomeVC.h"

@interface SACHomeVC ()
@property (weak, nonatomic) IBOutlet UIButton *musicBtn;
@property (nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic, assign)BOOL isMusic;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *musicLeft;

@end

@implementation SACHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMusic = YES;
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"bgm.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self playMusic];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToGame:) name:@"goToGame" object:nil];
    if IS_IPHONE_X_orMore {
        self.musicLeft.constant = 50;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:DefaultFighterName object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveTheDefaultFighterName:) name:@"SaveTheDefaultFighterName" object:nil];
}

- (void)saveTheDefaultFighterName:(NSNotification *)info{
    self.view.backgroundColor = [UIColor whiteColor];
    [WSRollView findFromeController:self];
}

- (void)goToGame:(NSNotification *)info{
    NSString *string = info.object;
    SACEasyVC *easy = [[SACEasyVC alloc]initWithLevel:string];
    [self.navigationController pushViewController:easy animated:NO];
}

- (void)playMusic{
    [self.player play];
}
- (void)pauseMusic{
    [self.player pause];
}

- (IBAction)easyAction:(id)sender {
    SACEasyVC *easy = [[SACEasyVC alloc]initWithLevel:@"easy"];
    [self.navigationController pushViewController:easy animated:YES];
}
- (IBAction)hardAction:(id)sender {
    SACEasyVC *easy = [[SACEasyVC alloc]initWithLevel:@"hard"];
    [self.navigationController pushViewController:easy animated:YES];
}
- (IBAction)fighter:(id)sender {
    SACFighterVC *fighterVC = [[SACFighterVC alloc]init];
    [self.navigationController pushViewController:fighterVC animated:YES];
}
- (IBAction)rankingAction:(id)sender {
    SACRanking *rankingVc = [[SACRanking alloc]init];
    [self.navigationController pushViewController:rankingVc animated:YES];
}

- (IBAction)musicAction:(id)sender {
    if(self.isMusic == YES){
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
        [self pauseMusic];
    }else{
        [self.musicBtn setBackgroundImage:[UIImage imageNamed:@"music--no"] forState:UIControlStateNormal];
        [self playMusic];
    }
    self.isMusic = !self.isMusic;
}
- (IBAction)aboutAction:(id)sender {
    SACAboutVC *aboutVC = [[SACAboutVC alloc]init];
    [self.navigationController pushViewController:aboutVC animated:YES];
}
@end
