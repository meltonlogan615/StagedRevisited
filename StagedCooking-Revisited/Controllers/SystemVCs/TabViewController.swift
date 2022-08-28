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
    self.tabBar.unselectedItemTintColor = .systemGray2
  }
  
  func layout() {
    let searchTab = SearchViewController()
    let searchTabItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
    searchTab.tabBarItem = searchTabItem
    
    let historyTab = HistoryViewController()
    let historyTabItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), selectedImage: UIImage(systemName: "clock.fill"))
    historyTab.tabBarItem = historyTabItem
    let historyNav = UINavigationController(rootViewController: historyTab)
    historyNav.navigationBar.prefersLargeTitles = true
    
    let savedTab = SavedViewController()
    let savedTabItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "pin.circle"), selectedImage: UIImage(systemName: "pin.circle.fill"))
    savedTab.tabBarItem = savedTabItem
    let savedNav = UINavigationController(rootViewController: savedTab)
    savedNav.navigationBar.prefersLargeTitles = true
    
    let favoritesTab = FavoritesViewController()
    let favoritesTabItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.circle"), selectedImage: UIImage(systemName: "heart.circle.fill"))
    favoritesTab.tabBarItem = favoritesTabItem
    let favoriteNav = UINavigationController(rootViewController: favoritesTab)
    favoriteNav.navigationBar.prefersLargeTitles = true

    let settingsTab = SettingsViewController()
    let settingsTabItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
    settingsTab.tabBarItem = settingsTabItem
    let settingsNav = UINavigationController(rootViewController: settingsTab)
    settingsNav.navigationBar.prefersLargeTitles = true
    
//    let settingsTab = SettingsViewController()
//    let settingsTabItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(named: "gear.circle.fill"))
//    settingsTab.tabBarItem = settingsTabItem
//    let settingsNav = UINavigationController(rootViewController: settingsTab)
//    settingsNav.navigationBar.prefersLargeTitles = true

    self.viewControllers = [
      searchTab,
      historyNav,
      savedNav,
      favoriteNav,
      settingsNav
    ]
  }
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
  }
}
