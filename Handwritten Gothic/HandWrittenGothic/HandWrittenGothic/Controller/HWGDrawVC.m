//
//  HWGDrawVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGDrawVC.h"

@interface HWGDrawVC ()

@property (nonatomic,strong) SDDrawView *drawView;

@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveAction;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, assign) CGFloat lineW;

@property (strong, nonatomic) XTPasterStageView *stageView;
@property (nonatomic, strong) UILabel *textLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@end

@implementation HWGDrawVC

- (instancetype)initWith:(NSString *)title{
    if(self = [super init]){
        self.text = title;
    }
    return self;
}

- (void)dealloc{
    [self.bgView setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.bgView setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textLabel.text = self.text;

    self.lineW = 3.0f;
    self.color = @"#EC6941";
    
    [self.bgView addSubview:self.stageView];
    [self.stageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(325);
        make.height.mas_equalTo(250);
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
        make.centerY.mas_equalTo(self.bgView.mas_centerY).offset(-50);
    }];
    
    [self.stageView addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.stageView addSubview:self.drawView];
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    if kiPhone5 {
        self.H.constant = 440;
        self.W.constant = 300;
    }
}

- (IBAction)oneBiAction:(id)sender {
    self.lineW = 3.0f;
    [self resetColor];
}
- (IBAction)twoBiAction:(id)sender {
    self.lineW = 5.0f;
    [self resetColor];
}
- (IBAction)threeAction:(id)sender {
    self.lineW = 7.0f;
    [self resetColor];
}
- (IBAction)oneColorAction:(id)sender {
    self.color = @"#EC6941";
    [self resetColor];
}
- (IBAction)twoAction:(id)sender {
    self.color = @"#80C269";
     [self resetColor];
}
- (IBAction)threeColorAction:(id)sender {
    self.color = @"#EA68A2";
     [self resetColor];
}
- (IBAction)fourColorAction:(id)sender {
    self.color = @"#00A0E9";
     [self resetColor];
}
- (IBAction)fiveColorAction:(id)sender {
    self.color = @"#8C97CB";
    [self resetColor];
}
- (IBAction)sixColorAction:(id)sender {
    self.color = @"#2ADCE3";
    [self resetColor];
}
- (IBAction)sevenAction:(id)sender {
    self.color = @"#CFA972";
     [self resetColor];
}
- (IBAction)eightAction:(id)sender {
    self.color = @"#1B1B1B";
    [self resetColor];
}

- (void)resetColor{
     self.drawView.lineColor = [UIColor colorWithHexString:self.color];
     self.drawView.lineWidth = self.lineW;
}


- (IBAction)refreshAction:(id)sender {
     [self.drawView cleanAction];
}
- (IBAction)saveAction:(id)sender {
    [self loginInvite];
}

- (void)loginInvite{
    
    UIImage *image = [self.stageView doneEdit];
    NSString *path_sandox = NSHomeDirectory();
    NSString *newPath = [path_sandox stringByAppendingPathComponent:@"/Documents/pic.plist"];
    NSArray *data1 = [NSArray arrayWithContentsOfFile:newPath];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Save success" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.drawView cleanAction];
    }];
    [alert addAction:action2];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
    
    if (data1 == nil || data1.count == 0){
        NSData *data = UIImageJPEGRepresentation(image, 1.0f);
        NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [arr addObject:strimage64];
        if ([arr writeToFile:newPath atomically:YES]) {
             NSLog(@"Write to successful");
        };
    }else{
        NSMutableArray *copyarr = [data1 mutableCopy];
        NSData *data = UIImageJPEGRepresentation(image, 1.0f);
        NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [copyarr addObject:strimage64];
        
        if ([copyarr writeToFile:newPath atomically:YES]) {
             NSLog(@"Write failed");
        };
    }
}

- (SDDrawView *)drawView{
    if(_drawView == nil){
        _drawView = [[SDDrawView alloc] init];
        _drawView.backgroundColor = [UIColor clearColor];
        _drawView.lineWidth = self.lineW;
        _drawView.drawStyle = DrawStyleLine;
        _drawView.lineColor = [UIColor colorWithHexString:self.color];
    }
    return _drawView;
}

- (XTPasterStageView *)stageView{
    if(_stageView == nil){
       _stageView = [[XTPasterStageView alloc]init];
       _stageView.backgroundColor = [UIColor whiteColor];
    }
    return _stageView;
}

- (UILabel *)textLabel{
    if(_textLabel == nil){
        _textLabel = [[UILabel alloc]init];
        _textLabel.font = [UIFont fontWithName:FontName size:180];
        _textLabel.textColor = [UIColor colorWithHexString:@"#CCCCCC"];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

@end
