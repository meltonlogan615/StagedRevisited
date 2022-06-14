//
//  TabViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/10/22.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    style()
    layout()
  }
}

extension TabViewController {
  func style() {
    self.tabBar.tintColor = K.scGreen
  }
  
  func layout() {
    let searchTab = SearchViewController()
    let searchTabItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(named: "magnifyingglass.circle.fill"))
    searchTab.tabBarItem = searchTabItem
    
    let historyTab = HistoryViewController()
    let historyTabItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), selectedImage: UIImage(named: "clock.fill"))
    historyTab.tabBarItem = historyTabItem
    
    let savedTab = SavedViewController()
    let savedTabItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "star.circle"), selectedImage: UIImage(named: "star.circle.fill"))
    savedTab.tabBarItem = savedTabItem
    
    let favoritesTab = FavoritesViewController()
    let favoritesTabItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.circle"), selectedImage: UIImage(named: "heart.circle.fill"))
    favoritesTab.tabBarItem = favoritesTabItem
    
    let settingsTab = UIViewController()
    let settingsTabItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(named: "gear.circle.fill"))
    settingsTab.tabBarItem = settingsTabItem

    self.viewControllers = [searchTab, historyTab, savedTab, favoritesTab, settingsTab]
  }
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Tappy-Tappy")
  }
}
