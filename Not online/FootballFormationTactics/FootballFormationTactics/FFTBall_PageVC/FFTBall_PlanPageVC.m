//
//  FFTBall_PlanPageVC.m
//  FootballFormationTactics
//
//  Created by zy on 2020/5/27.
//  Copyright © 2020 jingshitong. All rights reserved.
//

#import "FFTBall_PlanPageVC.h"
#import "UIColor+MBBall_color.h"
#import "FFTBall_AddPlayersVC.h"
#import "UIViewController+YCPopover.h"
#import "XTPasterStageView.h"
#import "SDDrawView.h"
#import "Masonry.h"
#import "XTPasterStageView.h"
#import "FFTBall_PlanModel.h"
#import "FFTBall_SuccessfulAlert.h"
#import "FFTBall_NavigateController.h"
#import "FFTBall_MyFormationPageVC.h"

@interface FFTBall_PlanPageVC ()

@property (nonatomic,strong) SDDrawView *drawView;
@property(nonatomic, strong) UIBarButtonItem *backBottonItem;
@property(nonatomic, strong) UIButton *backBottom;

@property(nonatomic, strong) UIBarButtonItem *saveBottonItem;
@property(nonatomic, strong) UIButton *saveBottom;

@property(nonatomic, strong) UIBarButtonItem *musicBottonItem;
@property(nonatomic, strong) UIButton *musicBottom;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayout;
@property (strong, nonatomic) XTPasterStageView *stageView;

@property (nonatomic,strong)UILabel *tittleLabel;
@property (nonatomic, copy) NSString *currentColor;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property(nonatomic, strong) UIImageView *MyBgaimageView;

@property(nonatomic, strong) NSMutableArray *ballsArray;

@end

@implementation FFTBall_PlanPageVC
 
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if IS_IPHONE_X_orMore {
        self.topLayout.constant = 88;
    }else{
        self.topLayout.constant = 64;
    }
    self.navigationItem.titleView = self.tittleLabel;
    self.navigationItem.rightBarButtonItem = self.saveBottonItem;
    self.navigationItem.leftBarButtonItem = self.backBottonItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgImageView.userInteractionEnabled = YES;
    [self.bgImageView addSubview:self.stageView];
    
    [self.stageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.stageView addSubview:self.MyBgaimageView];
    [self.MyBgaimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [self.stageView addSubview:self.drawView];
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    if(self.model){
        NSData *imageData = [[NSData alloc] initWithBase64EncodedString:self.model.image options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image = [UIImage imageWithData:imageData];
        self.MyBgaimageView.image = image;
    }
}

- (IBAction)addRedButtion:(id)sender {
    FFTBall_AddPlayersVC *vc = [[FFTBall_AddPlayersVC alloc]initWithNumberBlock:^(NSInteger number) {
        [self createBallWithType:0 number:number];
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}
- (IBAction)addBludButtion:(id)sender {
    FFTBall_AddPlayersVC *vc = [[FFTBall_AddPlayersVC alloc]initWithNumberBlock:^(NSInteger number) {
        [self createBallWithType:1 number:number];
    }];
    [self yc_bottomPresentController:vc presentedHeight:Iphone_Height completeHandle:nil];
}

- (void)createBallWithType:(NSInteger)type number:(NSInteger)number{

    UIImageView *imageView = [[UIImageView alloc]init];
    CGRect frame;
    if(type == 0){
        frame = CGRectMake(Iphone_Width/2-26, 100, 58, 42);
        imageView.image = [UIImage imageNamed:@"red_ball"];
    }else{
        frame = CGRectMake(Iphone_Width/2-26, self.bgImageView.frame.size.height - 100, 58, 42);
        imageView.image = [UIImage imageNamed:@"blue_ball"];
    }
    imageView.frame = frame;
    UILabel *numberLabel = [[UILabel alloc]init];
    numberLabel.textColor = [UIColor blackColor];
    numberLabel.font = [UIFont fontWithName:TEXTFONT size:18];
    numberLabel.textAlignment = NSTextAlignmentLeft;
    numberLabel.frame = CGRectMake(15, 12, 40, 18);
    numberLabel.text = [NSString stringWithFormat:@"%ld",number];
    [imageView addSubview:numberLabel];
    imageView.userInteractionEnabled = YES;
    [self.stageView addSubview:imageView];
    
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panView2:)];
    [imageView addGestureRecognizer:panGest];
    [self.ballsArray addObject:imageView];
}

- (void)panView2:(UIPanGestureRecognizer *)panGest{
    CGPoint trans = [panGest translationInView:panGest.view];
    NSLog(@"%@",NSStringFromCGPoint(trans));
    CGPoint center =  panGest.view.center;
    center.x += trans.x;
    center.y += trans.y;
    panGest.view.center = center;
    [panGest setTranslation:CGPointZero inView:panGest.view];
}

- (IBAction)oneColor:(id)sender {
    self.currentColor = @"#FFEF3C";
    self.drawView.lineColor = [UIColor FFTBall_colorWithHexString:self.currentColor];
}
- (IBAction)twoColor:(id)sender {
    self.currentColor = @"#F28A3D";
    self.drawView.lineColor = [UIColor FFTBall_colorWithHexString:self.currentColor];
}
- (IBAction)threeColor:(id)sender {
    self.currentColor = @"#EF82B3";
    self.drawView.lineColor = [UIColor FFTBall_colorWithHexString:self.currentColor];
}
- (IBAction)fourColor:(id)sender {
    self.currentColor = @"#9CD1DC";
    self.drawView.lineColor = [UIColor FFTBall_colorWithHexString:self.currentColor];
}

- (void)saveImageData{
    UIImage *image = [self.stageView doneEdit];
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    if(self.model){
        
        RLMResults *results = [FFTBall_PlanModel objectsWhere:@"name == %@",self.model.name];
        FFTBall_PlanModel *model = results.firstObject;
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            model.image = strimage64;
        }];
        
    }else{
        
        RLMResults *results = [FFTBall_PlanModel objectsWhere:@"name == %@",self.name];
        FFTBall_PlanModel *model = results.firstObject;
        if(model){
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                model.image = strimage64;
            }];
        }else{
            FFTBall_PlanModel *model = [[FFTBall_PlanModel alloc]init];
            model.name = self.name;
            model.date = self.date;
            model.place = self.place;
            model.image = strimage64;
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
               [realm addObject:model];
            }];
        }
    }

    FFTBall_SuccessfulAlert *controller = [[FFTBall_SuccessfulAlert alloc]initWithCancel:^{
    } newAc:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self yc_centerPresentController:controller presentedSize:CGSizeMake(300, 90) completeHandle:nil];
}

