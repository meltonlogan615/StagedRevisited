//
//  AppDelegate.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = K.primary
    
    let root = SearchViewController()
//    let root = LoadingViewController()
//    let root = AdvancedSearchViewController()
//    let root = LandingViewController()
//    let root = LogInViewController()
//    let root = SignUpViewController()
//    let root = TabViewController()
    let navVC = UINavigationController(rootViewController: root)
    window?.rootViewController = navVC
    
    return true
  }
}
