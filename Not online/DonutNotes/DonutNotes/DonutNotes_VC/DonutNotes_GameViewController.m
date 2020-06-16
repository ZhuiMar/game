//
//  DonutNotes_GameViewController.m
//  DonutNotes
//
//  Created by luzhaoyang on 2020/4/18.
//  Copyright © 2020 willows. All rights reserved.
//

#import "DonutNotes_GameViewController.h"

@interface DonutNotes_GameViewController ()

@property(nonatomic, assign) NSInteger level;
@property(nonatomic, assign) NSInteger score;
@property(nonatomic, assign) NSInteger answerCount;


@property(nonatomic, assign) BOOL showTip;

@property (nonatomic,strong) AVAudioPlayer *player1;
@property (nonatomic,strong) AVAudioPlayer *player2;

@property (weak, nonatomic) IBOutlet UIImageView *imageBg;
@property (nonatomic,strong) UIImageView *fuImageView;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet UIImageView *starOne;
@property (weak, nonatomic) IBOutlet UIImageView *starTwo;
@property (weak, nonatomic) IBOutlet UIImageView *starThree;
@property (weak, nonatomic) IBOutlet UIImageView *starFour;

@property (nonatomic,strong) UIView *coverView;

@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic,strong)NSMutableArray *fuImages;
@property (nonatomic,strong)NSMutableArray *names;
@property (nonatomic,strong)NSMutableArray *stars;
@property (nonatomic,strong)NSMutableArray *beats;

@property (nonatomic,strong)NSMutableArray *itemBg;

@property (nonatomic,strong)NSMutableArray *currentFuHao;

@property (nonatomic,strong)NSString *rightName;
@property (nonatomic,strong)NSString *rightBeat;
@property (nonatomic,assign)NSNumber *rightStar;

@property (nonatomic,assign)NSInteger rightTag;

@property (nonatomic,strong) NSMutableArray *frames;
@property (nonatomic,strong)NSString *yuanBgName;
@property (nonatomic,strong)NSString *yuanFuName;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;

@end

@implementation DonutNotes_GameViewController

- (instancetype)initWithLevel:(NSInteger)level score:(NSInteger)score showTip:(BOOL)showTip{
    if(self = [super init]){
        self.level = level;
        self.score = score;
        self.showTip = showTip;
    }
    return self;
}

- (void)setScoreCount{
    self.navigationItem.title = [NSString stringWithFormat:@"%ld/8",self.score];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if kiPhone5 {
        self.topLayout.constant = 84;
    }

    self.answerCount = 0;
    
    [self setScoreCount];
    
    if(self.showTip == YES){
        [self showTips];
    }
    if(self.level == 3){
        [self.starOne setHidden:NO];
        [self.starTwo setHidden:NO];
        [self.starThree setHidden:NO];
        [self.starFour setHidden:NO];
        [self.textLabel setHidden:YES];
        
        [self.starOne addSubview:self.coverView];
        [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(27/2);
        }];
        
        [self.coverView setHidden:YES];
        
    }else{
        [self.starOne setHidden:YES];
        [self.starTwo setHidden:YES];
        [self.starThree setHidden:YES];
        [self.starFour setHidden:YES];
        [self.textLabel setHidden:NO];
    }
    
    UIView *centerView = [[UIView alloc]init];
    centerView.layer.cornerRadius = 8;
    centerView.layer.masksToBounds = YES;
    centerView.backgroundColor = [UIColor whiteColor];
    [self.imageBg addSubview:centerView];

    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(65);
        make.centerX.mas_equalTo(self.imageBg.mas_centerX);
        make.centerY.mas_equalTo(self.imageBg.mas_centerY);
    }];

    [centerView addSubview:self.fuImageView];
    [self.fuImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(centerView.mas_centerX);
        make.centerY.mas_equalTo(centerView.mas_centerY);
    }];
    
    [self setItems];
}

- (void)setStartCount:(CGFloat)count{
    
    if(count == 0.5){
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@""];
        self.starThree.image = [UIImage imageNamed:@""];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:NO];
        
    }else if (count == 1){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@""];
        self.starThree.image = [UIImage imageNamed:@""];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:YES];
        
    }else if (count == 2){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@"star"];
        self.starThree.image = [UIImage imageNamed:@""];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:YES];
        
    }else if (count == 3){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@"star"];
        self.starThree.image = [UIImage imageNamed:@"star"];
        self.starFour.image = [UIImage imageNamed:@""];
        [self.coverView setHidden:YES];
        
    }else if (count == 4){
        
        self.starOne.image = [UIImage imageNamed:@"star"];
        self.starTwo.image = [UIImage imageNamed:@"star"];
        self.starThree.image = [UIImage imageNamed:@"star"];
        self.starFour.image = [UIImage imageNamed:@"star"];
        [self.coverView setHidden:YES];
    }
}


