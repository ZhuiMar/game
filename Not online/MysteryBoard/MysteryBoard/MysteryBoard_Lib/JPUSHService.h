
#define JPUSH_VERSION_NUMBER 3.3.2

#import <Foundation/Foundation.h>

@class CLRegion;
@class UILocalNotification;
@class CLLocation;
@class UNNotificationCategory;
@class UNNotificationSettings;
@class UNNotificationRequest;
@class UNNotification;
@protocol JPUSHRegisterDelegate;
@protocol JPUSHGeofenceDelegate;

typedef void (^JPUSHTagsOperationCompletion)(NSInteger iResCode, NSSet *iTags, NSInteger seq);
typedef void (^JPUSHTagValidOperationCompletion)(NSInteger iResCode, NSSet *iTags, NSInteger seq, BOOL isBind);
typedef void (^JPUSHAliasOperationCompletion)(NSInteger iResCode, NSString *iAlias, NSInteger seq);

extern NSString *const kJPFNetworkIsConnectingNotification;
extern NSString *const kJPFNetworkDidSetupNotification;
extern NSString *const kJPFNetworkDidCloseNotification;
extern NSString *const kJPFNetworkDidRegisterNotification;
extern NSString *const kJPFNetworkFailedRegisterNotification;
extern NSString *const kJPFNetworkDidLoginNotification;
extern NSString *const kJPFNetworkDidReceiveMessageNotification;       
extern NSString *const kJPFServiceErrorNotification;

typedef NS_OPTIONS(NSUInteger, JPAuthorizationOptions) {
    JPAuthorizationOptionNone    = 0,   // the application may not present any UI upon a notification being received
    JPAuthorizationOptionBadge   = (1 << 0),    // the application may badge its icon upon a notification being received
    JPAuthorizationOptionSound   = (1 << 1),    // the application may play a sound upon a notification being received
    JPAuthorizationOptionAlert   = (1 << 2),    // the application may display an alert upon a notification being received
    JPAuthorizationOptionCarPlay = (1 << 3),    // The ability to display notifications in a CarPlay environment.
    JPAuthorizationOptionCriticalAlert NS_AVAILABLE_IOS(12.0) = (1 << 4) ,   //The ability to play sounds for critical alerts.
    JPAuthorizationOptionProvidesAppNotificationSettings NS_AVAILABLE_IOS(12.0) = (1 << 5) ,      //An option indicating the system should display a button for in-app notification settings.
    JPAuthorizationOptionProvisional NS_AVAILABLE_IOS(12.0) = (1 << 6) ,     //The ability to post noninterrupting notifications provisionally to the Notification Center.
    JPAuthorizationOptionAnnouncement NS_AVAILABLE_IOS(13.0) = (1 << 7) , //The ability for Siri to automatically read out messages over AirPods.
};

typedef NS_ENUM(NSUInteger, JPAuthorizationStatus) {
    JPAuthorizationNotDetermined    = 0,   // The user has not yet made a choice regarding whether the application may post user notifications.
    JPAuthorizationStatusDenied,    // The application is not authorized to post user notifications.
    JPAuthorizationStatusAuthorized,    // The application is authorized to post user notifications.
    JPAuthorizationStatusProvisional NS_AVAILABLE_IOS(12.0),    // The application is authorized to post non-interruptive user notifications.
};


@interface JPUSHRegisterEntity : NSObject


@property (nonatomic, assign) NSInteger types;

@property (nonatomic, strong) NSSet *categories;
@end


@interface JPushNotificationIdentifier : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSArray<NSString *> *identifiers;
@property (nonatomic, copy) UILocalNotification *notificationObj NS_DEPRECATED_IOS(4_0, 10_0);
@property (nonatomic, assign) BOOL delivered NS_AVAILABLE_IOS(10_0);
@property (nonatomic, copy) void (^findCompletionHandler)(NSArray *results); //

@end

@interface JPushNotificationSound : NSObject <NSCopying, NSCoding>
@property (nonatomic, copy) NSString *soundName;
@property (nonatomic, copy) NSString *criticalSoundName NS_AVAILABLE_IOS(12.0);
@property (nonatomic, assign) float criticalSoundVolume NS_AVAILABLE_IOS(12.0);
@end



@interface JPushNotificationContent : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSNumber *badge;
@property (nonatomic, copy) NSString *action NS_DEPRECATED_IOS(8_0, 10_0);
@property (nonatomic, copy) NSString *categoryIdentifier;
@property (nonatomic, copy) NSDictionary *userInfo;
@property (nonatomic, copy) NSString *sound;
@property (nonatomic, copy) JPushNotificationSound *soundSetting NS_AVAILABLE_IOS(10.0);
@property (nonatomic, copy) NSArray *attachments NS_AVAILABLE_IOS(10_0);
@property (nonatomic, copy) NSString *threadIdentifier NS_AVAILABLE_IOS(10_0);
@property (nonatomic, copy) NSString *launchImageName NS_AVAILABLE_IOS(10_0);
@property (nonatomic, copy) NSString *summaryArgument NS_AVAILABLE_IOS(12.0);
@property (nonatomic, assign) NSUInteger summaryArgumentCount NS_AVAILABLE_IOS(12.0);
@property (nonatomic, copy) NSString *targetContentIdentifier NS_AVAILABLE_IOS(13.0);  // An identifier for the content of the notification used by the system to customize the scene to be activated when tapping on a notification.

