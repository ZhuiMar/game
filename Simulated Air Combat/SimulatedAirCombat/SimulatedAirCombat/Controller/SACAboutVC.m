

#import "SACAboutVC.h"

@interface SACAboutVC ()

@property (weak, nonatomic) IBOutlet UILabel *titileLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation SACAboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self font];
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)font{
    self.titileLabel.font = [UIFont fontWithName:FontName size:40];
    self.contentLabel.font = [UIFont fontWithName:FontName size:25];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 20;
    self.bgView.layer.borderColor = [UIColor colorWithHexString:@"#FED289"].CGColor;
    self.bgView.layer.borderWidth = 1.2;
    
    self.contentLabel.text = @"When the ball moves to the vertical bar on the right, click on the drum or cymbals of the same color to score. Note that two difficult ones are encountered for the group of small balls, you need to press the corresponding drum head or cymbal at the same time.";
}
- (IBAction)privacyAction:(id)sender {
     [WSRollView findFromeController:self];
}

@end
