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
    self.title = "Saved Recipes"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  
}

extension SavedViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 1
    if ChefDefault.savedRecipes.count == 0 {
      count = 1
    } else {
      count = ChefDefault.savedRecipes.count
    }
    return count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.primary
    
    switch ChefDefault.savedRecipes.count {
      case 0:
        config.text = "No Search History"
        cell.isUserInteractionEnabled = false
      default:
        config.text = ChefDefault.savedRecipes[indexPath.row].title
    }
    
    cell.contentConfiguration = config
    return cell
  }
}

extension SavedViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch ChefDefault.savedRecipes.count {
      case 0:
        break
      default:
        print(ChefDefault.savedRecipes[indexPath.row])
        let recipeVC = RecipeViewController()
        guard let selectedID = ChefDefault.savedRecipes[indexPath.row].id else { return }
        guard let selectedTitle = ChefDefault.savedRecipes[indexPath.item].title else { return }
        guard let recipeImage = ChefDefault.savedRecipes[indexPath.item].image else { return }
        let img = UIImageView()
        recipeVC.recipeID = selectedID
        recipeVC.recipeTitle = selectedTitle.capitalized
        recipeVC.recipeImage = img.loadImageToPass(url: recipeImage)
        navigationController?.pushViewController(recipeVC, animated: true)
    }
  }
}

