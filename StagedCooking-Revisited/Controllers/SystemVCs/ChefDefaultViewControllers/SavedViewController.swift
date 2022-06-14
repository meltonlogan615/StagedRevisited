//
//  SavedViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Foundation
import UIKit

class SavedViewController: UITableViewController {
  
  let chefDefault = ChefDefault()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    title = "Saved Recipes"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  
}

extension SavedViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ChefDefault.savedRecipes.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    config.text = ChefDefault.savedRecipes[indexPath.row].title
    cell.contentConfiguration = config
    return cell
  }
}

extension SavedViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("\(indexPath.row)")
  }
}
