//
//  SceneDelegate.m
//  SimulateAnimalCall
//
//  Created by luzhaoyang on 2020/4/6.
//  Copyright © 2020 xinancaida. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
   UIWindowScene *windowScene = (UIWindowScene *)scene;
   self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
   self.window.frame = windowScene.coordinateSpace.bounds;
   SATabbarVC *tab = [[SATabbarVC alloc]init];
   self.window.rootViewController = tab;
   [self.window makeKeyAndVisible];
}

@end
