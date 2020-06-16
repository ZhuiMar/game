//
//  HWGTypingVC.m
//  HandWrittenGothic
//
//  Created by  luzhaoyang on 2020/3/18.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "HWGTypingVC.h"

@interface HWGTypingVC ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet XTPasterStageView *bg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *H;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *W;

@end

@implementation HWGTypingVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImageView *imaheView = [[UIImageView alloc]init];
    imaheView.frame = CGRectMake(0, 0, 100, 20);
    imaheView.image = [UIImage imageNamed:@"6_tittle"];
    self.navigationItem.titleView = imaheView;

    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.font = [UIFont fontWithName:FontName size:30];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.textView becomeFirstResponder];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if kiPhone5 {
        self.W.constant = 300;
    }
    self.bg.backgroundColor = [UIColor redColor];
}

- (IBAction)refreshAction:(id)sender {
    [self.view endEditing:YES];
    self.textView.text = @"";
}
- (IBAction)saveAction:(id)sender {
    [self.view endEditing:YES];
    self.bg.backgroundColor = [UIColor whiteColor];
    [self loginInvite];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)loginInvite{

    UIImage *image = [self.bg doneEdit];
    NSString *path_sandox = NSHomeDirectory();
    NSString *newPath = [path_sandox stringByAppendingPathComponent:@"/Documents/pic.plist"];
    NSArray *data1 = [NSArray arrayWithContentsOfFile:newPath];
    NSMutableArray *arr = [[NSMutableArray alloc] init];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Save success" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.textView.text = @"";
    }];
    [alert addAction:action2];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
    
    if (data1 == nil || data1.count == 0){
        NSData *data = UIImageJPEGRepresentation(image, 1.0f);
        NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [arr addObject:strimage64];
        if ([arr writeToFile:newPath atomically:YES]) {
             NSLog(@"Save to successful");
             self.textView.text = @"";
             self.bg.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
            self.bgView.layer.cornerRadius = 8;
            self.bgView.layer.masksToBounds = YES;
            self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        };
    }else{
        NSMutableArray *copyarr = [data1 mutableCopy];
        NSData *data = UIImageJPEGRepresentation(image, 1.0f);
        NSString *strimage64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [copyarr addObject:strimage64];
        if ([copyarr writeToFile:newPath atomically:YES]) {
            NSLog(@"Write failed");
            self.bg.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
            self.bgView.layer.cornerRadius = 8;
            self.bgView.layer.masksToBounds = YES;
            self.bgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        };
    }
}

@end
