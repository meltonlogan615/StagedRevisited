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
    
//    let layout = UICollectionViewFlowLayout()
//    layout.scrollDirection = .horizontal
//    let root = CardCollectionTwo(collectionViewLayout: layout)
//    let root = CardCollectionContainer()
//    let root = CardCollectionTwo()
    let root = SearchViewController()
//    let root = LoadingViewController()
    window?.rootViewController = root
    
    return true
  }

}

