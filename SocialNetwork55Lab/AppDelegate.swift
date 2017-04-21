//
//  AppDelegate.swift
//  SocialNetwork55Lab
//
//  Created by Thiago-Bernardes on 10/7/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import Fabric
import Parse
import Crashlytics
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Fabric.with([Crashlytics.self])
        let configuration = AppConfig.parse.baseClientConfig
        Parse.initialize(with: configuration)
        self.window!.rootViewController = self.setInitialStoryboardBySeasonUser()
        NotificationsManager.shared.registerForLocalNotifications()
        return true
    }
   
    
    func setInitialStoryboardBySeasonUser() -> UIViewController? {
        var initialViewController: UIViewController? = nil
        
        //MARK-DOWN: Comment for initialize in Main
//        
//        if let _ = PFUser.current() {
//            initialViewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Main", identifier: "")
//        }else {
//            initialViewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Authentication", identifier: "")
//        }
//
       initialViewController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Main", identifier: "")
//        
        return initialViewController
    }
   
}

