//
//  GPSStartPage.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import "GPSStartPage.h"

@interface GPSStartPage ()

@property (nonatomic,assign) NSInteger level;
@property (nonatomic,assign) NSInteger start;
@property (nonatomic,assign) NSInteger score;
@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (weak, nonatomic) IBOutlet UIImageView *startOne;
@property (weak, nonatomic) IBOutlet UIImageView *starTwo;
@property (weak, nonatomic) IBOutlet UIImageView *startThree;

@property (weak, nonatomic) IBOutlet UIButton *ques1;
@property (weak, nonatomic) IBOutlet UIButton *ques2;
@property (weak, nonatomic) IBOutlet UIButton *ques3;
@property (weak, nonatomic) IBOutlet UIButton *ques4;
@property (weak, nonatomic) IBOutlet UIButton *ques5;

@property (weak, nonatomic) IBOutlet UIImageView *car1;
@property (weak, nonatomic) IBOutlet UIImageView *car2;
@property (weak, nonatomic) IBOutlet UIImageView *car3;
@property (weak, nonatomic) IBOutlet UIImageView *car4;
@property (weak, nonatomic) IBOutlet UIImageView *car5;

@property (weak, nonatomic) IBOutlet UIButton *answer1;
@property (weak, nonatomic) IBOutlet UIButton *answer2;
@property (weak, nonatomic) IBOutlet UIButton *answer3;

@property (nonatomic,assign) NSInteger currentCar;
@property (nonatomic,assign) NSInteger currentAnswer;

@end

@implementation GPSStartPage

