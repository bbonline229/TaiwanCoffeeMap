//
//  AppDelegate.swift
//  TaiwanCoffeeMap
//
//  Created by Jack on 2019/10/3.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupGoogleService()
        initSetup()
        
        return true
    }
    
    private func initSetup() {
        let mainCoffeeMapVC = MainCoffeeMapVC()
        
        window =  UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = mainCoffeeMapVC
        window?.makeKeyAndVisible()
    }
    
    private func setupGoogleService() {
       GMSServices.provideAPIKey("AIzaSyCZ_GkUsKwXv6C1pqU-slDVg26t-oFeHVg")
    }
}

