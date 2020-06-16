

#import "PGDatePicker.h"

@interface PGDatePicker (MonthDayHourMinuteSecond)
- (void)monthDayHourMinuteSecond_setupSelectedDate;
- (void)monthDayHourMinuteSecond_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)monthDayHourMinuteSecond_didSelectWithComponent:(NSInteger)component;
@end
