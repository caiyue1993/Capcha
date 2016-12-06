//
//  AppDelegate.swift
//  Capcha
//
//  Created by 蔡越 on 16/12/6.
//  Copyright © 2016年 Nanjing University. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var viewController: ViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.viewController = ViewController()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
        
    }
    
}

