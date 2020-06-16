//
//  AppDelegate.swift
//  foodprice
//
//  Created by  luzhaoyang on 2020/4/1.
//  Copyright © 2020 lijingshuxiang.foodprice. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let navigation = FPNavigation(rootViewController: FPHomePage())
        
        self.window!.rootViewController = navigation
        self.window!.makeKeyAndVisible()
        return true
    }
}

