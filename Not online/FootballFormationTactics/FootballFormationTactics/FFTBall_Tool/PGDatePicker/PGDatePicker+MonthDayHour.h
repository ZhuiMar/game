

#import "PGDatePicker.h"

@interface PGDatePicker (MonthDayHour)
- (void)monthDayHour_setupSelectedDate;
- (void)monthDayHour_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)monthDayHour_didSelectWithComponent:(NSInteger)component;
@end
