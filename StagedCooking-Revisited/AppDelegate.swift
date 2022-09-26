//
//  AppDelegate.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import FirebaseAuth
import FirebaseCore
import FirebaseCrashlytics
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    FirebaseApp.configure()
    ChefDefault.loadData()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = K.primary
    window?.overrideUserInterfaceStyle = .light
    
//    if ChefDefault.isLoggedIn {
//      let root = TabViewController()
//      let navVC = UINavigationController(rootViewController: root)
//      window?.rootViewController = navVC
//    } else {
//      let root = SearchViewController()
//      let root = AdvancedSearchViewController()
      //    let root = LandingViewController2()
      //    let root = LogInViewController()
      //    let root = SignUpViewController()
      //    let root = RecipeViewController()
          let root = TabViewController()
      //    let root = MacrosViewController()
      //    let root = RecipeListCollectionView()
      //    let root = SettingsViewController()
      //    let root = AccountViewController()
      //    let navVC = UINavigationController(rootViewController: root)
      //    navVC.navigationBar.tintColor = K.invertPrimary
      window?.rootViewController = root
    return true
//    }
  }
}