- (void)setItems{
    
    CGFloat W = 93;
    CGFloat H = 85;
    
    if kiPhone5 {
        W = 70;
        H = 65;
    }
    
    CGFloat lT = 376 + 30;
    CGFloat lL = (Iphone_Width - W*2)/3;
    
    if kiPhone5 {
        lT = 376 + 10;
    }
    
    for(int i = 0;i < 2; i++){
        for(int j = 0;j < 2; j++){
            DonutNotes_item *item = [DonutNotes_item getItem];
            [self.items addObject:item];
            CGRect frame = CGRectMake(lL + i * (W + lL), lT + j * (H + 30), W, H);
            item.frame = frame;
            [self.view addSubview:item];
            item.backgroundColor = [UIColor clearColor];
            NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(item.frame)];
            [self.frames addObject:str];
            [self setUpPan:item];
        }
    }


    for (int h = 0;h<self.items.count; h++) {
        DonutNotes_item *item = self.items[h];
        item.tag = h;
    }
    
    if kiPhone5 {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
           for (int h = 0;h<self.frames.count;h++) {
               NSString *frameStr = self.frames[h];
               CGRect frameR = CGRectFromString(frameStr);
               frameR.origin.x += 20;
               frameR.origin.y += 70;
               NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(frameR)];
               [arr addObject:str];
           }
           for (int h = 0;h<arr.count;h++) {
               NSString *frameStr = arr[h];
               CGRect frameR = CGRectFromString(frameStr);
               DonutNotes_item *item = self.items[h];
               item.frame = frameR;
           }
    }
    
    [self randomTop];
    [self random];
}


- (void)randomTop{
    NSMutableArray *arr = [NSObject DonutNotes_randamArry:self.itemBg];
    NSInteger rev = [NSObject DonutNotes_getRandomNumber:0 to:arr.count - 1];
    [arr removeObjectAtIndex:rev];
    if(arr.count == self.items.count){
        for(int i = 0; i<self.items.count;i++){
            DonutNotes_item *items = self.items[i];
            [items setItemBg:arr[i]];
        }
    }
    NSMutableArray *fuhao = [NSObject DonutNotes_getNewArrWithOldArr:self.fuImages count:self.items.count];
    if(fuhao.count == self.items.count){
        for(int i = 0; i<fuhao.count;i++){
            DonutNotes_item *items = self.items[i];
            [items setItemFu:fuhao[i]];
        }
    }
    [self.currentFuHao removeAllObjects];
    for (NSString *string in fuhao) {
        [self.currentFuHao addObject:string];
    }
    NSInteger indexToBg = [NSObject DonutNotes_getRandomNumber:0 to:arr.count - 1];
    NSInteger indexToFu = [NSObject DonutNotes_getRandomNumber:0 to:self.currentFuHao.count - 1];
    self.imageBg.image = [UIImage imageNamed:arr[indexToBg]];
    self.fuImageView.image = [UIImage imageNamed:self.currentFuHao[indexToFu]];
}


