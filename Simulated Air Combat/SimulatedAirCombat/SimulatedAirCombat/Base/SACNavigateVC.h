

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnBlock)(void);

@interface SACNavigateVC : UINavigationController

@property(nonatomic, copy)  ReturnBlock backBlock;

@end

NS_ASSUME_NONNULL_END
