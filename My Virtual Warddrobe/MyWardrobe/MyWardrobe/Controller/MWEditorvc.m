//
//  MWEditorvc.m
//  MyWardrobe
//
//  Created by  luzhaoyang on 2020/3/16.
//  Copyright © 2020 honghai. All rights reserved.
//

#import "MWEditorvc.h"

@interface MWEditorvc ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *brandTf;
@property (weak, nonatomic) IBOutlet UITextField *sizeTf;
@property (weak, nonatomic) IBOutlet UITextField *priceTf;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *imageData;

@property (nonatomic,strong) MWClothes *model;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *withLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTop;

@end

@implementation MWEditorvc

- (instancetype)initWithData:(MWClothes *)model{
    if(self = [super init]){
        self.model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = 8;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor = [UIColor colorWithHexString:@"#BFBFBF"].CGColor;
    self.imageView.layer.borderWidth = 0.5;
    
    if kiPhone5 {
        self.bgView.layer.cornerRadius = 0;
        self.bgView.layer.masksToBounds = YES;
        self.withLayout.constant = Iphone_Width;
        self.heightLayout.constant = Iphone_Height;
        self.imageTop.constant = 45;
    }
    
    self.saveBtn.layer.cornerRadius = 8;
    self.saveBtn.layer.masksToBounds = YES;
    self.deleteBtn.layer.cornerRadius = 8;
    self.deleteBtn.layer.masksToBounds = YES;
    
    NSString *base64 = [NSString getStringWithFileName:self.model.imageName];
    
    if(base64 == nil){
        self.imageView.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"picture"];
        [self.imageView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(43);
            make.height.mas_equalTo(43);
            make.centerX.mas_equalTo(self.imageView.mas_centerX);
            make.centerY.mas_equalTo(self.imageView.mas_centerY);
        }];
    }else{
        self.imageView.image = [UIImage decodeBase64ToImage:base64];
        self.image = [UIImage decodeBase64ToImage:base64];
    }

    self.nameTf.text = self.model.name;
    self.brandTf.text = self.model.brand;
    self.sizeTf.text = self.model.size;
    self.priceTf.text = self.model.price;
}


- (IBAction)closedAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveAction:(id)sender {
    if([self.nameTf.text isEqualToString:@""] ||
          [self.brandTf.text isEqualToString:@""] ||
          [self.sizeTf.text isEqualToString:@""] ||
          [self.priceTf.text isEqualToString:@""] ||
          self.image == nil){
        return;
    }
    
    else{
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        RLMResults *result = [MWClothes objectsWhere:@"name == %@",self.model.name];
        MWClothes *clothsModel = result.firstObject;
        
        [realm transactionWithBlock:^{
           clothsModel.type = self.model.type;
           clothsModel.name = self.nameTf.text;
           clothsModel.brand = self.brandTf.text;
           clothsModel.size = self.sizeTf.text;
           clothsModel.price = self.priceTf.text;
           clothsModel.imageName = self.model.imageName;
           clothsModel.isSelect = @"0";
           
           if (self.imageData != nil && [self.imageData isEqualToString:@""] != YES){
               [NSString saveStringWithFileName:clothsModel.imageName strContent:self.imageData];
               
           }
        }];
        
        if([self.delegate respondsToSelector:@selector(saveAction)]){
            [self.delegate saveAction];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)phoneAction:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.image = image;
    self.imageView.image = self.image;
    self.imageData = [UIImage encodeToBase64String:self.image];
}

- (IBAction)delegateAction:(id)sender {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults *result = [MWClothes objectsWhere:@"name == %@",self.model.name];
    MWClothes *clo = result.firstObject;
    
    [realm transactionWithBlock:^{
        [realm deleteObject:clo];
    }];
    
    if([self.delegate respondsToSelector:@selector(deleteAction)]){
        [self.delegate deleteAction];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
