
#import "PGDatePicker.h"

@interface PGDatePicker (YearAndMonth)
- (void)yearAndMonth_setupSelectedDate;
- (void)yearAndMonth_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
- (void)yearAndMonth_didSelectWithComponent:(NSInteger)component;
@end
