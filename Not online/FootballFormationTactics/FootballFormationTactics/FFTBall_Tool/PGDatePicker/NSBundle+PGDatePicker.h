

#import <Foundation/Foundation.h>

@interface NSBundle (PGDatePicker)
+ (NSString *)pg_localizedStringForKey:(NSString *)key;
+ (NSString *)pg_localizedStringForKey:(NSString *)key language:(NSString *)language;
+ (NSString *)pg_localizedStringForKey:(NSString *)key value:(NSString *)value;
+ (NSString *)pg_localizedStringForKey:(NSString *)key value:(NSString *)value language:(NSString *)language;
@end
