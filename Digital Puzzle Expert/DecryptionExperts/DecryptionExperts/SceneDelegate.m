//
//  SceneDelegate.m
//  DecryptionExperts
//
//  Created by luzhaoyang on 2020/4/14.
//  Copyright © 2020 weilingtou. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    DEHomePage *home = [[DEHomePage alloc]init];
    DENavigation *navi = [[DENavigation alloc]initWithRootViewController:home];
    self.window.rootViewController = navi;
    self.window.backgroundColor = [UIColor clearColor];
    [self.window makeKeyAndVisible];
}

@end
