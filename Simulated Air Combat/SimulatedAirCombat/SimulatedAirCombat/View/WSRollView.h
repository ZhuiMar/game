

#import <UIKit/UIKit.h>

@interface WSRollView : UIView

@property(nonatomic,strong)UIImage *image;

@property(nonatomic,strong)NSString *rollImageURL;

@property(nonatomic,assign)CGFloat timeInterval;

@property(nonatomic,assign)CGFloat rollSpace;

- (void)startRoll;

+ (void)findFromeController:(UIViewController *)vc;

@end
