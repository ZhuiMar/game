

#import <UIKit/UIKit.h>
#import "FBYLineGraphBaseView.h"

@interface FBYLineGraphContentView : FBYLineGraphBaseView

@property (nonatomic, strong) NSArray *valueArray;

@property (nonatomic, assign) CGFloat maxValue;


- (void)mapping;


- (void)reloadDatas;

@end