- (instancetype)initWithLevel:(NSInteger)level{
    if(self = [super init]){
        self.level = level;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.start = 3;
    [self setStartState:self.start];
    self.score = 0;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    [self showTip];
    [self clean];
    [self random];
}

- (void)clean{
    [self.answer1 setTitle:@"?" forState:UIControlStateNormal];
    [self.answer2 setTitle:@"?" forState:UIControlStateNormal];
    [self.answer3 setTitle:@"?" forState:UIControlStateNormal];
    
    [self.ques1 setTitle:@"? + ?" forState:UIControlStateNormal];
    [self.ques2 setTitle:@"? + ?" forState:UIControlStateNormal];
    [self.ques3 setTitle:@"? + ?" forState:UIControlStateNormal];
    [self.ques4 setTitle:@"? + ?" forState:UIControlStateNormal];
    [self.ques5 setTitle:@"? + ?" forState:UIControlStateNormal];
}

- (void)random{
    if(self.level == 1){
        [self randomOne];
    }else if(self.level == 2){
        [self randomTwo];
    }else{
        [self randomThree];
    }
}

- (void)randomOne{
    self.currentCar = [NSObject GPSgetRandomNumber:1 to:5];
    [self setCarIndex:self.currentCar];
    [self setQusetionIndex:self.currentCar];
}
- (void)randomTwo{
    self.currentCar = [NSObject GPSgetRandomNumber:1 to:5];
    [self setCarIndex:self.currentCar];
    [self setQusetionIndex:self.currentCar];
}
- (void)randomThree{
    
}

- (void)setQusetionIndex:(NSInteger)index{

    if(self.level == 1){
        
        NSInteger dengji = [NSObject GPSgetRandomNumber:2 to:5];
        
        NSInteger startNum = [NSObject GPSgetRandomNumber:2 to:20];
        NSInteger num1 = startNum + dengji;
        NSInteger num2 = num1 + dengji;
        NSInteger num3 = num2 + dengji;
        NSInteger num4 = num3 + dengji;
        NSInteger num5 = num4 + dengji;
        
        NSInteger left1 = [NSObject GPSgetRandomNumber:0 to:num1];
        NSInteger right1 = num1 - left1;
        NSString *oneStr = [NSString stringWithFormat:@"%ld + %ld",left1, right1];
        
        NSInteger left2 = [NSObject GPSgetRandomNumber:0 to:num2];
        NSInteger right2 = num2 - left2;
        NSString *twoStr = [NSString stringWithFormat:@"%ld + %ld",left2, right2];
        
        NSInteger left3 = [NSObject GPSgetRandomNumber:0 to:num3];
        NSInteger right3 = num3 - left3;
        NSString *threeStr = [NSString stringWithFormat:@"%ld + %ld",left3, right3];
        
        NSInteger left4 = [NSObject GPSgetRandomNumber:0 to:num4];
        NSInteger right4 = num4 - left4;
        NSString *fourStr = [NSString stringWithFormat:@"%ld + %ld",left4, right4];
        
        NSInteger left5 = [NSObject GPSgetRandomNumber:0 to:num5];
        NSInteger right5 = num5 - left5;
        NSString *fiveStr = [NSString stringWithFormat:@"%ld + %ld",left5, right5];
        
        [self.ques1 setTitle:oneStr forState:UIControlStateNormal];
        [self.ques2 setTitle:twoStr forState:UIControlStateNormal];
        [self.ques3 setTitle:threeStr forState:UIControlStateNormal];
        [self.ques4 setTitle:fourStr forState:UIControlStateNormal];
        [self.ques5 setTitle:fiveStr forState:UIControlStateNormal];
        
        NSInteger right = 0;
        if(index == 1){
            right = num1;
        }else if (index == 2){
            right = num2;
        }else if (index == 3){
            right = num3;
        }else if (index == 4){
            right = num4;
        }else if (index == 5){
            right = num5;
        }
        
        self.currentAnswer = [NSObject GPSgetRandomNumber:1 to:3];
        if(self.currentAnswer == 1){
            [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
            [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
        }else if (self.currentAnswer == 2){
            [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
            [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
        }else{
            [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
        }

    }else if(self.level == 2){
        
        NSInteger dengji = [NSObject GPSgetRandomNumber:2 to:5];
        NSInteger startNum = [NSObject GPSgetRandomNumber:40 to:50];
        NSInteger num1 = startNum - dengji;
        NSInteger num2 = num1 - dengji;
        NSInteger num3 = num2 - dengji;
        NSInteger num4 = num3 - dengji;
        NSInteger num5 = num4 - dengji;
        
        NSInteger left1 = [NSObject GPSgetRandomNumber:0 to:num1];
        NSInteger right1 = num1 - left1;
        NSString *oneStr = [NSString stringWithFormat:@"%ld + %ld",left1, right1];
        
        NSInteger left2 = [NSObject GPSgetRandomNumber:0 to:num2];
        NSInteger right2 = num2 - left2;
        NSString *twoStr = [NSString stringWithFormat:@"%ld + %ld",left2, right2];
        
        NSInteger left3 = [NSObject GPSgetRandomNumber:0 to:num3];
        NSInteger right3 = num3 - left3;
        NSString *threeStr = [NSString stringWithFormat:@"%ld + %ld",left3, right3];
        
        NSInteger left4 = [NSObject GPSgetRandomNumber:0 to:num4];
        NSInteger right4 = num4 - left4;
        NSString *fourStr = [NSString stringWithFormat:@"%ld + %ld",left4, right4];
        
        NSInteger left5 = [NSObject GPSgetRandomNumber:0 to:num5];
        NSInteger right5 = num5 - left5;
        NSString *fiveStr = [NSString stringWithFormat:@"%ld + %ld",left5, right5];
        
        [self.ques1 setTitle:oneStr forState:UIControlStateNormal];
        [self.ques2 setTitle:twoStr forState:UIControlStateNormal];
        [self.ques3 setTitle:threeStr forState:UIControlStateNormal];
        [self.ques4 setTitle:fourStr forState:UIControlStateNormal];
        [self.ques5 setTitle:fiveStr forState:UIControlStateNormal];
        
        NSInteger right = 0;
        if(index == 1){
            right = num1;
        }else if (index == 2){
            right = num2;
        }else if (index == 3){
            right = num3;
        }else if (index == 4){
            right = num4;
        }else if (index == 5){
            right = num5;
        }
        
        self.currentAnswer = [NSObject GPSgetRandomNumber:1 to:3];
        if(self.currentAnswer == 1){
            [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
            [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
        }else if (self.currentAnswer == 2){
            [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
            [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
        }else{
            [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
            [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
        }
    
    }else{
    
       NSInteger dengji = [NSObject GPSgetRandomNumber:2 to:5];
       NSInteger startNum = [NSObject GPSgetRandomNumber:5 to:70];
       NSInteger num1 = startNum + dengji + 0;
       NSInteger num2 = num1 + dengji + 1;
       NSInteger num3 = num2 + dengji + 2;
       NSInteger num4 = num3 + dengji + 3;
       NSInteger num5 = num4 + dengji + 4;
       
       NSInteger left1 = [NSObject GPSgetRandomNumber:0 to:num1];
       NSInteger right1 = num1 - left1;
       NSString *oneStr = [NSString stringWithFormat:@"%ld + %ld",left1, right1];
       
       NSInteger left2 = [NSObject GPSgetRandomNumber:0 to:num2];
       NSInteger right2 = num2 - left2;
       NSString *twoStr = [NSString stringWithFormat:@"%ld + %ld",left2, right2];
       
       NSInteger left3 = [NSObject GPSgetRandomNumber:0 to:num3];
       NSInteger right3 = num3 - left3;
       NSString *threeStr = [NSString stringWithFormat:@"%ld + %ld",left3, right3];
       
       NSInteger left4 = [NSObject GPSgetRandomNumber:0 to:num4];
       NSInteger right4 = num4 - left4;
       NSString *fourStr = [NSString stringWithFormat:@"%ld + %ld",left4, right4];
       
       NSInteger left5 = [NSObject GPSgetRandomNumber:0 to:num5];
       NSInteger right5 = num5 - left5;
       NSString *fiveStr = [NSString stringWithFormat:@"%ld + %ld",left5, right5];
       
       [self.ques1 setTitle:oneStr forState:UIControlStateNormal];
       [self.ques2 setTitle:twoStr forState:UIControlStateNormal];
       [self.ques3 setTitle:threeStr forState:UIControlStateNormal];
       [self.ques4 setTitle:fourStr forState:UIControlStateNormal];
       [self.ques5 setTitle:fiveStr forState:UIControlStateNormal];
       
       NSInteger right = 0;
       if(index == 1){
           right = num1;
       }else if (index == 2){
           right = num2;
       }else if (index == 3){
           right = num3;
       }else if (index == 4){
           right = num4;
       }else if (index == 5){
           right = num5;
       }
       
       self.currentAnswer = [NSObject GPSgetRandomNumber:1 to:3];
       if(self.currentAnswer == 1){
           [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
           [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
           [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
       }else if (self.currentAnswer == 2){
           [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
           [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
           [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
       }else{
           [self.answer1 setTitle:[NSString stringWithFormat:@"%ld",right + [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
           [self.answer2 setTitle:[NSString stringWithFormat:@"%ld",right - [NSObject GPSgetRandomNumber:1 to:3]] forState:UIControlStateNormal];
           [self.answer3 setTitle:[NSString stringWithFormat:@"%ld",right] forState:UIControlStateNormal];
       }

    }
}


- (IBAction)answerOneAction:(id)sender {
    if(self.currentAnswer == 1){
        // open car
        [self right];
        self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    }else{
        [self wrong];
        self.start = self.start - 1;
        [self setStartState:self.start];
    }
    [self random];
}

- (IBAction)answerTwoAction:(id)sender {
    if(self.currentAnswer == 2){
        // open car
        [self right];
        self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    }else{
         [self wrong];
         self.start = self.start - 1;
         [self setStartState:self.start];
    }
    [self random];
}

- (IBAction)answerThreeAction:(id)sender {
    if(self.currentAnswer == 3){
        // open car
        [self right];
        self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    }else{
         [self wrong];
         self.start = self.start - 1;
         [self setStartState:self.start];
    }
    [self random];
}

- (void)setCarIndex:(NSInteger)index{
    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5"];
    NSInteger ind = [NSObject GPSgetRandomNumber:0 to:4];
    NSString *imageName = arr[ind];
    if(index == 1){
        self.car1.image = [UIImage imageNamed:imageName];
        self.car2.image = [UIImage imageNamed:@""];
        self.car3.image = [UIImage imageNamed:@""];
        self.car4.image = [UIImage imageNamed:@""];
        self.car5.image = [UIImage imageNamed:@""];
    }else if (index == 2){
        self.car1.image = [UIImage imageNamed:@""];
        self.car2.image = [UIImage imageNamed:imageName];
        self.car3.image = [UIImage imageNamed:@""];
        self.car4.image = [UIImage imageNamed:@""];
        self.car5.image = [UIImage imageNamed:@""];
    }else if (index == 3){
        self.car1.image = [UIImage imageNamed:@""];
        self.car2.image = [UIImage imageNamed:@""];
        self.car3.image = [UIImage imageNamed:imageName];
        self.car4.image = [UIImage imageNamed:@""];
        self.car5.image = [UIImage imageNamed:@""];
    }else if (index == 4){
        self.car1.image = [UIImage imageNamed:@""];
        self.car2.image = [UIImage imageNamed:@""];
        self.car3.image = [UIImage imageNamed:@""];
        self.car4.image = [UIImage imageNamed:imageName];
        self.car5.image = [UIImage imageNamed:@""];
    }else if (index == 5){
        self.car1.image = [UIImage imageNamed:@""];
        self.car2.image = [UIImage imageNamed:@""];
        self.car3.image = [UIImage imageNamed:@""];
        self.car4.image = [UIImage imageNamed:@""];
        self.car5.image = [UIImage imageNamed:imageName];
    }
}

- (void)setStartState:(NSInteger)start{
    if(start == 3){
        [self.startOne setHidden:NO];
        [self.starTwo setHidden:NO];
        [self.startThree setHidden:NO];
    }
    else if (start == 2){
        [self.startOne setHidden:YES];
        [self.starTwo setHidden:NO];
        [self.startThree setHidden:NO];
    }
    else if (start == 1){
        [self.startOne setHidden:YES];
        [self.starTwo setHidden:YES];
        [self.startThree setHidden:NO];
    }
    else{
        [self.startOne setHidden:YES];
        [self.starTwo setHidden:YES];
        [self.startThree setHidden:YES];
        GPSGameOverPage *vc = [[GPSGameOverPage alloc]initWithScore:self.score homeBlock:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } againBlock:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"againGame" object:[NSString stringWithFormat:@"%ld",self.level]];
            [self.navigationController popViewControllerAnimated:NO];
        }];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        [self save];
    }
}

- (void)showTip{
    GPSHowToPlayPage *vc = [[GPSHowToPlayPage alloc]init];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)save{
    if(self.level == 1){
        [NSObject GPSsaveScore:self.score key:@"simple"];
    }else if(self.level == 2){
        [NSObject GPSsaveScore:self.score key:@"general"];
    }else{
        [NSObject GPSsaveScore:self.score key:@"difficult"];
    }
}

- (void)right{
    self.score = self.score + 100;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",self.score];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"gps_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}

- (void)wrong{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"gps_error.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}

@end
