

#import <UIKit/UIKit.h>

@interface XTPasterStageView : UIView

@property (nonatomic,strong) UIImage *originImage ;

- (instancetype)initWithFrame:(CGRect)frame ;
- (void)addPasterWithImg:(UIImage *)imgP ;
- (UIImage *)doneEdit ;

@end
