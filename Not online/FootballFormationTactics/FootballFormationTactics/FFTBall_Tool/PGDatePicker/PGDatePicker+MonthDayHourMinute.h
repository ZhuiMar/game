

#import "PGDatePicker.h"

@interface PGDatePicker (MonthDayHourMinute)
- (void)monthDayHourMinute_setupSelectedDate;
- (void)monthDayHourMinute_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)monthDayHourMinute_didSelectWithComponent:(NSInteger)component;
@end
