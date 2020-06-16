//
//  MWAddVC.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWAddVC.h"

@interface MWAddVC ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *brandTf;
@property (weak, nonatomic) IBOutlet UITextField *sizeTf;
@property (weak, nonatomic) IBOutlet UITextField *priceTf;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;
@property (weak, nonatomic) IBOutlet UIButton *closedBtn;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *imageData;
@property (nonatomic, copy) NSString *type;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *withLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLay;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cloedTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *saveTop;

@end

@implementation MWAddVC

- (instancetype)initWithType:(NSString *)title{
    if(self = [super init]){
        self.type = title;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    self.saveBtn.layer.cornerRadius = 6;
    self.saveBtn.layer.masksToBounds = YES;
    self.clickBtn.layer.cornerRadius = 6;
    self.clickBtn.layer.masksToBounds = YES;
    if kiPhone5 {
        self.bgView.layer.cornerRadius = 0;
        self.bgView.layer.masksToBounds = YES;
        self.topLay.constant = 64;
        self.cloedTop.constant = 64;
        self.nameTop.constant = 10;
        self.saveTop.constant = 15;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.enabled = NO;
    self.saveBtn.backgroundColor = [UIColor colorWithHexString:@"#BFBFBF"];
    [self.saveBtn setTitleColor:[UIColor colorWithHexString:@"#F5F5F5"] forState:UIControlStateNormal];
    self.nameTf.delegate = self;
    self.brandTf.delegate = self;
    self.sizeTf.delegate = self;
    self.priceTf.delegate = self;
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    if kiPhone5 {
        self.withLayout.constant = Iphone_Width;
        self.hightLayout.constant = Iphone_Height;
    }
}

- (void)keyboardWillHide:(NSNotification *)info{
    if([self.nameTf.text isEqualToString:@""] ||
          [self.brandTf.text isEqualToString:@""] ||
          [self.sizeTf.text isEqualToString:@""] ||
          [self.priceTf.text isEqualToString:@""] ||
          self.imageData == nil){
          self.saveBtn.enabled = NO;
          self.saveBtn.backgroundColor = [UIColor colorWithHexString:@"#BFBFBF"];
          [self.saveBtn setTitleColor:[UIColor colorWithHexString:@"#F5F5F5"] forState:UIControlStateNormal];
    }else{
        self.saveBtn.enabled = YES;
        self.saveBtn.backgroundColor = [UIColor colorWithHexString:@"#C03329"];
        [self.saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

- (IBAction)closedAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clcikPhoto:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)saveAction:(id)sender {
    if([self.nameTf.text isEqualToString:@""] ||
       [self.brandTf.text isEqualToString:@""] ||
       [self.sizeTf.text isEqualToString:@""] ||
       [self.priceTf.text isEqualToString:@""] ||
       self.imageData == nil){
        return;
    }

    else{
    
        MWClothes *clothsModel = [[MWClothes alloc]init];
        clothsModel.type = self.type;
        clothsModel.name = self.nameTf.text;
        clothsModel.brand = self.brandTf.text;
        clothsModel.size = self.sizeTf.text;
        clothsModel.price = self.priceTf.text;
        clothsModel.imageName = [NSString randomStringWithLength:5];
        clothsModel.isSelect = @"0";
        
        [NSString saveStringWithFileName:clothsModel.imageName strContent:self.imageData];

        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:clothsModel];
        }];
        
        RLMResults *results = [MWClothes allObjects];
        if(results){
            [self dismissViewControllerAnimated:YES completion:nil];
            if(self.saveBlock){
                self.saveBlock();
            }
        }
    }
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.image = image;
    [self.clickBtn setBackgroundImage:image forState:UIControlStateNormal];
    self.imageData = [UIImage encodeToBase64String:self.image];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)closedBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
