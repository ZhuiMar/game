
#import "PGDatePicker.h"

@interface PGDatePicker (MonthDay)
- (void)monthDay_setupSelectedDate;
- (void)monthDay_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)monthDay_didSelectWithComponent:(NSInteger)component;
@end
