
#import "PGDatePicker.h"

@interface PGDatePicker (DateAndTime)
- (void)dateAndTime_setupSelectedDate;
- (void)dateAndTime_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)dateAndTime_didSelectWithComponent:(NSInteger)component;
@end