- (void)random{
    
    NSMutableArray *arr = [NSObject DonutNotes_randamArry:self.itemBg];
    NSInteger rev = [NSObject DonutNotes_getRandomNumber:0 to:arr.count - 1];
    [arr removeObjectAtIndex:rev];
    
    if(arr.count == self.items.count){
        for(int i = 0; i<self.items.count;i++){
            DonutNotes_item *items = self.items[i];
            [items setItemBg:arr[i]];
        }
    }
    
    NSMutableArray *fuhao = [NSObject DonutNotes_getNewArrWithOldArr:self.fuImages count:self.items.count];
    if(fuhao.count == self.items.count){
        for(int i = 0; i<fuhao.count;i++){
            DonutNotes_item *items = self.items[i];
            [items setItemFu:fuhao[i]];
        }
    }
    
    [self.currentFuHao removeAllObjects];
    for (NSString *string in fuhao) {
        [self.currentFuHao addObject:string];
    }
    
    //===============================================================================================================
    if(self.level == 1){
        self.rightTag = [NSObject DonutNotes_getRandomNumber:0 to:self.currentFuHao.count - 1];
        NSString *fuName = [self.currentFuHao objectAtIndex:self.rightTag];
        
        // getName
        NSInteger index = 0;
        for (NSString *string in self.fuImages) {
            if([string isEqualToString:fuName]){
                index = [self.fuImages indexOfObject:string];
            }
        }
        
        self.rightName = self.names[index];
        self.textLabel.text = self.rightName;
        
        NSLog(@"rightName==%@",self.rightName);
        NSLog(@"rightTag==%ld",self.rightTag);
    }
    
    if (self.level == 2){
        self.rightTag = [NSObject DonutNotes_getRandomNumber:0 to:self.currentFuHao.count - 1];
        NSString *fuName = [self.currentFuHao objectAtIndex:self.rightTag];
        
        // getName
        NSInteger index = 0;
        for (NSString *string in self.fuImages) {
            if([string isEqualToString:fuName]){
                index = [self.fuImages indexOfObject:string];
            }
        }
        
        self.rightBeat = self.beats[index];
        self.textLabel.text = self.rightBeat;
        
        NSLog(@"rightBeat==%@",self.rightBeat);
        NSLog(@"rightTag==%ld",self.rightTag);
        
    }
    if (self.level == 3){
        
        self.rightTag = [NSObject DonutNotes_getRandomNumber:0 to:self.currentFuHao.count - 1];
        NSString *fuName = [self.currentFuHao objectAtIndex:self.rightTag];
               
           // getName
           NSInteger index = 0;
           for (NSString *string in self.fuImages) {
               if([string isEqualToString:fuName]){
                   index = [self.fuImages indexOfObject:string];
               }
           }
               
           self.rightStar = self.stars[index];
           
           NSLog(@"rightStar==%@",self.rightStar);
           NSLog(@"rightTag==%ld",self.rightTag);
        
          [self setStartCount:[self.rightStar floatValue]];
    }
}





- (void)setUpPan:(UIView *)view{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    
    DonutNotes_item *view = (DonutNotes_item *)pan.view;
    
    NSString *bgName = view.bgImageName;
    NSString *fuName = view.fuImageName;

    NSInteger curentTag = view.tag;
    
    CGPoint translation = [pan translationInView:self.view];
    
    if (pan.state == UIGestureRecognizerStateBegan){
        NSLog(@"curentTag==%ld",curentTag);
    }
    
    else if(pan.state == UIGestureRecognizerStateChanged){
        pan.view.center = CGPointMake(pan.view.center.x + translation.x,
                                      pan.view.center.y + translation.y);
        [pan setTranslation:CGPointZero inView:self.view];
        
        NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(self.imageBg.frame)];
        if (CGRectContainsPoint(CGRectFromString(str), pan.view.center)){
            self.imageBg.backgroundColor = [NSObject DonutNotes_colorWithHexString:@"#FFE88B"];
            self.imageBg.layer.cornerRadius = 16;
            self.imageBg.layer.masksToBounds = YES;
            return;
        }else{
            self.imageBg.backgroundColor = [UIColor clearColor];
        }
    }
    
    else if (pan.state == UIGestureRecognizerStateEnded){
        self.imageBg.backgroundColor = [UIColor clearColor];
        
        pan.view.center = CGPointMake(pan.view.center.x + translation.x,
                                      pan.view.center.y + translation.y);
        [pan setTranslation:CGPointZero inView:self.view];
        
        NSString *str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(self.imageBg.frame)];
        if (CGRectContainsPoint(CGRectFromString(str), pan.view.center)){
            if(self.rightTag == curentTag){
                // right
                [self rightMusic];
                self.imageBg.image = [UIImage imageNamed:bgName];
                self.fuImageView.image = [UIImage imageNamed:fuName];
                
                [self random];
                NSString *frameStr = self.frames[curentTag];
                CGRect frame = CGRectFromString(frameStr);
                [UIView animateWithDuration:0.2 animations:^{
                    pan.view.frame = frame;
                }];
                
                self.answerCount = self.answerCount + 1;
                [self saveWithName:bgName];
                
            }else{
                // wrong
                [self wrongMusic];
                [self random];
                NSString *frameStr = self.frames[curentTag];
                CGRect frame = CGRectFromString(frameStr);
                [UIView animateWithDuration:0.2 animations:^{
                    pan.view.frame = frame;
                }];
                self.answerCount = self.answerCount + 1;
            }
            [self gameOver];
        }else{
            NSString *frameStr = self.frames[curentTag];
            CGRect frame = CGRectFromString(frameStr);
            [UIView animateWithDuration:0.2 animations:^{
                pan.view.frame = frame;
            }];
        }
    }
}

