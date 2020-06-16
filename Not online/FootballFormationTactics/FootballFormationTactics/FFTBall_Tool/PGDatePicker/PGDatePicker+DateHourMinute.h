
#import "PGDatePicker.h"

@interface PGDatePicker (DateHourMinute)
- (void)dateHourMinute_setupSelectedDate;
- (void)dateHourMinute_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)dateHourMinute_didSelectWithComponent:(NSInteger)component;
@end
