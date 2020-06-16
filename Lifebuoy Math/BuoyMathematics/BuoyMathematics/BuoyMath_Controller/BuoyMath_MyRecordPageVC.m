//
//  BuoyMath_MyRecordPageVC.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_MyRecordPageVC.h"

@interface BuoyMath_MyRecordPageVC ()

@property (weak, nonatomic) IBOutlet UILabel *Lone;
@property (weak, nonatomic) IBOutlet UILabel *Ltwo;
@property (weak, nonatomic) IBOutlet UILabel *Lthree;

@property (weak, nonatomic) IBOutlet UILabel *Eone;
@property (weak, nonatomic) IBOutlet UILabel *Etwo;
@property (weak, nonatomic) IBOutlet UILabel *Ethree;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wight;

@end

@implementation BuoyMath_MyRecordPageVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"My record";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue];
    
    if kiPhone5 {
        self.height.constant = 250;
        self.wight.constant = 300;
    }
}

- (void)setValue{
    
    NSArray *leve = [NSObject BuoyMath_getRankingKey:@"BuoyMath_level"];
    
    if(leve.count >= 3){
        
        self.Lone.text = [NSString stringWithFormat:@"%ld",[leve[0] integerValue]];
        self.Ltwo.text = [NSString stringWithFormat:@"%ld",[leve[1] integerValue]];
        self.Lthree.text = [NSString stringWithFormat:@"%ld",[leve[2] integerValue]];
        
    }else if (leve.count == 2){
        
        self.Lone.text = [NSString stringWithFormat:@"%@",leve[0]];
        self.Ltwo.text = [NSString stringWithFormat:@"%@",leve[1]];
        self.Lthree.text = @"0";
        
    }else if (leve.count == 1){
        
        self.Lone.text = [NSString stringWithFormat:@"%@",leve[0]];
        self.Ltwo.text = @"0";
        self.Lthree.text = @"0";
        
    }else{
        
        self.Lone.text = @"0";
        self.Ltwo.text = @"0";
        self.Lthree.text = @"0";
    }
    
    NSArray *endless = [NSObject BuoyMath_getRankingKey:@"BuoyMath_endless"];
    
    if(endless.count >= 3){
        
        self.Eone.text = [NSString stringWithFormat:@"%@",endless[0]];
        self.Etwo.text = [NSString stringWithFormat:@"%@",endless[1]];
        self.Ethree.text = [NSString stringWithFormat:@"%@",endless[2]];
        
    }else if (endless.count == 2){
        
        self.Eone.text = [NSString stringWithFormat:@"%@",endless[0]];
        self.Etwo.text = [NSString stringWithFormat:@"%@",endless[1]];
        self.Ethree.text = @"0";
        
    }else if (endless.count == 1){
        
        self.Eone.text = [NSString stringWithFormat:@"%@",endless[0]];
        self.Etwo.text = @"0";
        self.Ethree.text = @"0";
        
    }else{
        
        self.Eone.text = @"0";
        self.Etwo.text = @"0";
        self.Ethree.text = @"0";
    }
}

@end
