//
//  GPSRcordPage.m
//  GuessParkingSpace
//
//  Created by luzhaoyang on 2020/4/9.
//  Copyright © 2020 xiangjia. All rights reserved.
//

#import "GPSRcordPage.h"


@interface GPSRcordPage ()

@property (weak, nonatomic) IBOutlet UILabel *Sone;
@property (weak, nonatomic) IBOutlet UILabel *Stwo;
@property (weak, nonatomic) IBOutlet UILabel *SThree;

@property (weak, nonatomic) IBOutlet UILabel *Gone;
@property (weak, nonatomic) IBOutlet UILabel *Gtwo;
@property (weak, nonatomic) IBOutlet UILabel *Gthree;

@property (weak, nonatomic) IBOutlet UILabel *Done;
@property (weak, nonatomic) IBOutlet UILabel *Dtwo;
@property (weak, nonatomic) IBOutlet UILabel *Dthree;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *with;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *w;

@end

@implementation GPSRcordPage

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue];
    
    if kiPhone5 {
        self.w.constant = 400;
        self.with.constant = 280;
    }
}


- (void)setValue{
    
    NSArray *countArr = [NSString GPSgetRankingKey:@"simple"];
    
    if(countArr.count >= 3){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        NSNumber *number3 = countArr[2];
        self.Sone.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Stwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.SThree.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(countArr.count == 2){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        self.Sone.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Stwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.SThree.text = @"0";
    }else if(countArr.count == 1){
        NSNumber *number1 = countArr[0];
        self.Sone.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Stwo.text = @"0";
        self.SThree.text = @"0";
    }else{
        self.Sone.text = @"0";
        self.Stwo.text = @"0";
        self.SThree.text = @"0";
    }
    
    NSArray *guessArr = [NSString GPSgetRankingKey:@"general"];
    if(guessArr.count >= 3){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        NSNumber *number3 = guessArr[2];
        self.Sone.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Stwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.SThree.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(guessArr.count == 2){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        self.Sone.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Stwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.SThree.text = @"0";
        
    }else if(guessArr.count == 1){
        
        NSNumber *number1 = guessArr[0];
        self.Sone.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Stwo.text = @"0";
        self.SThree.text = @"0";
        
    }else{
        
        self.Sone.text = @"0";
        self.Stwo.text = @"0";
        self.SThree.text = @"0";
    }
    
    NSArray *guessArr1 = [NSString GPSgetRankingKey:@"difficult"];
    if(guessArr1.count >= 3){
        
        NSNumber *number1 = guessArr1[0];
        NSNumber *number2 = guessArr1[1];
        NSNumber *number3 = guessArr1[2];
        self.Done.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Dtwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.Dthree.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(guessArr1.count == 2){
        
        NSNumber *number1 = guessArr1[0];
        NSNumber *number2 = guessArr1[1];
        self.Done.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Dtwo.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.Dthree.text = @"0";
        
    }else if(guessArr1.count == 1){
        
        NSNumber *number1 = guessArr1[0];
        self.Done.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.Dtwo.text = @"0";
        self.Dthree.text = @"0";
        
    }else{
    
        self.Done.text = @"0";
        self.Dtwo.text = @"0";
        self.Dthree.text = @"0";
    }
}

@end