- (void)resetColor{
    self.drawView.lineColor = [UIColor FFTBall_colorWithHexString:self.currentColor];
}

- (IBAction)undoAction:(id)sender {
     [self.drawView cleanAction];
}
- (IBAction)refresh:(id)sender {
    [self.drawView cleanAction];
    for (UIImageView *imageView in self.ballsArray) {
        [imageView removeFromSuperview];
    }
    [self.ballsArray removeAllObjects];
}

- (void)backAction:(UIButton *)buttion{
    if(self.model){
        NSArray *arr = self.navigationController.viewControllers;
        for (UIViewController *controller in arr) {
            if([controller isKindOfClass:[FFTBall_MyFormationPageVC class]]){
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)saveAction:(UIButton *)buttion{
     [self saveImageData];
}

- (UILabel *)tittleLabel{
    if(_tittleLabel == nil){
        _tittleLabel = [[UILabel alloc]init];
        _tittleLabel.font = [UIFont fontWithName:TEXTFONT size:TITTLESIZE];
        _tittleLabel.textColor = [UIColor blackColor];
        _tittleLabel.text = @"Tactical board";
    }
    return _tittleLabel;
}
- (UIButton *)backBottom{
    if(_backBottom == nil){
        _backBottom = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBottom.frame = CGRectMake(0, 0, 30, 30);
        [_backBottom setImage:[UIImage imageNamed:@"back_1"] forState:UIControlStateNormal];
        [_backBottom addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBottom;
}
- (UIBarButtonItem *)backBottonItem{
    if(_backBottonItem == nil){
        _backBottonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBottom];
    }
    return _backBottonItem;
}
- (UIButton *)saveBottom{
    if(_saveBottom == nil){
        _saveBottom = [UIButton buttonWithType:UIButtonTypeCustom];
        _saveBottom.frame = CGRectMake(0, 0, 30, 30);
        [_saveBottom setImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
        [_saveBottom addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saveBottom;
}
- (UIBarButtonItem *)saveBottonItem{
    if(_saveBottonItem == nil){
        _saveBottonItem = [[UIBarButtonItem alloc]initWithCustomView:self.saveBottom];
    }
    return _saveBottonItem;
}
- (SDDrawView *)drawView{
    if(_drawView == nil){
        _drawView = [[SDDrawView alloc] init];
        _drawView.backgroundColor = [UIColor clearColor];
        _drawView.lineWidth = 2;
        _drawView.drawStyle = DrawStyleLine;
        _drawView.lineColor = [UIColor FFTBall_colorWithHexString:@"#FFEF3C"];
    }
    return _drawView;
}
- (XTPasterStageView *)stageView{
    if(_stageView == nil){
       _stageView = [[XTPasterStageView alloc]init];
       _stageView.backgroundColor = [UIColor clearColor];
    }
    return _stageView;
}
- (UIImageView *)MyBgaimageView{
    if(_MyBgaimageView == nil){
        _MyBgaimageView = [[UIImageView alloc]init];
        _MyBgaimageView.image = [UIImage imageNamed:@"background_1"];
        _MyBgaimageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _MyBgaimageView;
}
- (NSMutableArray *)ballsArray{
    if(_ballsArray == nil){
        _ballsArray = [[NSMutableArray alloc]init];
    }
    return _ballsArray;
}

@end
