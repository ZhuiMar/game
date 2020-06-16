

#import "SACOverVC.h"

@interface SACOverVC ()

@property(nonatomic, copy) NSString *score;

@property (weak, nonatomic) IBOutlet UILabel *gameOver;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weight;

@end

@implementation SACOverVC

- (instancetype)initWithScore:(NSInteger)score{
    if(self = [super init]){
        self.score = [NSString stringWithFormat:@"%ld",score];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scoreLable.text = self.score;
    self.gameOver.font = [UIFont fontWithName:FontName size:50];
    self.scoreLable.font = [UIFont fontWithName:FontName size:40];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    if kiPhone5 {
        self.height.constant = 270;
        self.weight.constant = 380;
    }
}

- (IBAction)againAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate againAction];
}

- (IBAction)homeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate homeAction];
}

@end
