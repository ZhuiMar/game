

#import <Foundation/Foundation.h>

@interface NSObject (Property)

- (void)sd_setUserInfo:(NSDictionary*)userInfo;

- (NSDictionary*)sd_userInfo;

- (void)sd_setIdentity:(NSString*)identity;

- (NSString*)sd_identity;

@end
