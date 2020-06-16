//
//  SecretOfRain_countView.m
//  SecretOfRain
//
//  Created by zy on 2020/4/28.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SecretOfRain_countView.h"

@implementation SecretOfRain_countView

+ (instancetype)getSecretOfRain_countView{
    SecretOfRain_countView *view = [[NSBundle mainBundle] loadNibNamed:@"SecretOfRain_countView" owner:self options:nil].firstObject;
    return view;
}

- (void)setTittleCount:(NSInteger)count{
    self.countLabel.text = [NSString stringWithFormat:@"%ld",count];
}

@end
