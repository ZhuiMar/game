//
//  SAPlayVC.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/8.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SAPlayVC.h"

@interface SAPlayVC ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *sliderBg;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@property (weak, nonatomic) IBOutlet UIView *xinBg;
@property (weak, nonatomic) IBOutlet UIView *zanBg;

@property (weak, nonatomic) IBOutlet UIImageView *xinIcon;
@property (weak, nonatomic) IBOutlet UIImageView *zanIocn;

@property (weak, nonatomic) IBOutlet UILabel *xinTitle;
@property (weak, nonatomic) IBOutlet UILabel *zanTitle;

@property (nonatomic, copy) NSString *name;

@property (nonatomic,strong) AVAudioPlayer *player;
@property (nonatomic,strong) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UISlider *sliderView;

@end

@implementation SAPlayVC

- (instancetype)initWithType:(NSString *)name{
    if(self = [super init]){
        self.name = name;
    }
    return self;
}

- (IBAction)startBtn:(id)sender {
    
    RLMResults *results2 = [SAAnimalDataModel objectsWhere:@"name == %@ AND type BEGINSWITH %@",self.name,@"SA_collection"];
    SAAnimalDataModel *model2 = results2.firstObject;
    
    if(model2 == nil){
        RLMResults *results = [SAAnimalDataModel objectsWhere:@"name == %@",self.name];
        SAAnimalDataModel *model = results.firstObject;
        NSString *coll = model.collection;
        NSInteger collIn = [coll integerValue];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            model.collection = [NSString stringWithFormat:@"%ld",collIn + 1];
        }];
        self.xinTitle.text = model.collection;
        
        SAAnimalDataModel *animal = [[SAAnimalDataModel alloc]init];
        animal.type = @"SA_collection";
        animal.name = self.name;
        animal.collection = model.collection;
        animal.praise = model.praise;
        
        RLMRealm *realm2 = [RLMRealm defaultRealm];
        [realm2 transactionWithBlock:^{
            [realm2 addObject:animal];
        }];
    }
}


- (IBAction)zanBtn:(id)sender {
    RLMResults *results = [SAAnimalDataModel objectsWhere:@"name == %@",self.name];
    SAAnimalDataModel *model = results.firstObject;
    
    NSString *pra = model.praise;
    NSInteger praIn = [pra integerValue];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        model.praise = [NSString stringWithFormat:@"%ld",praIn + 1];
    }];
    self.zanTitle.text = model.praise;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUi];

    RLMResults *results = [SAAnimalDataModel objectsWhere:@"name == %@",self.name];
    SAAnimalDataModel *model = results.firstObject;
    
    if(model == nil){
        NSInteger co = [NSObject getRandomNumber:10 to:20];
        NSInteger pra = [NSObject getRandomNumber:10 to:20];
        
        SAAnimalDataModel *animal = [[SAAnimalDataModel alloc]init];
        animal.type = @"SA_play";
        animal.name = self.name;
        animal.collection = [NSString stringWithFormat:@"%ld",co];
        animal.praise = [NSString stringWithFormat:@"%ld",pra];
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:animal];
        }];
        
        RLMResults *results = [SAAnimalDataModel objectsWhere:@"name == %@",self.name];
        SAAnimalDataModel *model = results.firstObject;
        
        self.xinTitle.text = model.collection;
        self.zanTitle.text = model.praise;
    }

    else{
        self.xinTitle.text = model.collection;
        self.zanTitle.text = model.praise;
    }
    
    self.sliderView.tintColor = [NSObject colorWithHexString:@"#01FDD9"];
    self.sliderView.minimumValue = 0;
    self.sliderView.maximumValue = 1;
    self.sliderView.value = 0;
    self.sliderView.enabled = NO;
    self.sliderView.transform = CGAffineTransformMakeScale(0.5, 0.5);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)timerRun{
    CGFloat pross = self.player.currentTime/self.player.duration;
    if(pross > 0.9){
        [self.timer invalidate];
        self.timer = nil;
        self.sliderView.value = 1;
    }else{
        self.sliderView.value = pross;
    }
}

- (void)setUi{
    self.titleLabel.text = self.name;
    self.imageView.image = [UIImage imageNamed:self.name];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.xinBg.layer.cornerRadius = 6;
    self.xinBg.layer.masksToBounds = YES;
    self.zanBg.layer.cornerRadius = 6;
    self.zanBg.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 16;
    self.bgView.layer.masksToBounds = YES;
}

- (IBAction)playAction:(id)sender {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@.mp3",self.name] withExtension:nil];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.player.volume = 0.8;
    [self.player play];
    
    self.timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

@end