- (void)saveWithName:(NSString *)name{
    
    NSString *levelStr = [NSString stringWithFormat:@"%ld",self.level];
    RLMResults *results = [DonutNotes_Score objectsWhere:@"DonutNotes_level == %@ AND DonutNotes_name BEGINSWITH %@",levelStr,name];
    DonutNotes_Score *model = results.firstObject;

       if(model == nil){
           DonutNotes_Score *data = [[DonutNotes_Score alloc]init];
           data.DonutNotes_level = levelStr;
           data.DonutNotes_name = name;
           data.DonutNotes_score = @"1";
           RLMRealm *realm = [RLMRealm defaultRealm];
           [realm transactionWithBlock:^{
               [realm addObject:data];
           }];
       }else{
           NSString *score = model.DonutNotes_score;
           NSInteger scoreNum = [score integerValue];
           RLMRealm *realm = [RLMRealm defaultRealm];
           [realm transactionWithBlock:^{
               model.DonutNotes_score = [NSString stringWithFormat:@"%ld",scoreNum + 1];
           }];
       }
    RLMResults *results1 = [DonutNotes_Score allObjects];
    NSLog(@"%@",results1);
}

- (void)gameOver{
    if(self.answerCount == 8 || self.answerCount > 8){
        DonutNotes_OverViewController *vc = [[DonutNotes_OverViewController alloc]initWithScore:self.score home:^{
            [self.navigationController popToRootViewControllerAnimated:YES];
        } again:^{
            [self.navigationController popViewControllerAnimated:NO];
            NSString *string = [NSString stringWithFormat:@"%ld",self.level];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gameAgain" object:string];
        }];
        [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:^(BOOL presented) {
        }];
    }
}


- (void)showTips{
    DonutNotes_TipsViewController *vc = [[DonutNotes_TipsViewController alloc]initWithOkAction:^{
        
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)rightMusic{
    self.score = self.score + 1;
    [self setScoreCount];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"DonutNotes_right.mp3" withExtension:nil];
    self.player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player1 play];
}
- (void)wrongMusic{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"DonutNotes_wrong.mp3" withExtension:nil];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player2 play];
}
- (UIView *)coverView{
    if(_coverView == nil){
        _coverView = [[UIView alloc]init];
        _coverView.backgroundColor = [NSObject DonutNotes_colorWithHexString:@"#FFF6D3"];
    }
    return _coverView;
}
- (NSMutableArray *)items{
    if(_items == nil){
        _items = [[NSMutableArray alloc]init];
    }
    return _items;
}

- (NSMutableArray *)fuImages{
    if(_fuImages == nil){
       _fuImages = [[NSMutableArray alloc]initWithArray:@[@"note",
                                                      @"note3",
                                                      @"note4",
                                                      @"note5",
                                                      @"note6",
                                                      @"note8",
                                                      @"note10",
                                                      @"note11"]];
           
    }
    return _fuImages;
}
- (NSMutableArray *)stars{
    if(_stars == nil){
        _stars = [[NSMutableArray alloc]initWithArray:@[@(0.5),@(0.5),@(3),@(4),@(1),@(1),@(4),@(2)]];
    }
    return _stars;
}
- (NSMutableArray *)beats{
    if(_beats == nil){
        _beats = [[NSMutableArray alloc]initWithArray:@[@"Half racket",@"Half racket",@"Two beat",@"Four beat",@"One beat",@"One beat",@"Four beat",@"Two brat"]];
    }
    return _beats;
}
- (NSMutableArray *)names{
    if(_names == nil){
        _names = [[NSMutableArray alloc]initWithArray:@[@"quaver",@"quaver rest",@"half note",@"Whole note",@"quarter note",@"Quarter rest",@"whole rest",@"half rest"]];
    }
    return _names;
}
- (NSMutableArray *)itemBg{
    if(_itemBg == nil){
        _itemBg = [[NSMutableArray alloc]initWithArray:@[@"donuts",@"donuts2",@"donuts3",@"donuts4",@"donuts5"]];
    }
    return _itemBg;
}
- (NSMutableArray *)currentFuHao{
    if(_currentFuHao == nil){
        _currentFuHao = [[NSMutableArray alloc]init];
    }
    return _currentFuHao;
}

- (UIImageView *)fuImageView{
    if(_fuImageView == nil){
        _fuImageView = [[UIImageView alloc]init];
    }
    return _fuImageView;
}

- (NSMutableArray *)frames{
    if(_frames == nil){
        _frames = [[NSMutableArray alloc]init];
    }
    return _frames;
}

@end
