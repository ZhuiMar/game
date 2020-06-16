
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SACProgressView : UIView

@property (nonatomic, assign) CGFloat progress;

@property(nonatomic,strong) UIColor *progerssColor;

@property(nonatomic,strong) UIColor *progerssBackgroundColor;

@property(nonatomic,strong) UIColor *progerssStokeBackgroundColor;

@property(nonatomic,assign) CGFloat progerStokeWidth;

@end

NS_ASSUME_NONNULL_END
