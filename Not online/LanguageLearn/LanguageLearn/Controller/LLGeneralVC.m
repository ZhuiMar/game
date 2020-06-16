//
//  LLGeneralVC.m
//  LanguageLearn
//
//  Created by  luzhaoyang on 2020/3/19.
//  Copyright © 2020 haike. All rights reserved.
//

#import "LLGeneralVC.h"

@interface LLGeneralVC ()<AVSpeechSynthesizerDelegate,LLOverVCDelegate>

@property (nonatomic,strong) NSMutableArray *datas;
@property(nonatomic,strong) AVSpeechSynthesizer *synthesizer;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,assign) NSInteger count;
@property(nonatomic,assign) NSInteger right;
@property(nonatomic,assign) NSInteger score;
@property(nonatomic,assign) NSInteger qustionCount;

@end

@implementation LLGeneralVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"General";
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSMutableArray *)datas{
    if(_datas == nil){
       _datas = [[NSMutableArray alloc]initWithArray:@[@"アップル",
       @"アボカド",
       @"バナナ",
       @"チェリー",
       @"グレープ",
       @"レモン",
       @"オレンジ",
       @"ピーチ",
       @"梨",
       @"ザクロ",
       @"いちご",
       @"スイカ",
       @"アンテロープ",
       @"バード",
       @"チーター",
       @"キリン",
       @"ハリネズミ",
       @"カバ類",
       @"ジャッカル",
       @"トカゲ",
       @"サイ",
       @"蛇",
       @"タイガー",
       @"トルコ"]];
    }
    return _datas;
}


@end
