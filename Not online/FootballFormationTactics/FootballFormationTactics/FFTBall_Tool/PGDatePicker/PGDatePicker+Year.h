

#import "PGDatePicker.h"

@interface PGDatePicker (Year)
- (void)year_setupSelectedDate;
- (void)year_setDateWithComponents:(NSDateComponents *)components animated:(BOOL)animated;
@end
