

#import "SACRanking.h"

@interface SACRanking ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *easyLabel;
@property (weak, nonatomic) IBOutlet UILabel *hardLabel;

@property (weak, nonatomic) IBOutlet UILabel *easyOneK;
@property (weak, nonatomic) IBOutlet UILabel *easyTwoK;
@property (weak, nonatomic) IBOutlet UILabel *easyThreeK;

@property (weak, nonatomic) IBOutlet UILabel *easyOneV;
@property (weak, nonatomic) IBOutlet UILabel *easyTwoV;
@property (weak, nonatomic) IBOutlet UILabel *easyThreeV;

@property (weak, nonatomic) IBOutlet UILabel *hardOneK;
@property (weak, nonatomic) IBOutlet UILabel *hardTwoK;
@property (weak, nonatomic) IBOutlet UILabel *hardThreeK;

@property (weak, nonatomic) IBOutlet UILabel *hardOneV;
@property (weak, nonatomic) IBOutlet UILabel *hardTwoV;
@property (weak, nonatomic) IBOutlet UILabel *hardThreeV;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneWeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoWeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoheight;


@end

@implementation SACRanking

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFont];
    [self setValue];
    
    if kiPhone5 {
        self.oneHeight.constant = 190;
        self.oneWeight.constant = 250;
        self.twoheight.constant = 190;
        self.twoWeight.constant = 250;
    }
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setFont{
    
    self.titleLabel.font = [UIFont fontWithName:FontName size:40];
    
    self.easyOneK.font = [UIFont fontWithName:FontName size:23];
    self.easyTwoK.font = [UIFont fontWithName:FontName size:23];
    self.easyThreeK.font = [UIFont fontWithName:FontName size:23];
    self.easyOneV.font = [UIFont fontWithName:FontName size:23];
    self.easyTwoV.font = [UIFont fontWithName:FontName size:23];
    self.easyThreeV.font = [UIFont fontWithName:FontName size:23];
    
    self.hardOneK.font = [UIFont fontWithName:FontName size:23];
    self.hardTwoK.font = [UIFont fontWithName:FontName size:23];
    self.hardThreeK.font = [UIFont fontWithName:FontName size:23];
    self.hardOneV.font = [UIFont fontWithName:FontName size:23];
    self.hardTwoV.font = [UIFont fontWithName:FontName size:23];
    self.hardThreeV.font = [UIFont fontWithName:FontName size:23];
}


- (void)setValue{
    NSArray *countArr = [NSString getRankingKey:@"easy_SAC"];
    if(countArr.count >= 3){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        NSNumber *number3 = countArr[2];
        self.easyOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.easyTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.easyThreeV.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(countArr.count == 2){
        NSNumber *number1 = countArr[0];
        NSNumber *number2 = countArr[1];
        self.easyOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.easyTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.easyThreeV.text = @"0";
    }else if(countArr.count == 1){
        NSNumber *number1 = countArr[0];
        self.easyOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.easyTwoV.text = @"0";
        self.easyThreeV.text = @"0";
    }else{
        self.easyOneV.text = @"0";
        self.easyTwoV.text = @"0";
        self.easyThreeV.text = @"0";
    }
    
    NSArray *guessArr = [NSString getRankingKey:@"hard_SAC"];
    if(guessArr.count >= 3){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        NSNumber *number3 = guessArr[2];
        self.hardOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hardTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.hardThreeV.text = [NSString stringWithFormat:@"%ld",[number3 integerValue]];
        
    }else if(guessArr.count == 2){
        
        NSNumber *number1 = guessArr[0];
        NSNumber *number2 = guessArr[1];
        self.hardOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hardTwoV.text = [NSString stringWithFormat:@"%ld",[number2 integerValue]];
        self.hardThreeV.text = @"0";
        
    }else if(guessArr.count == 1){
        
        NSNumber *number1 = guessArr[0];
        self.hardOneV.text = [NSString stringWithFormat:@"%ld",[number1 integerValue]];
        self.hardTwoV.text = @"0";
        self.hardThreeV.text = @"0";
        
    }else{
        
        self.hardOneV.text = @"0";
        self.hardTwoV.text = @"0";
        self.hardThreeV.text = @"0";
    }
}
@end
