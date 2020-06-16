//
//  SleepHelperSleepCell.m
//  SleepHelper
//
//  Created by zy on 2020/5/19.
//  Copyright © 2020 tianma. All rights reserved.
//

#import "SleepHelperSleepCell.h"

@implementation SleepHelperSleepCell

- (void)awakeFromNib {
    [super awakeFromNib];
 
}

- (void)setModel:(SleepHelper_TimeModel *)model{
    self.datelabel.text = model.time;
    self.countingV.text = [self timeFormatted:[model.countinglambs integerValue]];
    self.pokeV.text = [self timeFormatted:[model.pokebubbles integerValue]];
    self.fallingV.text = [self timeFormatted:[model.fallingstar integerValue]];
    self.sleepV.text = [self timeFormatted:[NSObject SleepHelper_getRandomNumber:600 to:3600]];;
}

- (NSString *)timeFormatted:(NSInteger)totalSeconds{
    NSInteger seconds = totalSeconds % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;
    NSInteger hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",hours, minutes, seconds];
}

@end
