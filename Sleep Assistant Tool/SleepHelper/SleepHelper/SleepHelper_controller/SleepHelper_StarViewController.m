//
//  SleepHelper_StarViewController.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_StarViewController.h"

@interface SleepHelper_StarViewController ()

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,assign) NSInteger score;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int timerCount;

@end

@implementation SleepHelper_StarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn.titleLabel.font = [UIFont fontWithName:FontName size:25];
    [self.btn setEnabled:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self random];
    });
    
    self.timerCount = 0;
    
    self.countTimer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(countTimerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.countTimer forMode:NSDefaultRunLoopMode];
    
    SleepHelper_navigation *anvigate = (SleepHelper_navigation *)self.navigationController;
    
    anvigate.returnBlock = ^{
        if(self.countTimer != nil){
            [self.countTimer invalidate];
            self.countTimer = nil;
        }
        
        // save timer
        RLMResults *results = [SleepHelper_TimeModel objectsWhere:@"time == %@",[self getToday]];
        SleepHelper_TimeModel *model = results.firstObject;
        if(model){
            
            NSInteger fallingstar = [model.fallingstar integerValue] + self.timerCount;
            NSString *fallingstarString = [NSString stringWithFormat:@"%ld",fallingstar];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                model.fallingstar = fallingstarString;
            }];
            
        }else{
            
            SleepHelper_TimeModel *model = [[SleepHelper_TimeModel alloc]init];
            model.time = [self getToday];
            model.countinglambs = [NSString stringWithFormat:@"%d",0];
            model.pokebubbles = [NSString stringWithFormat:@"%d",0];
            model.fallingstar = [NSString stringWithFormat:@"%d",self.timerCount];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                [realm addObject:model];
            }];
        }
    };
}

- (NSString *)getToday{
    NSDate *date = [NSDate date];
    NSDateFormatter *format1 = [[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy/MM/dd"];
    NSString *dateStr;
    dateStr = [format1 stringFromDate:date];
    return dateStr;
}

- (void)countTimerAction{
    self.timerCount = self.timerCount + 1;
}

- (void)random{
    [self.btn setEnabled:YES];
    UIImageView *imageView = [[UIImageView alloc]init];
    NSInteger top = [NSObject SleepHelper_getRandomNumber:-100 to:200];
    imageView.frame = CGRectMake(KWidth-16.5, top, 171, 126);
    imageView.image = [UIImage imageNamed:@"meteor"];
    [self.view addSubview:imageView];
    [self music];
    [UIView animateWithDuration:3 animations:^{
        imageView.frame = CGRectMake(-171-16.5, top+400, 171, 126);
    }];
}

- (void)music{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"start.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}

- (IBAction)startAction:(id)sender {
    self.score = self.score + 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    [self.btn setEnabled:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self random];
    });
}

@end
