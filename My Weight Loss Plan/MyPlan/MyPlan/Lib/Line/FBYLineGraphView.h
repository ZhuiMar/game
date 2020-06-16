

#import <UIKit/UIKit.h>

@interface FBYLineGraphView : UIView



@property (nonatomic, strong) NSString *title;


@property (nonatomic, strong) NSArray *yMarkTitles;


@property (nonatomic, assign) CGFloat maxValue;


@property (nonatomic, assign) CGFloat xScaleMarkLEN;


- (void)setXMarkTitlesAndValues:(NSArray *)xMarkTitlesAndValues titleKey:(NSString *)titleKey valueKey:(NSString *)valueKey;

- (void)mapping;

- (void)reloadDatas;

@end
