
#import "WSRollView.h"

typedef enum {
    RollDirectionUpDown,
    RollDirectionLeftRight,
} RollDirection;


@interface WSRollView ()

@property(nonatomic,strong)UIImage *rollImage;
@property(nonatomic,strong)UIImageView *rollImageView;


@property(nonatomic,assign)RollDirection direction;

@end


@implementation WSRollView

- (instancetype)initWithFrame:(CGRect)frame {
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

-(void)addRollImageAndTimer{
    
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

float rollX = 0.0;
float rollY = 0.0;
bool isReverse = NO;


-(void)rollImageAction {
    
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
