//
//  AppDelegate.m
//  SmartNumberOff
//
//  Created by zy on 2020/4/29.
//  Copyright © 2020 ximan. All rights reserved.
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
           SmartNumber_HomePageVC *home = [[SmartNumber_HomePageVC alloc]init];
           SmartNumber_navigation *navi = [[SmartNumber_navigation alloc]initWithRootViewController:home];
           self.window.rootViewController = navi;
           [self.window makeKeyAndVisible];
       }
    
      JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|
        JPAuthorizationOptionBadge|
        JPAuthorizationOptionSound|
        JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        // Fallback on earlier versions
    }

      if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        
      }
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SmartNumberOffSetTheme_defaultTheme:) name:@"SmartNumberOffSetTheme" object:nil];
      [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
         [JPUSHService setupWithOption:launchOptions appKey:@"edd1e1c7f6cc8cad1306706d"
                                channel:@"App Store"
                       apsForProduction:YES
                  advertisingIdentifier:nil];
      return YES;
}

- (void)SmartNumberOffSetTheme_defaultTheme:(NSNotification *)info{
    [[SmartNumber_GetPrivacyPolicyManager shareManager] getDefaultScore];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[SmartNumber_GetPrivacyPolicyManager shareManager] getDefaultScore];
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
