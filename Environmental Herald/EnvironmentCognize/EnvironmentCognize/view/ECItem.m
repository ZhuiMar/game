//
//  ECItem.m
//  EnvironmentCognize
//
//  Created by luzhaoyang on 2020/4/7.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "ECItem.h"

#define angle2Radian(angle) ((angle) / 180.0 * M_PI)

@interface ECItem()

@end

@implementation ECItem

+ (instancetype)getImageView:(NSString *)imageName right:(NSInteger)right frame:(CGRect)frame{
    ECItem *item = [[NSBundle mainBundle] loadNibNamed:@"ECItem" owner:self options:nil].firstObject;
    item.frame = frame;
    [item.okImageView setHidden:YES];
    return item;
}

- (IBAction)clcikBtnAction:(id)sender {
    if(self.one == 1){
        [self.okImageView setHidden:NO];
        if([self.delegate respondsToSelector:@selector(rightItem)]){
            [self.delegate rightItem];
        }
        
    }else{
        
        [self douDong:self];
        [self.okImageView setHidden:YES];
        if([self.delegate respondsToSelector:@selector(wrongItem)]){
            [self.delegate wrongItem];
        }
    }
}

- (void)douDong:(UIView *)view{
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    keyAnima.values = @[@(-angle2Radian(8)), @(angle2Radian(8)), @(-angle2Radian(8))];
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 0.01;
    keyAnima.repeatCount = 30;
    [view.layer addAnimation:keyAnima forKey:nil];
}


@end

