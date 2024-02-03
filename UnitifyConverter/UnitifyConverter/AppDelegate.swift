//
//  AppDelegate.swift
//  UnitifyConverter
//
//  Created by Mpilo Pillz on 2024/02/03.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemMint
        window?.rootViewController = ViewController()
        
        return true
    }


}

