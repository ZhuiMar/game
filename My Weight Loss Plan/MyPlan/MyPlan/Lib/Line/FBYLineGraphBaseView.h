

#import <UIKit/UIKit.h>

@interface FBYLineGraphBaseView : UIView

@property (nonatomic, strong) NSArray *yMarkTitles;

@property (nonatomic, strong) NSArray *xMarkTitles;


@property (nonatomic, assign) CGFloat xScaleMarkLEN;


@property (nonatomic, assign) CGPoint startPoint;


@property (nonatomic, assign) CGFloat yAxis_L;

@property (nonatomic, assign) CGFloat xAxis_L;


- (void)mapping;

- (void)reloadDatas;

@end
