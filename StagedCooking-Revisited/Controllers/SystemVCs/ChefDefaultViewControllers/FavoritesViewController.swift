//
//  FavoritesViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Foundation
import UIKit

class FavoritesViewController: UITableViewController {
  
  let chefDefault = ChefDefault()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
}

extension FavoritesViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 1
    if ChefDefault.favoriteRecipes.count == 0 {
      count = 1
    } else {
      count = ChefDefault.favoriteRecipes.count
    }
    return count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.primary
    
    switch ChefDefault.favoriteRecipes.count {
      case 0:
        config.text = "No Favorite Recipes"
        cell.isUserInteractionEnabled = false
      default:
        config.text = ChefDefault.favoriteRecipes[indexPath.row].title
    }
    
    cell.contentConfiguration = config
    return cell
  }
}

extension FavoritesViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row)")
  }
}
