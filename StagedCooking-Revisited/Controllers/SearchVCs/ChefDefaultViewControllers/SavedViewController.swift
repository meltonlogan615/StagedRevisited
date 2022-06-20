//
//  SavedViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Foundation
import UIKit

class SavedViewController: UIViewController {
  
  let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.backgroundColor = .clear
    return table
  }()
  
  override func viewWillAppear(_ animated: Bool) {
    self.tableView.reloadData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    self.title = "Saved Recipes"
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    layout()
  }
}

extension SavedViewController {
  func layout() {
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 2),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension SavedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 1
    if ChefDefault.savedRecipes.count == 0 {
      count = 1
    } else {
      count = ChefDefault.savedRecipes.count
    }
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var config = cell.defaultContentConfiguration()
    if ChefDefault.savedRecipes.isEmpty {
      config.text = "No Saved Recipes"
    } else {
      // create an array of all of the keys
      let keysArray = Array(ChefDefault.savedRecipes.keys)
      // get the indexPath of the key
      let currentIndex = keysArray[indexPath.row]
      // unwrap the value using the key at the indexPath
      if let currentRecipe = ChefDefault.savedRecipes[currentIndex] {
        config.text = currentRecipe
        
      }
    }
    cell.layer.cornerRadius = 8
    cell.clipsToBounds = true
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.modalBG
    cell.contentConfiguration = config
    return cell
  }
}

extension SavedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // create an array of all of the keys
    let keysArray = Array(ChefDefault.savedRecipes.keys)
    // get the indexPath of the key
    let currentIndex = keysArray[indexPath.row]
    showSelectedRecipe(for: Int(currentIndex)!)
  }
  
  private func showSelectedRecipe(for recipeID: Int) {
    let recipeVC = RecipeViewController()
    let navigationController = UINavigationController(rootViewController: recipeVC)
    recipeVC.recipeID = recipeID
    recipeVC.setLeftBarButton(ListVCs.history)
    guard let recipeTitle = ChefDefault.savedRecipes[String(recipeID)] else { return }
    recipeVC.recipeTitle = recipeTitle.capitalized
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .flipHorizontal
    present(navigationController, animated: true)
  }
}

