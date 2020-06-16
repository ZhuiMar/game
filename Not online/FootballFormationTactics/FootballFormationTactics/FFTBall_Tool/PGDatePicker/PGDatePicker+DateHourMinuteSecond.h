

#import "PGDatePicker.h"

@interface PGDatePicker (DateHourMinuteSecond)
- (void)dateHourMinuteSecond_setupSelectedDate;
- (void)dateHourMinuteSecond_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)dateHourMinuteSecond_didSelectWithComponent:(NSInteger)component;
@end
