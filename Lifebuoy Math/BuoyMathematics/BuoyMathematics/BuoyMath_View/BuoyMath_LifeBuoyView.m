//
//  BuoyMath_LifeBuoyView.m
//  BuoyMathematics
//
//  Created by zy on 2020/4/26.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "BuoyMath_LifeBuoyView.h"

@implementation BuoyMath_LifeBuoyView

+ (instancetype)getBouyViewWithLevel:(NSInteger)level{
    BuoyMath_LifeBuoyView *view = [[NSBundle mainBundle] loadNibNamed:@"BuoyMath_LifeBuoyView" owner:self options:nil].firstObject;
    [view setUIWith:view];
    if(level == 1){
        view.isCanClick = NO;
    }else{
        view.isCanClick = YES;
    }
    return view;
}

- (void)setUIWith:(BuoyMath_LifeBuoyView *)view{
    [self.bouyOne setHidden:YES];
    [self.bouyTwo setHidden:YES];
    [self.bouyThree setHidden:YES];
    [self.buoyFour setHidden:YES];
    [self.buoyFive setHidden:YES];
}

- (NSInteger)setBouyCount{
    self.value = [NSObject BuoyMath_getRandomNumber:1 to:5];
    [self setUIWithCount:self.value];
    return self.value;
}

- (IBAction)clcikBtn:(id)sender {
    if(self.isCanClick == YES){
        if(self.value - 1> 0){
            self.value = self.value - 1;
            [self setUIWithCount:self.value];
            if([self.delegate respondsToSelector:@selector(clickItemAction)]){
                [self.delegate clickItemAction];
            }
        }
    }
}

- (void)setUIWithCount:(NSInteger)count{
    
    if(count == 1){
        
        [self.bouyOne setHidden:NO];
        [self.bouyTwo setHidden:YES];
        [self.bouyThree setHidden:YES];
        [self.buoyFour setHidden:YES];
        [self.buoyFive setHidden:YES];
        
    }else if (count == 2){
        
        [self.bouyOne setHidden:NO];
        [self.bouyTwo setHidden:NO];
        [self.bouyThree setHidden:YES];
        [self.buoyFour setHidden:YES];
        [self.buoyFive setHidden:YES];
        
    }else if (count == 3){
        
        [self.bouyOne setHidden:NO];
        [self.bouyTwo setHidden:NO];
        [self.bouyThree setHidden:NO];
        [self.buoyFour setHidden:YES];
        [self.buoyFive setHidden:YES];
        
    }else if (count == 4){
        
        [self.bouyOne setHidden:NO];
        [self.bouyTwo setHidden:NO];
        [self.bouyThree setHidden:NO];
        [self.buoyFour setHidden:NO];
        [self.buoyFive setHidden:YES];
        
    }else if (count == 5){
        
        [self.bouyOne setHidden:NO];
        [self.bouyTwo setHidden:NO];
        [self.bouyThree setHidden:NO];
        [self.buoyFour setHidden:NO];
        [self.buoyFive setHidden:NO];
    }
}

@end
