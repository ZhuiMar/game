
#import "SACEasyVC.h"


@interface SACEasyVC ()<YTSliderViewDelegate,SACOverVCDelegate>
{
    NSInteger floatWeight;
    NSInteger floatHight;
    NSTimer *fireZidanTimer;
    NSTimer *findZidanTimer;
    NSTimer *timer;
    NSInteger fen;
}

@property(nonatomic,strong) SACProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIView *prossBg;
@property (weak, nonatomic) IBOutlet UILabel *porssV;
@property (weak, nonatomic) IBOutlet UIView *sliderBg;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;

@property (nonatomic ,strong) UIImageView *myPlane;
@property (nonatomic ,strong) NSMutableArray *diJiArray;
@property (nonatomic ,strong) NSMutableArray *ziDanArray;

@property (nonatomic ,strong) UIImageView *danDanImage;

@property (weak, nonatomic) IBOutlet UILabel *denfen;

@property (nonatomic ,copy) NSString *level;
@property (nonatomic ,assign) CGFloat blood;

@property (weak, nonatomic) IBOutlet UIButton *jingoaBtn;
@property (weak, nonatomic) IBOutlet UIButton *upBtn;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;

@property (nonatomic ,strong) NSTimer *fansheDaodanTimer;
@property (nonatomic ,strong) NSTimer *movedaoDanTimer;
@property (nonatomic ,strong) NSTimer *findDaoDanTimer;
@property (weak, nonatomic) IBOutlet UIButton *fireBtn;

@end


@implementation SACEasyVC


- (instancetype)initWithLevel:(NSString *)level{
    self = [super init];
    if(self){
        self.level = level;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    [self setBgScroller];
    [self setProssViwe];
    [self setSliderViwe];
    
    [self.view addSubview:self.myPlane];
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(findDiJi) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(downDiJi) userInfo:nil repeats:YES];
    
    [self.jingoaBtn setHidden:YES];
    if([self.level isEqualToString:@"hard"]){
        [self.view addSubview:self.danDanImage];
        self.fansheDaodanTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(fanDaodan) userInfo:nil repeats:YES];
    }

    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(baoZha) userInfo:nil repeats:YES];
    
    self->fen = 0;
    self.denfen.text = [NSString stringWithFormat:@"%ld",self->fen];
    self.denfen.font = [UIFont fontWithName:FontName size:30];
    
    self.blood = 1.0;
    self.progressView.progress = self.blood;
    
    if([self.level isEqualToString:@"easy"]){
        [self.jingoaBtn setHidden:YES];
        [self.upBtn setHidden:YES];
        [self.downBtn setHidden:YES];
    }
    SACNavigateVC *navigate = (SACNavigateVC *)self.navigationController;
    navigate.backBlock = ^{
        [self cancelTimer];
    };
}

- (void)fanDaodan{
    [self.jingoaBtn setHidden:NO];
    self.movedaoDanTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(MovedaoDan:) userInfo:nil repeats:YES];
    self.findDaoDanTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(findDaoDan:) userInfo:nil repeats:YES];
}

- (void)MovedaoDan:(NSTimer *)timer{
    CGRect rect = self.danDanImage.frame;
    rect.origin.x = rect.origin.x - 5;
    self.danDanImage.frame = rect;
}

- (void)findDaoDan:(NSTimer *)timer{
 
    CGRect rect = self.danDanImage.frame;
    if (CGRectIntersectsRect(self.danDanImage.frame, self.myPlane.frame)) {
        self.danDanImage.frame = CGRectMake(Iphone_Width, self.myPlane.frame.origin.y + 37.5, 52, 30);
        if(self.movedaoDanTimer != nil){
            [self.movedaoDanTimer invalidate];
            self.movedaoDanTimer = nil;
        }
        if(self.findDaoDanTimer != nil){
            [self.findDaoDanTimer invalidate];
            self.findDaoDanTimer = nil;
        }
        self.blood = self.blood - 0.5;
        if(self.blood < 0){
            self.blood = 0.0;
        }
        [UIView animateWithDuration:0.4 animations:^{
            self.progressView.progress = self.blood;
        }];
        if(self.blood == 0.0){
            SACOverVC *overVc = [[SACOverVC alloc]initWithScore:fen];
            overVc.delegate = self;
            [self yc_bottomPresentController:overVc presentedHeight:Iphone_Height completeHandle:nil];
            [NSString saveScore:fen key:[NSString stringWithFormat:@"%@_SAC",self.level]];
            [self cancelTimer];
            return;
        }
        [self.jingoaBtn setHidden:YES];
    }
    if (rect.origin.x < -30){
        [self.jingoaBtn setHidden:YES];
        self.danDanImage.frame = CGRectMake(Iphone_Width, self.myPlane.frame.origin.y, 52,30);
        if(self.movedaoDanTimer != nil){
            [self.movedaoDanTimer invalidate];
            self.movedaoDanTimer = nil;
        }
        if(self.findDaoDanTimer != nil){
            [self.findDaoDanTimer invalidate];
            self.findDaoDanTimer = nil;
        }
    }
}

