
#import <UIKit/UIKit.h>
#import "NSDate+PGCategory.h"
#import "UIColor+PGHex.h"
#import <PGPickerView/PGPickerView.h>
#import "PGEnumeration.h"

#define PGDatePickerDeprecated(instead) __attribute__((deprecated(instead)))

@protocol PGDatePickerDelegate;

@interface PGDatePicker : UIControl
@property (nonatomic, weak) id<PGDatePickerDelegate> delegate;
@property (nonatomic, assign) PGDatePickerMode datePickerMode; // default is PGDatePickerModeYear
@property(nonatomic, assign) PGDatePickerType datePickerType;

@property(nonatomic, assign) BOOL autoSelected;

@property(nonatomic, assign) BOOL middleText PGDatePickerDeprecated("sHiddenMiddleText");

@property (nonatomic, assign) CGFloat rowHeight; //default is 50

@property(nonatomic, assign) BOOL isHiddenMiddleText; // default is true

@property(nonatomic, assign) PGShowUnitType showUnit;
@property(nonatomic, copy) UIColor *middleTextColor;

@property (nonatomic, strong)UIColor *titleColorForSelectedRow PGDatePickerDeprecated("textColorOfSelectedRow");
@property (nonatomic, strong)UIColor *titleColorForOtherRow PGDatePickerDeprecated("textColorOfOtherRow");

@property (nonatomic, strong)UIColor *textColorOfSelectedRow;     //default is #69BDFF
@property(nonatomic, strong) UIFont *textFontOfSelectedRow;       //default is 17

@property (nonatomic, strong)UIColor *textColorOfOtherRow;        // default is [UIColor lightGrayColor]
@property(nonatomic, strong) UIFont *textFontOfOtherRow;          //default is 17

@property(nonatomic, strong) UIColor *lineBackgroundColor;       //default is #69BDFF

@property (nonatomic, strong) NSLocale   *locale;   // default is [NSLocale currentLocale]. setting nil returns to default
@property (nonatomic, copy)   NSCalendar *calendar; // default is [NSCalendar currentCalendar]. setting nil returns to default
@property (nonatomic, strong) NSTimeZone *timeZone; // default is nil. use current time zone or time zone from calendar

@property (nonatomic, strong) NSDate *minimumDate; // specify min/max date range. default is nil. When min > max, the values are ignored. Ignored in countdown timer mode
@property (nonatomic, strong) NSDate *maximumDate; // default is nil

@property (nonatomic, copy) void(^selectedDate)(NSDateComponents *dateComponents);

@property(nonatomic, assign) BOOL isHiddenWheels; // default is true  true -> hidden
@property(nonatomic, assign) BOOL isCycleScroll; //default is false

@property(nonatomic, copy) NSString *language;

- (void)tapSelectedHandler;

- (void)setDate:(NSDate *)date;
- (void)setDate:(NSDate *)date animated:(BOOL)animated;


@property (nonatomic) BOOL isOnlyHourFlag;

@property (nonatomic) NSInteger minuteInterval;

@property (nonatomic) NSInteger secondInterval;

@end

@protocol PGDatePickerDelegate <NSObject>

- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents;
@end

