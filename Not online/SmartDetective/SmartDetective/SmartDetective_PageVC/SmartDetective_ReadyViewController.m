//
//  SmartDetective_ReadyViewController.m
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SmartDetective_ReadyViewController.h"

@interface SmartDetective_ReadyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countDown;
@property (weak, nonatomic) IBOutlet UIView *itemsBg;

@property (nonatomic, strong) NSTimer *runTimer;
@property (nonatomic, assign) NSInteger timerCount;

@property(nonatomic, copy)SmartDetective_ReadyGoBlock items;
@property (nonatomic, assign) NSInteger level;
@property(nonatomic, strong)NSMutableArray *itemsArr;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weightLayout;
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;


@end

@implementation SmartDetective_ReadyViewController

- (instancetype)initWithLevel:(NSInteger)level rightAnswer:(__autoreleasing SmartDetective_ReadyGoBlock)items{
    if(self = [super init]){
        self.level = level;
        self.items = items;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    self.timerCount = 3;
    self.countDown.text = [NSString stringWithFormat:@"%ld",self.timerCount];
    
    [self random];
    self.runTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.runTimer forMode:NSDefaultRunLoopMode];

    self.itemsBg.layer.cornerRadius = 6;
    self.itemsBg.layer.masksToBounds = YES;
    
    if kiPhone5 {
        self.heightLayout.constant = 20;
        self.weightLayout.constant = 250;
        self.tittleLabel.font = [UIFont fontWithName:FontName size:20];
    }
}

- (void)timerRun{
    if(self.timerCount == 0){
        if(self.runTimer != nil){
            [self.runTimer invalidate];
            self.runTimer = nil;
        }
        self.timerCount = 3;
        [self dismissViewControllerAnimated:YES completion:nil];
        if(self.items){
            self.items(self.itemsArr);
        }
    }else{
        self.timerCount --;
        self.countDown.text = [NSString stringWithFormat:@"%ld",self.timerCount];
        [UIView animateWithDuration:0.5 animations:^{
            self.countDown.transform = CGAffineTransformMakeScale(2, 2);
        } completion:^(BOOL finished) {
              self.countDown.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)random{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 1; i<10; i++) {
        NSString *string = [NSString stringWithFormat:@"%d",i];
        [arr addObject:string];
    }
    self.itemsArr = [NSObject SmartDetective_getNewArrWithOldArr:arr count:self.level + 2];
    [self setUpUi];
}

- (void)setUpUi{
    
    CGFloat W = 59;
    CGFloat H = 62;
       
    if kiPhone5 {
       W = 49;
       H = 52;
    }
    
    CGFloat left = ((KWidth - 48) - (self.level + 2)*W)/2;
    CGFloat top = 45;
   
    for (int i = 0; i<self.level + 2; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(left + i*W, top, W, H);
        imageView.image = [UIImage imageNamed:self.itemsArr[i]];
        [self.itemsBg addSubview:imageView];
    }
}

- (NSMutableArray *)itemsArr{
    if(_itemsArr == nil){
        _itemsArr = [[NSMutableArray alloc]init];
    }
    return _itemsArr;
}

@end

