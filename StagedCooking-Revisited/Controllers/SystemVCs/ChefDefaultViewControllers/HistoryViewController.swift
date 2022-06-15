//
//  HistoryViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Foundation
import UIKit

class HistoryViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Search History"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    view.backgroundColor = K.primary
  }
}

extension HistoryViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 1
    if ChefDefault.searchHistory.count == 0 {
      count = 1
    } else {
      count = ChefDefault.searchHistory.count
    }
    return count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.primary
    
    switch ChefDefault.searchHistory.count {
      case 0:
        config.text = "No Saved Recipes"
        cell.isUserInteractionEnabled = false
      default:
        config.text = ChefDefault.searchHistory[indexPath.row]
    }
    
    cell.contentConfiguration = config
    return cell
  }
}

extension HistoryViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch ChefDefault.searchHistory.count {
      case 0:
        break
      default:
        searchFromHistoryList(searched: ChefDefault.searchHistory[indexPath.row])
    }
  }
}

extension HistoryViewController {
  private func searchFromHistoryList(searched: String) {
    let listVC = RecipeListCollectionView()
    listVC.searchedRecipe = searched
    let navigationController = UINavigationController(rootViewController: listVC)
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .flipHorizontal
    present(navigationController, animated: true)
  }
}