//
//  AppDelegate.swift
//  Quick Wait Xib
//
//  Created by Juninho on 19/01/22.
//

import UIKit
import Sentry
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        var window: UIWindow?
        let navc = UINavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navc
        // Initialise the first coordinator with the main navigation controller
        // The start method will actually display the main view
        let vc: MyLaunchViewController = MyLaunchViewController()
        navc.viewControllers = [vc]
        //navc.pushViewController(vc, animated: true)
        window?.makeKeyAndVisible()
        
        SentrySDK.start { options in
            options.dsn = "https://be4e70d28e7840508adf77ee9bd432ad@o1144636.ingest.sentry.io/6242701"
            options.debug = true // Enabled debug when first installing is always helpful
            
            // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
            // We recommend adjusting this value in production.
            options.tracesSampleRate = 1.0
        }
        FirebaseApp.configure()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

