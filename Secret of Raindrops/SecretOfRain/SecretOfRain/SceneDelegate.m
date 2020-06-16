//
//  SceneDelegate.m
//  SecretOfRain
//
//  Created by zy on 2020/4/27.
//  Copyright © 2020 yongquan. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    SecretOfRain_HomeViewController *home = [[SecretOfRain_HomeViewController alloc]init];
    SecretOfRain_navigate *navigation = [[SecretOfRain_navigate alloc]initWithRootViewController:home];
    self.window.rootViewController = navigation;
    [self.window makeKeyAndVisible];
}

@end
