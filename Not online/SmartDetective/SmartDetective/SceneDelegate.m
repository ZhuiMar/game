//
//  SceneDelegate.m
//  SmartDetective
//
//  Created by zy on 2020/5/13.
//  Copyright © 2020 jingjiang. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    SmartDetective_HomeViewController *home = [[SmartDetective_HomeViewController alloc]init];
    SmartDetective_navigation *navigation = [[SmartDetective_navigation alloc]initWithRootViewController:home];
    self.window.rootViewController = navigation;
    [self.window makeKeyAndVisible];
}

@end
