

#import "PGDatePicker.h"

@interface PGDatePicker (DateHour)
- (void)dateHour_setupSelectedDate;
- (void)dateHour_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)dateHour_didSelectWithComponent:(NSInteger)component;
@end
