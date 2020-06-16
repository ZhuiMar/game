
#import <Foundation/Foundation.h>
#import "MJExtensionConst.h"

@interface NSString (MJExtension)

- (NSString *)mj_underlineFromCamel;

- (NSString *)mj_camelFromUnderline;

- (NSString *)mj_firstCharUpper;

- (NSString *)mj_firstCharLower;

- (BOOL)mj_isPureInt;

- (NSURL *)mj_url;
@end

@interface NSString (MJExtensionDeprecated_v_2_5_16)
- (NSString *)underlineFromCamel MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSString *)camelFromUnderline MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSString *)firstCharUpper MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSString *)firstCharLower MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (BOOL)isPureInt MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
- (NSURL *)url MJExtensionDeprecated("Please prefix the method name with mj_, usingmj_***");
@end
