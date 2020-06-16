//
//  NMItemView.m
//  NumberOfMemory
//
//  Created by luzhaoyang on 2020/4/11.
//  Copyright © 2020 huadu. All rights reserved.
//

#import "NMItemView.h"

@implementation NMItemView


- (void)setView{
    self.bgBtn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.bgBtn setBackgroundImage:[UIImage imageNamed:@"board"] forState:UIControlStateNormal];
    self.coverBtn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.coverBtn setBackgroundImage:[UIImage imageNamed:@"box_3"] forState:UIControlStateNormal];
    [self addSubview:self.bgBtn];
    [self addSubview:self.coverBtn];
    self.bgBtn.titleLabel.font = [UIFont fontWithName:FontName size:26];
    [self.bgBtn setTitleColor:[NSObject colorWithHexString:@"#F6741D"] forState:UIControlStateNormal];
    [self.coverBtn addTarget:self action:@selector(clickCover) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickCover{
    if(self.tag > 100){
        if([self.delegate respondsToSelector:@selector(clickRightItemWithVaule:item:)]){
            [self.delegate clickRightItemWithVaule:self.value item:self];
        }
    }else{
        if([self.delegate respondsToSelector:@selector(clickLeftItemWithVaule:item:)]){
            [self.delegate clickLeftItemWithVaule:self.value item:self];
        }
    }
}


- (void)startAnimation{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = ULLONG_MAX;
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopAnimation{
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = 0;
}

- (void)showCover{
    [self.coverBtn setHidden:NO];
}
- (void)hiddenCover{
    [self.coverBtn setHidden:YES];
}

- (UIButton *)bgBtn{
    if(_bgBtn == nil){
        _bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _bgBtn;
}
- (UIButton *)coverBtn{
    if(_coverBtn == nil){
       _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _coverBtn;
}

@end
