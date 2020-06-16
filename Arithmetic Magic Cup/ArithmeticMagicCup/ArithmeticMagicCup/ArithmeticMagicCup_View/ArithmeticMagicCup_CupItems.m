//
//  ArithmeticMagicCup_CupItems.m
//  ArithmeticMagicCup
//
//  Created by zy on 2020/4/24.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "ArithmeticMagicCup_CupItems.h"


@interface  ArithmeticMagicCup_CupItems()

@property(nonatomic, strong) NSMutableArray *colors;

@end

@implementation ArithmeticMagicCup_CupItems

+ (instancetype)getCupItemsWithLevel:(NSInteger)level{
    ArithmeticMagicCup_CupItems *item = [[NSBundle mainBundle] loadNibNamed:@"ArithmeticMagicCup_CupItems" owner:self options:nil].firstObject;
    [item setUIWith:item level:level];
    return item;
}

- (void)setUIWith:(ArithmeticMagicCup_CupItems *)item level:(NSInteger)level{
    [self.cup setHidden:NO];
    [self.rightView setHidden:YES];
    self.backgroundColor = [UIColor clearColor];
    self.ballOne.layer.cornerRadius = 15;
    self.ballOne.layer.masksToBounds = YES;
    self.ballTwo.layer.cornerRadius = 15;
    self.ballTwo.layer.masksToBounds = YES;
    self.ballThree.layer.cornerRadius = 15;
    self.ballThree.layer.masksToBounds = YES;
    self.ballFour.layer.cornerRadius = 15;
    self.ballFour.layer.masksToBounds = YES;

    self.ballOne.titleLabel.font = [UIFont fontWithName:FontName size:24];
    self.ballTwo.titleLabel.font = [UIFont fontWithName:FontName size:24];
    self.ballThree.titleLabel.font = [UIFont fontWithName:FontName size:24];
    self.ballFour.titleLabel.font = [UIFont fontWithName:FontName size:24];
    
    [self setValueWithLevel:level];
    
    NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cup_useing"];
    NSInteger numberType = [number integerValue];
    if(numberType == 1){
        self.cup.image = [UIImage imageNamed:@"1"];
    }
    if (numberType == 2){
        self.cup.image = [UIImage imageNamed:@"2"];
    }
    if (numberType == 3){
       self.cup.image = [UIImage imageNamed:@"3"];
    }    
}

- (void)setValueWithLevel:(NSInteger)level{
    
    if(level == 1){
        [self.ballFour setHidden:YES];
    }else{
        [self.ballFour setHidden:YES];
    }
    
    NSInteger one = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:3];
    self.ballOne.backgroundColor = self.colors[one];
    NSInteger two = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:3];
    self.ballTwo.backgroundColor = self.colors[two];
    NSInteger three = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:3];
    self.ballThree.backgroundColor = self.colors[three];
    
    NSInteger oneNum = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:9];
    [self.ballOne setTitle:[NSString stringWithFormat:@"%ld",oneNum] forState:UIControlStateNormal];
    NSInteger twoNum = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:9];
    [self.ballTwo setTitle:[NSString stringWithFormat:@"%ld",twoNum] forState:UIControlStateNormal];
    NSInteger threeNum = [NSObject ArithmeticMagicCup_getRandomNumber:0 to:9];
    [self.ballThree setTitle:[NSString stringWithFormat:@"%ld",threeNum] forState:UIControlStateNormal];
    self.right = oneNum + twoNum + threeNum;
}

- (NSMutableArray *)colors{
    if(_colors == nil){
        _colors = [[NSMutableArray alloc]initWithArray:@[[NSObject ArithmeticMagicCup_colorWithHexString:@"#FFAE00"],
                                                      [NSObject ArithmeticMagicCup_colorWithHexString:@"#4EAAFF"],
                                                      [NSObject ArithmeticMagicCup_colorWithHexString:@"#079485"],
                                                      [NSObject ArithmeticMagicCup_colorWithHexString:@"#F5463B"]]];
    }
    return _colors;
}

- (IBAction)clcikBtn:(id)sender {
    [self.cup setHidden:YES];
    if([self.delegate respondsToSelector:@selector(clcikItem:right:)]){
        [self.delegate clcikItem:self right:self.right];
    }
}

@end