@end



@interface JPushNotificationTrigger : NSObject<NSCopying, NSCoding>

@property (nonatomic, assign) BOOL repeat;
@property (nonatomic, copy) NSDate *fireDate NS_DEPRECATED_IOS(2_0, 10_0);
@property (nonatomic, copy) CLRegion *region NS_AVAILABLE_IOS(8_0);
@property (nonatomic, copy) NSDateComponents *dateComponents NS_AVAILABLE_IOS(10_0);
@property (nonatomic, assign) NSTimeInterval timeInterval NS_AVAILABLE_IOS(10_0);

@end


@interface JPushNotificationRequest : NSObject<NSCopying, NSCoding>

@property (nonatomic, copy) NSString *requestIdentifier;
@property (nonatomic, copy) JPushNotificationContent *content;
@property (nonatomic, copy) JPushNotificationTrigger *trigger;
@property (nonatomic, copy) void (^completionHandler)(id result);
@end


@interface JPUSHService : NSObject


+ (void)setupWithOption:(NSDictionary *)launchingOption
                 appKey:(NSString *)appKey
                channel:(NSString *)channel
       apsForProduction:(BOOL)isProduction;


+ (void)setupWithOption:(NSDictionary *)launchingOption
                 appKey:(NSString *)appKey
                channel:(NSString *)channel
       apsForProduction:(BOOL)isProduction
  advertisingIdentifier:(NSString *)advertisingId;



+ (void)registerForRemoteNotificationTypes:(NSUInteger)types
                                categories:(NSSet *)categories;

+ (void)registerForRemoteNotificationConfig:(JPUSHRegisterEntity *)config delegate:(id<JPUSHRegisterDelegate>)delegate;


+ (void)registerDeviceToken:(NSData *)deviceToken;


+ (void)handleRemoteNotification:(NSDictionary *)remoteInfo;

+ (void)registerVoipToken:(NSData *)voipToken;

+ (void)handleVoipNotification:(NSDictionary *)remoteInfo;

+ (void)requestNotificationAuthorization:(void (^)(JPAuthorizationStatus status))completion;

+ (void)openSettingsForNotification:(void (^)(BOOL success))completionHandler NS_AVAILABLE_IOS(8_0);

+ (void)addTags:(NSSet<NSString *> *)tags
     completion:(JPUSHTagsOperationCompletion)completion
            seq:(NSInteger)seq;

+ (void)setTags:(NSSet<NSString *> *)tags
     completion:(JPUSHTagsOperationCompletion)completion
            seq:(NSInteger)seq;

+ (void)deleteTags:(NSSet<NSString *> *)tags
        completion:(JPUSHTagsOperationCompletion)completion
               seq:(NSInteger)seq;

+ (void)cleanTags:(JPUSHTagsOperationCompletion)completion
              seq:(NSInteger)seq;

+ (void)getAllTags:(JPUSHTagsOperationCompletion)completion
               seq:(NSInteger)seq;

+ (void)validTag:(NSString *)tag
      completion:(JPUSHTagValidOperationCompletion)completion
             seq:(NSInteger)seq;

+ (void)setAlias:(NSString *)alias
      completion:(JPUSHAliasOperationCompletion)completion
             seq:(NSInteger)seq;

+ (void)deleteAlias:(JPUSHAliasOperationCompletion)completion
                seq:(NSInteger)seq;

+ (void)getAlias:(JPUSHAliasOperationCompletion)completion
             seq:(NSInteger)seq;

+ (NSSet *)filterValidTags:(NSSet *)tags;

+ (void)startLogPageView:(NSString *)pageName __attribute__((deprecated("JCore 1.1.8 Version expired")));

+ (void)stopLogPageView:(NSString *)pageName __attribute__((deprecated("JCore 1.1.8 Version expired")));

+ (void)beginLogPageView:(NSString *)pageName duration:(int)seconds __attribute__((deprecated("JCore 1.1.8 Version expired")));

+ (void)crashLogON;

+ (void)setLatitude:(double)latitude longitude:(double)longitude;

+ (void)setLocation:(CLLocation *)location;

+ (void)setGeofenecMaxCount:(NSInteger)count;

+ (void)registerLbsGeofenceDelegate:(id<JPUSHGeofenceDelegate>)delegate withLaunchOptions:(NSDictionary *)launchOptions;

+ (void)removeGeofenceWithIdentifier:(NSString *)geofenceId;

+ (void)addNotification:(JPushNotificationRequest *)request;

