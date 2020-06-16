//   
   

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow.init(frame: UIScreen.main.bounds)
             
             let rootViewController = UINavigationController.init(rootViewController: GHHomeViewController.init())
             rootViewController.navigationBar.isHidden = true
             
             window?.rootViewController = rootViewController
             window?.makeKeyAndVisible()
             
        
        
        return true
    }




}

