//
//  FMAddDetials.m
//  FoodManager
//
//  Created by  luzhaoyang on 2020/3/14.
//  Copyright © 2020 guanhua. All rights reserved.
//

#import "FMAddDetials.h"

@interface FMAddDetials ()<UITextFieldDelegate,FMDataSelectVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titlelebel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *shelfLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *dataTf;
@property (weak, nonatomic) IBOutlet UITextField *shelfTf;
@property (weak, nonatomic) IBOutlet UITextField *foodTf;
@property (weak, nonatomic) IBOutlet UITextField *noteTf;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *okBtn;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIView *shelfBg;
@property (weak, nonatomic) IBOutlet UIView *foodBg;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *okH;



@property (nonatomic,copy) NSString *type;

@end

@implementation FMAddDetials

- (instancetype)initWithType:(NSString *)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (kiPhone5 == NO) {
        self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        self.bgView.layer.cornerRadius = 15;
        self.bgView.layer.masksToBounds = YES;
    }

    [self setFont];
    if kiPhone5{
        self.cancelH.constant = 30;
        self.okH.constant = 30;
    }
}

- (void)setFont{
    
    if kiPhone5 {
        
        self.titlelebel.font = [UIFont fontWithName:FontName size:20];
        self.nameLabel.font = [UIFont fontWithName:FontName size:20];
        self.dataLabel.font = [UIFont fontWithName:FontName size:20];
        self.shelfLabel.font = [UIFont fontWithName:FontName size:20];
        self.typeLabel.font = [UIFont fontWithName:FontName size:20];
        self.noteLabel.font = [UIFont fontWithName:FontName size:20];
        
        self.nameTf.font = [UIFont fontWithName:FontName size:15];
        self.dataTf.font = [UIFont fontWithName:FontName size:15];
        self.shelfTf.font = [UIFont fontWithName:FontName size:15];
        self.foodTf.font = [UIFont fontWithName:FontName size:15];
        self.noteTf.font = [UIFont fontWithName:FontName size:15];
        
    }else{
        
        self.titlelebel.font = [UIFont fontWithName:FontName size:24];
        self.nameLabel.font = [UIFont fontWithName:FontName size:24];
        self.dataLabel.font = [UIFont fontWithName:FontName size:24];
        self.shelfLabel.font = [UIFont fontWithName:FontName size:24];
        self.typeLabel.font = [UIFont fontWithName:FontName size:24];
        self.noteLabel.font = [UIFont fontWithName:FontName size:24];
        
        self.nameTf.font = [UIFont fontWithName:FontName size:20];
        self.dataTf.font = [UIFont fontWithName:FontName size:20];
        self.shelfTf.font = [UIFont fontWithName:FontName size:20];
        self.foodTf.font = [UIFont fontWithName:FontName size:20];
        self.noteTf.font = [UIFont fontWithName:FontName size:20];
    }
    
    self.shelfTf.delegate = self;
    self.foodTf.delegate = self;
    self.dataTf.delegate = self;
}

- (void)suerActionWith:(NSString *)data{
    self.dataTf.text = data;
}
- (IBAction)cancelBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)okAction:(id)sender {
    
    if([self.nameTf.text isEqualToString:@""]||
       [self.dataTf.text isEqualToString:@""]||
       [self.shelfTf.text isEqualToString:@""]||
       [self.foodTf.text isEqualToString:@""]||
       [self.dataTf.text isEqualToString:@""]){
        return;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    RLMResults *results = [FMFoodClass allObjects];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    FMFood *food = [[FMFood alloc]init];
    food.name = self.nameTf.text;
    food.purchaseDate = self.dataTf.text;
    food.shelfLife = self.shelfTf.text;
    food.foodType = self.foodTf.text;
    food.note = self.noteTf.text;
    food.startTime = [NSDate getTaday];
    NSInteger days;
    if([self.shelfTf.text isEqualToString:@"1 Day"]){
        days = 1;
    }else if ([self.shelfTf.text isEqualToString:@"3 Day"]){
        days = 3;
    }else if ([self.shelfTf.text isEqualToString:@"5 Day"]){
        days = 5;
    }else {
        days = 0;
    }
    food.endTime = [NSDate beforeDate:days];

    FMFoodClass *class = [[FMFoodClass alloc]init];
    class.className = self.foodTf.text;
    [class.foods addObject:food];
    [realm transactionWithBlock:^{
        [realm addObject:class];
    }];
    // RLMResults *results = [FMFoodClass allObjects];
    NSLog(@"%@",results);
    
    [self.delegate okAction];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    NSMutableArray *days = [NSMutableArray arrayWithArray:@[@"1 Day",@"3 Day",@"5 Day",@"Other"]];
    NSMutableArray *classes;
    
    if([self.type isEqualToString:@"Home"]){
        classes = [NSMutableArray arrayWithArray:@[@"Meet",@"Vegetable",@"Milk",@"Fruit",@"Egg",@"Fish",@"Dessert",@"Other"]];
    }else{
        classes = [NSMutableArray arrayWithArray:@[self.type]];
    }
    
    if(textField == self.shelfTf){
        FMSelectVC *selectVc = [[FMSelectVC alloc] initWithTitle:@"time" days:days classes:classes selectBlock:^(NSString *string) {
            self.shelfTf.text = string;
        }];
        [self yc_bottomPresentController:selectVc presentedHeight:200 completeHandle:nil];
        return NO;
    }else if(textField == self.foodTf){
        FMSelectVC *selectVc = [[FMSelectVC alloc] initWithTitle:@"class" days:days classes:classes selectBlock:^(NSString *string) {
            self.foodTf.text = string;
        }];
        [self yc_bottomPresentController:selectVc presentedHeight:400 completeHandle:nil];
        return NO;
    } else if(textField == self.dataTf){
        FMDataSelectVC *dataSelectVC = [[FMDataSelectVC alloc]init];
        dataSelectVC.delegate = self;
        [self yc_bottomPresentController:dataSelectVC presentedHeight:244 completeHandle:nil];
        return NO;
    }else{
        return YES;
    }
}

@end