+ (void)removeNotification:(JPushNotificationIdentifier *)identifier;

+ (void)findNotification:(JPushNotificationIdentifier *)identifier;

+ (UILocalNotification *)setLocalNotification:(NSDate *)fireDate
                                    alertBody:(NSString *)alertBody
                                        badge:(int)badge
                                  alertAction:(NSString *)alertAction
                                identifierKey:(NSString *)notificationKey
                                     userInfo:(NSDictionary *)userInfo
                                    soundName:(NSString *)soundName __attribute__((deprecated("JPush 2.1.9 Version expired")));

+ (UILocalNotification *)setLocalNotification:(NSDate *)fireDate
                                    alertBody:(NSString *)alertBody
                                        badge:(int)badge
                                  alertAction:(NSString *)alertAction
                                identifierKey:(NSString *)notificationKey
                                     userInfo:(NSDictionary *)userInfo
                                    soundName:(NSString *)soundName
                                       region:(CLRegion *)region
                           regionTriggersOnce:(BOOL)regionTriggersOnce
                                     category:(NSString *)category NS_AVAILABLE_IOS(8_0) __attribute__((deprecated("JPush 2.1.9 Version expired")));

+ (void)showLocalNotificationAtFront:(UILocalNotification *)notification
                       identifierKey:(NSString *)notificationKey __attribute__((deprecated("JPush 2.1.9 Version expired")));

+ (void)deleteLocalNotificationWithIdentifierKey:(NSString *)notificationKey __attribute__((deprecated("JPush 2.1.9 Version expired")));

+ (void)deleteLocalNotification:(UILocalNotification *)localNotification __attribute__((deprecated("JPush 2.1.9 Version expired")));

+ (NSArray *)findLocalNotificationWithIdentifier:(NSString *)notificationKey __attribute__((deprecated("JPush 2.1.9 Version expired")));

+ (void)clearAllLocalNotifications __attribute__((deprecated("JPush 2.1.9 Version expired")));

+ (BOOL)setBadge:(NSInteger)value;

+ (void)resetBadge;

+ (void)setMobileNumber:(NSString *)mobileNumber completion:(void (^)(NSError *error))completion;

+ (NSString *)registrationID;

+ (void)registrationIDCompletionHandler:(void(^)(int resCode,NSString *registrationID))completionHandler;

+ (void)setDebugMode;

+ (void)setLogOFF;

+ (void)setLocationEanable:(BOOL)isEanble;

+ (void) setTags:(NSSet *)tags
           alias:(NSString *)alias
callbackSelector:(SEL)cbSelector
          target:(id)theTarget __attribute__((deprecated("JPush 2.1.1 Version expired")));
+ (void) setTags:(NSSet *)tags
           alias:(NSString *)alias
callbackSelector:(SEL)cbSelector
          object:(id)theTarget __attribute__((deprecated("JPush 3.0.6 Version expired")));
+ (void) setTags:(NSSet *)tags
callbackSelector:(SEL)cbSelector
          object:(id)theTarget __attribute__((deprecated("JPush 3.0.6 Version expired")));
+ (void)setTags:(NSSet *)tags
          alias:(NSString *)alias
fetchCompletionHandle:(void (^)(int iResCode, NSSet *iTags, NSString *iAlias))completionHandler __attribute__((deprecated("JPush 3.0.6 Version expired")));
+ (void)  setTags:(NSSet *)tags
aliasInbackground:(NSString *)alias __attribute__((deprecated("JPush 3.0.6 Version expired")));
+ (void)setAlias:(NSString *)alias
callbackSelector:(SEL)cbSelector
          object:(id)theTarget __attribute__((deprecated("JPush 3.0.6 Version expired")));

@end

@class UNUserNotificationCenter;
@class UNNotificationResponse;

@protocol JPUSHRegisterDelegate <NSObject>

/*
 * @brief handle UserNotifications.framework [willPresentNotification:withCompletionHandler:]
 * @param center [UNUserNotificationCenter currentNotificationCenter]
 * @param notification
 * @param completionHandler 该callback中的options
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger options))completionHandler;
/*
 * @brief handle UserNotifications.framework [didReceiveNotificationResponse:withCompletionHandler:]
 * @param center [UNUserNotificationCenter currentNotificationCenter]
 * @param response
 * @param completionHandler
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler;

/*
 * @brief handle UserNotifications.framework [openSettingsForNotification:]
 * @param center [UNUserNotificationCenter currentNotificationCenter]
 * @param notification
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification NS_AVAILABLE_IOS(12.0);

- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info;

@end

@protocol JPUSHGeofenceDelegate <NSObject>

- (void)jpushGeofenceIdentifer:(NSString *)geofenceId didEnterRegion:(NSDictionary *)userInfo error:(NSError *)error;

- (void)jpushGeofenceIdentifer:(NSString *)geofenceId didExitRegion:(NSDictionary *)userInfo error:(NSError *)error;

@end
