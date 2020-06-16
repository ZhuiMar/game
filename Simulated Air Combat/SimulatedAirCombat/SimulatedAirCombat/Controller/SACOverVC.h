
#import "SACBaseVC.h"

NS_ASSUME_NONNULL_BEGIN


@protocol SACOverVCDelegate <NSObject>

- (void)againAction;
- (void)homeAction;

@end

@interface SACOverVC : SACBaseVC

@property (nonatomic, weak) id<SACOverVCDelegate>delegate;

- (instancetype)initWithScore:(NSInteger)score;

@end

NS_ASSUME_NONNULL_END