- (IBAction)upBtnAction:(id)sender {
    [UIView animateWithDuration:0.4 animations:^{
        if([self.level isEqualToString:@"hard"]){
            self.myPlane.frame = CGRectMake(150, 0, 107, 75);
        }else{
            self.myPlane.frame = CGRectMake(100, 0, 107, 75);
        }
    }];
}
- (IBAction)downBtnAction:(id)sender {
    [UIView animateWithDuration:0.4 animations:^{
        if([self.level isEqualToString:@"hard"]){
             self.myPlane.frame = CGRectMake(150, Iphone_Height-75, 107, 75);
        }else{
            self.myPlane.frame = CGRectMake(100, Iphone_Height-75, 107, 75);
        }
    }];
}

- (void)againAction{
    [self.navigationController popToRootViewControllerAnimated:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"goToGame" object:self.level];
}
- (void)homeAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)baoZha{

    for (UIImageView *diJi in self.diJiArray){
        
        if (diJi.tag == 1){
            if (CGRectIntersectsRect(diJi.frame, self.myPlane.frame)) {
                for (UIImageView *ziDan in self.ziDanArray) {
                    ziDan.hidden = YES;
                    ziDan.frame = CGRectMake(0, -27, 27, 14);
                }
                diJi.hidden = YES;
                diJi.frame = CGRectMake(0, -25, 35, 25);
                self.blood = self.blood - 0.05;
                if(self.blood < 0.0){
                    self.blood = 0.0;
                }
                [UIView animateWithDuration:0.7 animations:^{
                    self.progressView.progress = self.blood;
                }];
                if(self.blood == 0.0){
                    self.myPlane.hidden = YES;
                    SACOverVC *overVc = [[SACOverVC alloc]initWithScore:fen];
                    overVc.delegate = self;
                    [self yc_bottomPresentController:overVc presentedHeight:Iphone_Height completeHandle:nil];
                    [NSString saveScore:fen key:[NSString stringWithFormat:@"%@_SAC",self.level]];
                    [timer setFireDate:[NSDate distantFuture]];
                    [findZidanTimer setFireDate:[NSDate distantFuture]];
                    [fireZidanTimer setFireDate:[NSDate distantFuture]];
                    return;
                }
            }
            
            for (UIImageView *ziDan in self.ziDanArray){
                if (ziDan.tag == 1){
                    if (CGRectIntersectsRect(ziDan.frame, diJi.frame)){
                        fen+=10;
                        ziDan.tag = 0;
                        ziDan.hidden = YES;
                        ziDan.frame = CGRectMake(0, -14, 7, 14);
                        diJi.tag = 0;
                        diJi.frame = CGRectMake(0, -25, 35, 25);
                        self.denfen.text = [NSString stringWithFormat:@"%ld",fen];
                    }
                }
            }
        }
    }
}


- (void)findDiJi{
    for (UIImageView *diji in self.diJiArray){
        if (diji.tag == 0){
            diji.tag = 1;
            floatWeight = Iphone_Height - 35;
            floatHight = Iphone_Width - 35;
            int y = arc4random()%floatWeight;
            int x = arc4random()%floatHight;
            diji.frame = CGRectMake(Iphone_Width+x, y, 35, 25);
            break;
        }
    }
}

- (void)downDiJi{
    for (UIImageView *diji in self.diJiArray){
        if (diji.tag == 1){
            CGRect rect = diji.frame;
               rect.origin.x = rect.origin.x - 10;
            if(fen > 1000){
               rect.origin.x = rect.origin.x - 12;
            }else if (fen > 3000){
               rect.origin.x = rect.origin.x - 15;
            }
            [UIView animateWithDuration:0.1 animations:^{
                diji.frame = rect;
            }];
            if (rect.origin.x < -35){
                diji.frame = CGRectMake(0, -25, 35, 25);
                diji.tag = 0;
            }
        }
    }
}

- (IBAction)fireAction:(id)sender {
    fireZidanTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(fireZiDan) userInfo:nil repeats:YES];
    findZidanTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(findZiDan) userInfo:nil repeats:YES];
    self.fireBtn.enabled = NO;
}

- (void)fireZiDan{
    for (UIImageView *ziDan in self.ziDanArray){
        if (ziDan.tag == 1){
            CGRect rect = ziDan.frame;
            rect.origin.x = rect.origin.x + 10;
            [UIView animateWithDuration:0.1 animations:^{
                ziDan.frame = rect;
            }];
            if (rect.origin.x > Iphone_Width) {
                ziDan.tag = 0;
                ziDan.hidden = YES;
                CGPoint point = self.myPlane.center;
                point.x = point.x + 100;
                ziDan.frame = CGRectMake(point.x, point.y, 27, 14);
            }
        }
    }
}

- (void)findZiDan{
    for (UIImageView *ziDan in self.ziDanArray){
        if (ziDan.tag == 0){
            ziDan.hidden = NO;
            ziDan.tag = 1;
            CGPoint point = self.myPlane.center;
            point.x = point.x + 100;
            ziDan.center = point;
            break;
        }
    }
}

