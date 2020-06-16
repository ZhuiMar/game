

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^EndTouchBlock)(CGPoint);

@interface LianXianDrawView : UIView

@property(nonatomic,strong)NSMutableArray *lineModelArr;
@property(nonatomic,strong)NSMutableArray *pointArr;

@property(nonatomic,strong)NSArray *btnArr;

@property(nonatomic, copy)  EndTouchBlock backBlock;

@property(nonatomic, copy)  EndTouchBlock startBlock;

@end

NS_ASSUME_NONNULL_END
