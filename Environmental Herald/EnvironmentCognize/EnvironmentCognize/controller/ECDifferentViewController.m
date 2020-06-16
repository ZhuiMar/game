//
//  ECDifferentViewController.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECDifferentViewController.h"

@interface ECDifferentViewController ()<ECItemDelegate>

@property (nonatomic,assign) NSInteger type;
@property (nonatomic,assign) NSInteger scoure;

@property(nonatomic,strong) UIBarButtonItem *rightBtn;
@property(nonatomic,strong) UILabel *countDownLabel;

@property(nonatomic,assign) NSInteger hang;
@property(nonatomic,assign) NSInteger lie;
@property(nonatomic,assign) CGFloat marg;
@property(nonatomic,assign) CGFloat wight;
@property(nonatomic,assign) CGFloat height;

@property (nonatomic,strong)NSMutableArray *imageOne;
@property (nonatomic,strong)NSMutableArray *imageTwo;
@property (nonatomic,strong)NSMutableArray *imageThree;
@property (nonatomic,strong)NSMutableArray *imageFour;

@property(nonatomic,assign) NSInteger totalNum;

@property(nonatomic,strong)UIImageView *titleImageView;

@property(nonatomic,assign) NSInteger rightCount;
@property(nonatomic,assign) NSInteger wrongCount;

@end


@implementation ECDifferentViewController

- (instancetype)initWithTpye:(NSInteger)type{
    if(self == [super init]){
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.type == 1){
        [self startOne];
        self.totalNum = 3;
    }else if (self.type == 2){
        [self startTwo];
        self.totalNum = 3;
    }else{
        [self startThree];
        self.totalNum = 3;
    }
    self.navigationItem.titleView = self.titleImageView;
    self.navigationItem.rightBarButtonItem = self.rightBtn;
}

- (void)gemeOver{
    
}

- (UIBarButtonItem *)rightBtn{
    if(_rightBtn == nil){
        _rightBtn = [[UIBarButtonItem alloc] initWithCustomView:self.countDownLabel];
    }
    return _rightBtn;
}
- (UILabel *)countDownLabel{
    if(_countDownLabel == nil){
        _countDownLabel = [[UILabel alloc]init];
        _countDownLabel.font = [UIFont fontWithName:FontNameTitle size:27];
        _countDownLabel.text = [NSString stringWithFormat:@"0/%ld",self.totalNum];
        _countDownLabel.textColor = [NSObject colorWithHexString:@"#65314C"];
    }
    return _countDownLabel;
}


- (void)startTwo {
    
    self.hang = 5;
    self.lie = 3;
    self.marg = 20;
    self.wight = 80;
    self.height = 80;
    
    NSMutableArray *images = [[NSMutableArray alloc]init];
    for (NSString *str in self.imageOne) {
        [images addObject:str];
    }
    for (NSString *str in self.imageFour) {
        [images addObject:str];
    }
    
    NSString *oneStr = self.imageTwo[0];
    NSString *oneTwo = self.imageTwo[1];
    NSString *oneThree = self.imageTwo[2];
    
    [images addObject:oneStr];
    [images addObject:oneTwo];
    [images addObject:oneThree];
    
    NSMutableArray *newArr = [NSObject getRandomArrFrome:images];
    
    
    CGFloat left = 0;
    if kiPhone5 {
        left = 30;
    }
    
    CGFloat leftMarg = (Iphone_Width - ((self.lie * self.wight) + (self.lie - 1) * self.marg))/2 + left;
    
    for (int i = 0; i < self.lie; i++) {
        for (int j = 0; j < self.hang; j++) {
            CGRect frame = CGRectMake(leftMarg + i * (self.wight + self.marg), 100 + j * (self.wight + self.marg), self.wight, self.height);
            ECItem *item = [ECItem getImageView:@"" right:0 frame:frame];
            item.backgroundColor = [UIColor clearColor];
            item.delegate = self;
           
            //
            if(i == 0 && j == 0){
                NSString *string = newArr[0];
                UIImage *image = [UIImage imageNamed:string];
                item.imageView.image = image;
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 1){
                NSString *string = newArr[1];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 2){
                NSString *string = newArr[2];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 3){
                NSString *string = newArr[3];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 4){
                NSString *string = newArr[4];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }

            
            //
            if(i == 1 && j == 0){
                NSString *string = newArr[5];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 1){
                NSString *string = newArr[6];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 2){
                NSString *string = newArr[7];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 3){
                NSString *string = newArr[8];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 4){
                NSString *string = newArr[9];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }

            
            //
            if(i == 2 && j == 0){
                NSString *string = newArr[10];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 1){
                NSString *string = newArr[11];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 2){
                NSString *string = newArr[12];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 3){
                NSString *string = newArr[13];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 4){
                NSString *string = newArr[14];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            [self.view addSubview:item];
        }
    }
}


// game over
- (void)rightItem{
    self.rightCount = self.rightCount + 1;
    self.countDownLabel.text = [NSString stringWithFormat:@"%ld/3",self.rightCount];
    
    if(self.rightCount == 3){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ECGameOverUIViewController *vc = [[ECGameOverUIViewController alloc]initWithScore:3];
            [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
            vc.homeBlock = ^{
                 [self.navigationController popToRootViewControllerAnimated:YES];
            };
            vc.againBlock = ^{
                [self.navigationController popViewControllerAnimated:NO];
                NSString *str = [NSString stringWithFormat:@"%ld",self.type];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"goToFindVC" object:str];
            };
        });
    }
}