- (void)setFont{
    self.porssV.font = [UIFont fontWithName:FontName size:40];
}

- (void)ytSliderViewSlidering:(YTSliderView *)view value:(CGFloat)value{
    CGFloat x = ((1.0-value) * Iphone_Height) - 27.5;
    [UIView animateWithDuration:0.2 animations:^{
        if([self.level isEqualToString:@"hard"]){
            self.myPlane.frame = CGRectMake(150, x, 107, 75);
        }else{
            self.myPlane.frame = CGRectMake(100, x, 107, 75);
        }
    }];
}

- (void)setBgScroller{
    NSInteger right = 100;
    if IS_IPHONE_X_orMore {
        right = 250;
    }
    WSRollView *wsRoll = [[WSRollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width + right, self.view.frame.size.height + 100)];
    wsRoll.backgroundColor = [UIColor whiteColor];
    wsRoll.timeInterval = 0.005;
    wsRoll.rollSpace = 0.3;
    wsRoll.image = [UIImage imageNamed:@"bj"];
    [wsRoll startRoll];
    [self.bgImage addSubview:wsRoll];
}

- (void)setProssViwe{
    SACProgressView *progressView = [[SACProgressView alloc] initWithFrame:CGRectMake(0, 0, 396, 20)];
    progressView.progerStokeWidth = 5.0f;
    progressView.progerssBackgroundColor = [UIColor colorWithHexString:@"#270D15"];
    progressView.progerssColor = [UIColor colorWithHexString:@"#C94D47"];
    progressView.progerssStokeBackgroundColor = [UIColor colorWithHexString:@"#FEA368"];
    [self.prossBg addSubview:progressView];
    self.progressView = progressView;
}

- (void)setSliderViwe{
    YTSliderSetting *setting_h = [YTSliderSetting verticalSetting];
    setting_h.backgroundColor = [UIColor colorWithHexString:@"#4F3B45"];
    setting_h.progressColor = [UIColor colorWithHexString:@"#F0D77F"];
    setting_h.borderWidth = 0;
    YTSliderView *slider_h = [[YTSliderView alloc]initWithFrame:CGRectMake(4, 0, 16, 147) setting:setting_h];
    slider_h.tag = 2000;
    slider_h.delegate = self;
    [self.sliderBg addSubview:slider_h];
}

- (IBAction)backBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancelTimer{
    if(fireZidanTimer != nil){
        [fireZidanTimer invalidate];
        fireZidanTimer = nil;
    }
    if(findZidanTimer != nil){
        [findZidanTimer invalidate];
        findZidanTimer = nil;
    }
    if(timer != nil){
        [timer invalidate];
        timer = nil;
    }
    if(self.fansheDaodanTimer != nil){
        [self.fansheDaodanTimer invalidate];
        self.fansheDaodanTimer = nil;
    }
}

- (UIImageView *)myPlane{
    if (!_myPlane) {
        _myPlane = [[UIImageView alloc] initWithFrame:CGRectMake(Iphone_Width-107, Iphone_Height/2-27.5, 107, 75)];
        NSString *fighter = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyFighter"];
        if(fighter == nil){
            _myPlane.image = [UIImage imageNamed:@"warcraft"];
            [[NSUserDefaults standardUserDefaults] setObject:@"warcraft" forKey:@"MyFighter"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            _myPlane.image = [UIImage imageNamed:fighter];
        }
        [UIView animateWithDuration:1 animations:^{
            if([self.level isEqualToString:@"hard"]){
                self->_myPlane.frame = CGRectMake(150, Iphone_Height/2-27.5, 107, 75);
            }else{
                self->_myPlane.frame = CGRectMake(100, Iphone_Height/2-27.5, 107, 75);
            }
        }];
    }
    return _myPlane;
}
- (NSMutableArray *)ziDanArray{
    if (!_ziDanArray) {
        _ziDanArray = [NSMutableArray arrayWithCapacity:0];
        for ( int i = 0 ; i < 20; i++){
            UIImageView *ziDanImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, -27, 27, 14)];
            ziDanImg.image = [UIImage imageNamed:@"bullet"];
            [self.view addSubview:ziDanImg];
            [_ziDanArray addObject:ziDanImg];
        }
    }
    return _ziDanArray;
}
- (NSMutableArray *)diJiArray{
    if (!_diJiArray) {
        _diJiArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 10; i++) {
            UIImageView *dijiImg = [[UIImageView alloc] initWithFrame:CGRectMake(Iphone_Width, -25, 35, 25)];
            dijiImg.image = [UIImage imageNamed:@"enemy"];
            [self.view addSubview:dijiImg];
            [_diJiArray addObject:dijiImg];
        }
    }
    return _diJiArray;
}
- (UIImageView *)danDanImage{
    if(_danDanImage == nil){
        _danDanImage = [[UIImageView alloc] initWithFrame:CGRectMake(Iphone_Width, self.myPlane.frame.origin.y + 37.5, 52,30)];
        _danDanImage.image = [UIImage imageNamed:@"guided"];
    }
    return _danDanImage;
}

@end
