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
    var mainViewController: HorizontalScrollViewController!
    var navigationController: CapchaNavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        mainViewController = HorizontalScrollViewController()
        navigationController = CapchaNavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
        
    }
    
}

