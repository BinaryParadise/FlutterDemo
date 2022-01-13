//
//  AppDelegate.swift
//  Playing
//
//  Created by Rake Yang on 2022/1/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let bd = BoostDelegate()
        bd.navigationController = window?.rootViewController as? UINavigationController
        FlutterBoost.instance().setup(application, delegate: bd) { engine in
            
        }
        return true
    }

}

