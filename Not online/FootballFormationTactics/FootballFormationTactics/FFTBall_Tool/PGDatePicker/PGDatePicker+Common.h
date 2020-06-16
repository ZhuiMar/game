
#import "PGDatePicker.h"

@interface PGDatePicker (Common)
- (NSInteger)weekDayMappingFrom:(NSString *)weekString;
- (NSString *)weekMappingFrom:(NSInteger)weekDay;
- (NSInteger)daysWithMonthInThisYear:(NSInteger)year withMonth:(NSInteger)month;
@end
