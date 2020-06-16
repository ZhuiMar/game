//
//  SleepHelper_PopViewController.m
//  SleepHelper
//
//  Created by zy on 2020/5/18.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelper_PopViewController.h"

@interface SleepHelper_PopViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, strong) NSTimer *findTimer;
@property (nonatomic, strong) NSTimer *moveTimer;
@property (nonatomic, strong) NSMutableArray *pops;

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,assign) NSInteger score;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int timerCount;

@end

@implementation SleepHelper_PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerCount = 0;
    
    [self random];
      
    self.runTimer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];
    self.findTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(findPops) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.findTimer forMode:NSDefaultRunLoopMode];
    self.moveTimer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(movePops) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.moveTimer forMode:NSDefaultRunLoopMode];
  
    self.countTimer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(countTimerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.countTimer forMode:NSDefaultRunLoopMode];

    
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
        if(self.moveTimer != nil){
            [self.moveTimer invalidate];
            self.moveTimer = nil;
        }
        if(self.countTimer != nil){
            [self.countTimer invalidate];
            self.countTimer = nil;
        }

        // save timer
        RLMResults *results = [SleepHelper_TimeModel objectsWhere:@"time == %@",[self getToday]];
        SleepHelper_TimeModel *model = results.firstObject;
        if(model){
            
            NSInteger pokebubbles = [model.pokebubbles integerValue] + self.timerCount;
            NSString *pokebubblesString = [NSString stringWithFormat:@"%ld",pokebubbles];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                model.pokebubbles = pokebubblesString;
            }];
            
        }else{
            
            SleepHelper_TimeModel *model = [[SleepHelper_TimeModel alloc]init];
            model.time = [self getToday];
            model.countinglambs = [NSString stringWithFormat:@"%d",0];
            model.pokebubbles = [NSString stringWithFormat:@"%d",self.timerCount];
            model.fallingstar = [NSString stringWithFormat:@"%d",0];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                [realm addObject:model];
            }];
        }
    };
}

- (void)countTimerAction{
    self.timerCount = self.timerCount + 1;
}

- (NSString *)getToday{
    NSDate *date = [NSDate date];
    NSDateFormatter *format1 = [[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy/MM/dd"];
    NSString *dateStr;
    dateStr = [format1 stringFromDate:date];
    return dateStr;
}

- (void)timerRun{
    [self random];
}
- (void)findPops{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (UIImageView *imageView in self.pops) {
        [arr addObject:imageView];
    }
    for (UIImageView *imageView in arr) {
        CGRect frame = imageView.frame;
        if(frame.origin.y+82 < 0){
            [self.pops removeObject:imageView];
            [imageView removeFromSuperview];
        }
    }
}

- (void)movePops{
    for (UIButton *item in self.pops) {
        CGRect frame = item.frame;
        CGFloat y = frame.origin.y - 0.2;
        CGFloat w = frame.size.width;
        CGFloat h = frame.size.height;
        item.frame = CGRectMake(frame.origin.x, y, w, h);
    }
}

- (void)random{
    NSInteger count = [NSObject SleepHelper_getRandomNumber:0 to:2];
    UIImageView *popimage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"blister"]];
    if(count == 0){
       popimage.frame = CGRectMake([NSObject SleepHelper_getRandomNumber:10 to:KWidth-64], KHeight-10, 44, 44);
    }
    if (count == 1){
       popimage.frame = CGRectMake([NSObject SleepHelper_getRandomNumber:10 to:KWidth-74], KHeight-10, 54, 54);
    }
    if (count == 2){
       popimage.frame = CGRectMake([NSObject SleepHelper_getRandomNumber:10 to:KWidth-82], KHeight-10, 72, 72);
    }
    
    [self.view addSubview:popimage];
    [self.pops addObject:popimage];
    popimage.userInteractionEnabled = YES;
    popimage.contentMode = UIViewContentModeScaleAspectFill;
    UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    tapRecognize.numberOfTapsRequired = 1;
    tapRecognize.delegate = self;
    [tapRecognize setEnabled :YES];
    [tapRecognize delaysTouchesBegan];
    [tapRecognize cancelsTouchesInView];
    [popimage addGestureRecognizer:tapRecognize];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer{
    UIImageView *imageView = (UIImageView *)recognizer.view;
    imageView.image = [UIImage imageNamed:@"Broken blister"];
    [self.pops removeObject:imageView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [imageView removeFromSuperview];
    });
    [self music];
}

- (void)music{
    self.score = self.score + 1;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"pop.mp3" withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}

- (NSMutableArray *)pops{
    if(_pops == nil){
        _pops = [[NSMutableArray alloc]init];
    }
    return _pops;
}



@end
