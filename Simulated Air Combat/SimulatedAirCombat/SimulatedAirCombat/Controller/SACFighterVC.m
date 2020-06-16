
#import "SACFighterVC.h"

@interface SACFighterVC ()

@property (weak, nonatomic) IBOutlet UIImageView *mengOne;
@property (weak, nonatomic) IBOutlet UIImageView *mengTwo;
@property (weak, nonatomic) IBOutlet UIImageView *mnegThree;

@property (weak, nonatomic) IBOutlet UIImageView *lockOne;
@property (weak, nonatomic) IBOutlet UIImageView *lockTwo;
@property (weak, nonatomic) IBOutlet UIImageView *lockThree;

@property (nonatomic, assign) BOOL isCanOne;
@property (nonatomic, assign) BOOL isCanTwo;
@property (nonatomic, assign) BOOL isCanThree;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right;

@end

@implementation SACFighterVC

- (IBAction)backBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isCanOne = YES;
    self.isCanTwo = NO;
    self.isCanThree = NO;
    [self setValue];

    if kiPhone5 {
        self.left.constant = 20;
        self.right.constant = 20;
    }
}

- (void)setValue{
    
    NSArray *arr1 = [NSString getRankingKey:@"easy_SAC"];
    NSArray *arr2 = [NSString getRankingKey:@"hard_SAC"];
    
    NSMutableArray *temp = [NSMutableArray new];
    for(NSNumber *numStr in arr1) {
        [temp addObject:numStr];
    }
    for(NSNumber *numStr in arr2) {
        [temp addObject:numStr];
    }

    NSArray *result = [temp sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj2 compare:obj1];
    }];
    
    if(result.count > 0){
        
        NSNumber *number1 = result.firstObject;

        if([number1 integerValue] >= 0 && [number1 integerValue] < 100){
            [self.mengOne setHidden:YES];
            [self.lockOne setHidden:YES];
            [self.mengTwo setHidden:NO];
            [self.lockTwo setHidden:NO];
            [self.mnegThree setHidden:NO];
            [self.lockThree setHidden:NO];
            self.isCanOne = YES;
            self.isCanTwo = NO;
            self.isCanThree = NO;
        }
        if([number1 integerValue] >= 5000 && [number1 integerValue] < 10000){
            [self.mengOne setHidden:YES];
            [self.lockOne setHidden:YES];
            [self.mengTwo setHidden:YES];
            [self.lockTwo setHidden:YES];
            [self.mnegThree setHidden:NO];
            [self.lockThree setHidden:NO];
            self.isCanOne = YES;
            self.isCanTwo = YES;
            self.isCanThree = NO;
        }
        if([number1 integerValue] >= 10000){
            [self.mengOne setHidden:YES];
            [self.lockOne setHidden:YES];
            [self.mengTwo setHidden:YES];
            [self.lockTwo setHidden:YES];
            [self.mnegThree setHidden:YES];
            [self.lockThree setHidden:YES];
            self.isCanOne = YES;
            self.isCanTwo = YES;
            self.isCanThree = YES;
        }
    }
    
    if(result.count == 0 || result == nil){
        [self.mengOne setHidden:YES];
        [self.lockOne setHidden:YES];
        [self.mengTwo setHidden:NO];
        [self.lockTwo setHidden:NO];
        [self.mnegThree setHidden:NO];
        [self.lockThree setHidden:NO];
        self.isCanOne = YES;
        self.isCanTwo = NO;
        self.isCanThree = NO;
    }
}

- (IBAction)oneAction:(id)sender {
    if(self.isCanOne == YES){
        [[NSUserDefaults standardUserDefaults] setObject:@"warcraft" forKey:@"MyFighter"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (IBAction)twoAction:(id)sender {
    if(self.isCanTwo == YES){
        [[NSUserDefaults standardUserDefaults] setObject:@"fighter" forKey:@"MyFighter"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (IBAction)threeAction:(id)sender {
    if(self.isCanThree == YES){
        [[NSUserDefaults standardUserDefaults] setObject:@"warplane" forKey:@"MyFighter"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
