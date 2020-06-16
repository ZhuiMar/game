
#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

static char addressKey;
static char identityAddressKey;

- (void)sd_setUserInfo:(NSDictionary*)userInfo {
    objc_setAssociatedObject(self, &addressKey, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary*)sd_userInfo {
    return objc_getAssociatedObject(self, &addressKey);
}

- (void)sd_setIdentity:(NSString*)identity {
    objc_setAssociatedObject(self, &identityAddressKey, identity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)sd_identity {
    return objc_getAssociatedObject(self, &identityAddressKey);
}

@end
