
#import <UIKit/UIKit.h>


@class LianXianModel;

NS_ASSUME_NONNULL_BEGIN


@interface LianXianBtn : UIButton

@property(nonatomic,assign)int verticalList;
@property(nonatomic,assign)int horizontalrow;
@property(nonatomic,assign)int maxverticalList;
@property(nonatomic,assign)int maxhorizontalrow;

@property(nonatomic,assign)CGPoint leftCenterPoint;
@property(nonatomic,assign)CGPoint rightCenterPoint;

@property(nonatomic,assign)BOOL leftIsConnect;
@property(nonatomic,assign)BOOL rightIsConnect;

@property(nonatomic,strong)LianXianModel *lianxianModel;

@end

NS_ASSUME_NONNULL_END
