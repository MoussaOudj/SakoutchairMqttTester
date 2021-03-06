//
//  AppDelegate.swift
//  SakoutcherMqttTester
//
//  Created by Oudjama on 29/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = HomeViewController()
        window.rootViewController = UINavigationController(rootViewController: homeViewController);
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
}

