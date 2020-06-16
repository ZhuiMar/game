//
//  AppDelegate.m
//  ArithmeticMagicCup
//
//  Created by luzhaoyang on 2020/4/22.
//  Copyright © 2020 qingmai. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    if (@available(ios 13, *)) {
        
    }else{
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        ArithmeticMagicCup_HomePage *home = [[ArithmeticMagicCup_HomePage alloc]init];
        ArithmeticMagicCup_navigate *navigation = [[ArithmeticMagicCup_navigate alloc]initWithRootViewController:home];
        self.window.rootViewController = navigation;
        [self.window makeKeyAndVisible];
    }
    
    JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|
                  JPAuthorizationOptionBadge |
                 JPAuthorizationOptionSound |
                JPAuthorizationOptionProvidesAppNotificationSettings;

    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
      
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultCup:) name:@"defaultCup" object:nil];
    
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
       [JPUSHService setupWithOption:launchOptions appKey:@"d38f2025b88a857d47bf81b5"
                              channel:@"App Store"
                     apsForProduction:YES
                advertisingIdentifier:nil];
     
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    if(self.isForceLandscape == YES){
        return UIInterfaceOrientationMaskLandscapeLeft;
    }else if(self.isForcePortrait == YES){
        return UIInterfaceOrientationLandscapeRight;
    }
    return UIInterfaceOrientationMaskLandscapeLeft;
}

- (void)defaultCup:(NSNotification *)info{
    [[ArithmeticMagicCup_helpers getHelper] getDefaultCup];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
  if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
  
  }else{
   
  }
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
  NSDictionary * userInfo = notification.request.content.userInfo;
  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
  }
  completionHandler();
}

- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info {
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
  [JPUSHService handleRemoteNotification:userInfo];
  completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  [JPUSHService handleRemoteNotification:userInfo];
}

@end
