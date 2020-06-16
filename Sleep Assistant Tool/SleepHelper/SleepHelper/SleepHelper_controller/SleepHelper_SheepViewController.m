//
//  SleepHelper_SheepViewController.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_SheepViewController.h"

@interface SleepHelper_SheepViewController ()

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,assign) NSInteger score;
@property (weak, nonatomic) IBOutlet UILabel *sheepLabel;

@property (weak, nonatomic) IBOutlet UIImageView *sheepOne;
@property (weak, nonatomic) IBOutlet UIImageView *sheepTwo;
@property (weak, nonatomic) IBOutlet UIImageView *sheepThree;
@property (weak, nonatomic) IBOutlet UIButton *addSheepBtn;

@property (nonatomic, strong) NSTimer *runTimer;

@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int timerCount;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstBottom;

@end

@implementation SleepHelper_SheepViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.timerCount = 0;
    self.countTimer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(countTimerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.countTimer forMode:NSDefaultRunLoopMode];
}

- (void)countTimerAction{
    self.timerCount = self.timerCount + 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.sheepTwo setHidden:YES];
    [self.sheepThree setHidden:YES];
    [self.sheepOne setHidden:YES];
    [self.addSheepBtn setEnabled:NO];
    
    NSInteger count = [NSObject SleepHelper_getRandomNumber:1 to:3];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(count * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self random];
    });
    
    SleepHelper_navigation *anvigate = (SleepHelper_navigation *)self.navigationController;
    
    anvigate.returnBlock = ^{
        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
        if(self.countTimer != nil){
            [self.countTimer invalidate];
            self.countTimer = nil;
        }

        // save timer
        RLMResults *results = [SleepHelper_TimeModel objectsWhere:@"time == %@",[self getToday]];
        SleepHelper_TimeModel *model = results.firstObject;
        if(model){
            
            NSInteger countinglambs = [model.countinglambs integerValue] + self.timerCount;
            NSString *countinglambString = [NSString stringWithFormat:@"%d",countinglambs];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                model.countinglambs = countinglambString;
            }];
            
        }else{
            
            SleepHelper_TimeModel *model = [[SleepHelper_TimeModel alloc]init];
            model.time = [self getToday];
            model.countinglambs = [NSString stringWithFormat:@"%d",self.timerCount];
            model.pokebubbles = [NSString stringWithFormat:@"%d",0];
            model.fallingstar = [NSString stringWithFormat:@"%d",0];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                [realm addObject:model];
            }];
        }
    };
    
    if IS_IPHONE_X_orMore {
        self.bottomLayout.constant = 250;
        self.firstBottom.constant = 150;
    }
}

- (NSString *)getToday{
    NSDate *date = [NSDate date];
    NSDateFormatter *format1 = [[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy/MM/dd"];
    NSString *dateStr;
    dateStr = [format1 stringFromDate:date];
    return dateStr;
}


- (void)random{
    [self music];
    [self.addSheepBtn setEnabled:YES];
    NSInteger index = [NSObject SleepHelper_getRandomNumber:0 to:2];
    if(index == 0){
        
        [self.sheepTwo setHidden:YES];
        [self.sheepThree setHidden:YES];
        [self.sheepOne setHidden:NO];
        
    }else if(index == 1){
        
        [self.sheepTwo setHidden:NO];
        [self.sheepThree setHidden:YES];
        [self.sheepOne setHidden:YES];
        
    }else if(index == 2){
        
        [self.sheepTwo setHidden:YES];
        [self.sheepThree setHidden:NO];
        [self.sheepOne setHidden:YES];
    }
}

- (void)music{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"sheep.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}
- (IBAction)sheepAction:(id)sender {
    
    self.score = self.score + 1;
    self.sheepLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    [self.addSheepBtn setEnabled:NO];
    
    [self.sheepTwo setHidden:YES];
    [self.sheepThree setHidden:YES];
    [self.sheepOne setHidden:YES];
    
    NSInteger count = [NSObject SleepHelper_getRandomNumber:1 to:3];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(count * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self random];
    });
}

@end