- (void)wrongItem{
    self.wrongCount = self.wrongCount + 1;
    if (self.wrongCount == 5){
        ECGameOverUIViewController *vc = [[ECGameOverUIViewController alloc]initWithScore:2];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
        vc.homeBlock = ^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        };
        vc.againBlock = ^{
            NSString *str = [NSString stringWithFormat:@"%ld",self.type];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"goToFindVC" object:str];
            [self.navigationController popViewControllerAnimated:NO];
        };
    }
}

- (void)startOne{
    
    self.hang = 3;
    self.lie = 3;
    self.marg = 20;
    self.wight = 90;
    self.height = 90;
    
    NSMutableArray *images = [[NSMutableArray alloc]init];
    NSInteger num1 = [NSObject getRandomNumber:0 to:3];
    NSInteger num2;

    do{
        num2 = [NSObject getRandomNumber:0 to:3];
    }while (num2 == num1);


    // num1
    if (num1 == 0){
        for (NSString *string in self.imageOne) {
            [images addObject:string];
        }
    }
    else if (num1 == 1){
        for (NSString *string in self.imageTwo) {
            [images addObject:string];
        }
    }
    else if (num1 == 2){
        for (NSString *string in self.imageThree) {
            [images addObject:string];
        }
    }
    else if (num1 == 3){
        for (NSString *string in self.imageFour) {
            [images addObject:string];
        }
    }
    

    // num2
    if (num2 == 0){
        for(int i = 0; i < 3; i++){
            [images addObject:self.imageOne[i]];
        }
    }
    else if (num2 == 1){
        for(int i = 0; i < 3; i++){
             [images addObject:self.imageTwo[i]];
        }
    }
    else if (num2 == 2){
        for(int i = 0; i < 3; i++){
             [images addObject:self.imageThree[i]];
        }
    }
    else if (num2 == 3){
        for(int i = 0; i < 3; i++){
             [images addObject:self.imageFour[i]];
        }
    }

    NSString *oneStr = images[images.count - 1];
    NSString *oneTwo = images[images.count - 2];
    NSString *oneThree = images[images.count - 3];
    
    NSMutableArray *newArr = [NSObject getRandomArrFrome:images];
    
    CGFloat left = 0;
    if kiPhone5 {
        left = 30;
    }
    if kiPhone6Plus {
        left = -15;
    }
    
    CGFloat leftMarg = (Iphone_Width - ((self.lie * self.wight) + (self.lie - 1) * self.marg))/2 + left;
    for (int i = 0; i < self.lie; i++) {
        for (int j = 0; j < self.hang; j++) {
            CGRect frame = CGRectMake(leftMarg + i * (self.wight + self.marg), 150 + j * (self.wight + self.marg), self.wight, self.height);
            ECItem *item = [ECItem getImageView:@"" right:0 frame:frame];
            item.backgroundColor = [UIColor clearColor];
            item.delegate = self;
           
            //
            if(i == 0 && j == 0){
                NSString *string = newArr[0];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 1){
                NSString *string = newArr[1];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 2){
                NSString *string = newArr[2];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }

            
            //
            if(i == 1 && j == 0){
                NSString *string = newArr[3];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 1){
                NSString *string = newArr[4];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 2){
                NSString *string = newArr[5];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }

            //
            if(i == 2 && j == 0){
                NSString *string = newArr[6];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 1){
                NSString *string = newArr[7];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 2){
                NSString *string = newArr[8];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            [self.view addSubview:item];
        }
    }
}


- (void)startThree{
    
    self.hang = 6;
    self.lie = 3;
    self.marg = 20;
    self.wight = 80;
    self.height = 80;
    
    NSMutableArray *images = [[NSMutableArray alloc]init];
    for (NSString *str in self.imageOne) {
        [images addObject:str];
    }
    for (NSString *str in self.imageFour) {
        [images addObject:str];
    }
    
    [images addObject:self.imageTwo[0]];
    [images addObject:self.imageTwo[1]];
    [images addObject:self.imageTwo[2]];
    
    NSString *oneStr = self.imageTwo[3];
    NSString *oneTwo = self.imageTwo[4];
    NSString *oneThree = self.imageTwo[5];
    
    [images addObject:oneStr];
    [images addObject:oneTwo];
    [images addObject:oneThree];
    
    NSMutableArray *newArr = [NSObject getRandomArrFrome:images];
    
    CGFloat left = 0;
    if kiPhone5 {
        left = 30;
    }
    
    CGFloat leftMarg = (Iphone_Width - ((self.lie * self.wight) + (self.lie - 1) * self.marg))/2 + left;
    for (int i = 0; i < self.lie; i++) {
        for (int j = 0; j < self.hang; j++) {
            CGRect frame = CGRectMake(leftMarg + i * (self.wight + self.marg), 64 + j * (self.wight + self.marg), self.wight, self.height);
            ECItem *item = [ECItem getImageView:@"" right:0 frame:frame];
            item.backgroundColor = [UIColor clearColor];
            item.delegate = self;
           
            //
            if(i == 0 && j == 0){
                NSString *string = newArr[0];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 1){
                NSString *string = newArr[1];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 2){
                NSString *string = newArr[2];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 3){
                NSString *string = newArr[3];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 4){
                NSString *string = newArr[4];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 0 && j == 5){
                NSString *string = newArr[5];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }

            //
            if(i == 1 && j == 0){
                NSString *string = newArr[6];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 1){
                NSString *string = newArr[7];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 2){
                NSString *string = newArr[8];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 3){
                NSString *string = newArr[9];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 4){
                NSString *string = newArr[10];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 1 && j == 5){
                NSString *string = newArr[11];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
        
            //
            if(i == 2 && j == 0){
                NSString *string = newArr[12];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 1){
                NSString *string = newArr[13];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 2){
                NSString *string = newArr[14];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 3){
                NSString *string = newArr[15];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 4){
                NSString *string = newArr[16];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            if(i == 2 && j == 5){
                NSString *string = newArr[17];
                item.imageView.image = [UIImage imageNamed:string];
                if([string isEqualToString:oneStr] || [string isEqualToString:oneTwo] || [string isEqualToString:oneThree]){
                    item.one = 1;
                }else{
                    item.one = 0;
                }
            }
            [self.view addSubview:item];
        }
    }
}


// gan
- (NSMutableArray *)imageOne{
    if(_imageOne == nil){
       _imageOne = [[NSMutableArray alloc]initWithArray:@[@"chopsticks",
                                                       @"towel",
                                                       @"cigarette_butts",
                                                       @"bowl",
                                                       @"lunch_box",
                                                       @"old_clothes"]];
    }
    return _imageOne;
}


// shi
- (NSMutableArray *)imageTwo{
    if(_imageTwo == nil){
       _imageTwo = [[NSMutableArray alloc]initWithArray:@[@"peanut_shells",
                                                       @"cauliflower",
                                                       @"fish_bones",
                                                       @"banana_peel",
                                                       @"apple_core",
                                                       @"leaves"]];
    }
    return _imageTwo;
}
- (NSMutableArray *)imageThree{
    if(_imageThree == nil){
       _imageThree = [[NSMutableArray alloc]initWithArray:@[@"insecticide",
                                                        @"drug",
                                                        @"battery",
                                                        @"apple_core",
                                                        @"thermometer",
                                                        @"paint_bucket"]];
    }
    return _imageThree;
}

// gan
- (NSMutableArray *)imageFour{
    if(_imageFour == nil){
       _imageFour = [[NSMutableArray alloc]initWithArray:@[@"carton",
                                                       @"plastic_bottle",
                                                       @"cans",
                                                       @"glass",
                                                       @"newspaper",
                                                       @"Puppet"]];
    }
    return _imageFour;
}
- (UIImageView *)titleImageView{
    if(_titleImageView == nil){
        if(self.type == 1){
            _titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
        }else if (self.type == 2){
            _titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
        }else{
            _titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3"]];
        }
    }
    return _titleImageView;
}

@end
