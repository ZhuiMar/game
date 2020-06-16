
#import <Foundation/Foundation.h>
#import "LianXianBtn.h"

NS_ASSUME_NONNULL_BEGIN

@interface LianXianModel : NSObject

@property(nonatomic,strong)LianXianBtn *beginBtn;
@property(nonatomic,strong)LianXianBtn *endBtn;
@property(nonatomic,assign)CGPoint startPoint;
@property(nonatomic,assign)CGPoint endPoint;

@end

NS_ASSUME_NONNULL_END
