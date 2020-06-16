
#import <UIKit/UIKit.h>
#import "PGDatePicker.h"
#import "PGEnumeration.h"

@interface PGDatePickManager : UIViewController

@property (nonatomic, weak) PGDatePicker *datePicker;
@property (nonatomic, assign) PGDatePickManagerStyle style;
@property (nonatomic, assign) BOOL isShadeBackground;

@property (nonatomic, copy) NSString *cancelButtonText;
@property (nonatomic, copy) UIFont *cancelButtonFont;
@property (nonatomic, copy) UIColor *cancelButtonTextColor;


@property (nonatomic, copy) NSString *confirmButtonText;

@property (nonatomic, copy) UIFont *confirmButtonFont;

@property (nonatomic, copy) UIColor *confirmButtonTextColor;

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, strong)UIColor *headerViewBackgroundColor;
@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) BOOL isShowUnit;
@property (nonatomic, copy)  void(^cancelButtonMonitor)();

@property (nonatomic, copy) NSTimeInterval(^customDismissAnimation)(UIView* dismissView, UIView* contentView );

@end
