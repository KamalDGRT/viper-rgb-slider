//
//  AppDelegate.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 22/06/22.
//

import UIKit


/**
AppDelegate is responsible for handling application-level events, like app
launch.
*/
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    /**
        Override point for customization after application launch.
    */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    /**
     - Called when a new scene session is being created.
     - Use this method to select a configuration to create the new scene with.
    */
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    /**
     - Called when the user discards a scene session.
     - If any sessions were discarded while the application was not running, this will be called shortly after `application:didFinishLaunchingWithOptions`.
     - Use this method to release any resources that were specific to the discarded scenes, as they will not return
    */
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

