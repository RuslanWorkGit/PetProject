//
//  AppDelegate.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 14.02.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navagationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navagationController
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }

}

