

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YCPopoverDataBlock)(NSString *);

@interface YCPopoverData : NSObject

- (instancetype)initWithThemeBlock:(YCPopoverDataBlock)block;

- (void)getTheme;
- (void)setUiDefault;

@end

NS_ASSUME_NONNULL_END
