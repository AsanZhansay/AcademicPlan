//
//  AppDelegate.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 15.03.2021.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        setupRootController()
        
        return true
    }
}

extension AppDelegate {
    func setupRootController() {
        let vc = AcademicPlanVC()
        let navC = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = navC
    }
}

