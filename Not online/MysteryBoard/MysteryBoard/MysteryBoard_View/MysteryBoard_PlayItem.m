//
//  MysteryBoard_PlayItem.m
//  MysteryBoard
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 wansheng. All rights reserved.
//

#import "MysteryBoard_PlayItem.h"

@interface MysteryBoard_PlayItem()<AVSpeechSynthesizerDelegate>

@property(nonatomic,copy)NSString *tittle;

@property(nonatomic,strong) AVSpeechSynthesizer *synthesizer;

@end

@implementation MysteryBoard_PlayItem

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderWidth = 4;
    self.layer.borderColor = [NSObject MysteryBoard_colorWithHexString:@"#47290A"].CGColor;
    
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];
    self.synthesizer.delegate = self;
}

- (void)setData:(NSString *)string type:(NSInteger)type{
    if(type == 1){
        if([string isEqualToString:@"red"]){
            self.imageView.backgroundColor = [UIColor redColor];
        }else if([string isEqualToString:@"white"]){
            self.imageView.backgroundColor = [UIColor whiteColor];
        }else if([string isEqualToString:@"yellow"]){
            self.imageView.backgroundColor = [UIColor yellowColor];
        }else if([string isEqualToString:@"green"]){
            self.imageView.backgroundColor = [UIColor greenColor];
        }else if([string isEqualToString:@"blue"]){
            self.imageView.backgroundColor = [UIColor blueColor];
        }else if([string isEqualToString:@"purple"]){
            self.imageView.backgroundColor = [UIColor purpleColor];
        }else if([string isEqualToString:@"cyan"]){
            self.imageView.backgroundColor = [UIColor cyanColor];
        }else if([string isEqualToString:@"gray"]){
            self.imageView.backgroundColor = [UIColor grayColor];
        }
        self.namelabel.text = string;
    }else{
        self.imageView.image = [UIImage imageNamed:string];
        self.namelabel.text = string;
    }
    self.tittle = string;
}

- (void)ovice{
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:self.namelabel.text];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    utterance.rate = 0.5f;
    utterance.volume = 1.0f;
    [self.synthesizer speakUtterance:utterance];
}

- (IBAction)playAction:(id)sender {
    [self ovice];
}

@end
