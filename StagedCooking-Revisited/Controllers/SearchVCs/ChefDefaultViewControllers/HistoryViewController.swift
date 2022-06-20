//
//  HistoryViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/13/22.
//

import Foundation
import UIKit

enum HistoryViews: String, CaseIterable {
  case searchHistory = "Search History"
  case viewedRecipes = "Viewed History"
}

class HistoryViewController: UIViewController {
  
  let test = ["One", "Two", "Three"]
  
  let segController: UISegmentedControl = {
    let seg = UISegmentedControl(items: [
      HistoryViews.searchHistory.rawValue.localizedCapitalized,
      HistoryViews.viewedRecipes.rawValue.localizedCapitalized]
    )
    seg.translatesAutoresizingMaskIntoConstraints = false
    seg.tintColor = UIColor.white // not sure what this does
    seg.selectedSegmentTintColor = K.modalBG // color of the tab
    seg.backgroundColor = K.scGreen // background of the segementedController
    seg.selectedSegmentIndex = 0
    return seg
  }()
  
  let tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.backgroundColor = .clear
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Search History"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.dataSource = self
    tableView.delegate = self
    view.backgroundColor = K.primary
    segController.addTarget(self, action: #selector(changeView), for: .valueChanged)
    layout()
    ChefDefault.loadData()
    navigationController?.isToolbarHidden = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.tableView.reloadData()
  }
}

// MARK: - Layout Views
extension HistoryViewController {
  func layout() {
    view.addSubview(segController)
    NSLayoutConstraint.activate([
      segController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      segController.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: segController.trailingAnchor, multiplier: 2)
    ])
    
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalToSystemSpacingBelow: segController.bottomAnchor, multiplier: 2),
      tableView.leadingAnchor.constraint(equalTo: segController.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: segController.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

extension HistoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var count = 0
    switch segController.selectedSegmentIndex {
      case 0:
        count = setSearchHistoryCellCount()
      default:
        count = setViewedHistoryCellCount()
    }
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = UITableViewCell()
    switch segController.selectedSegmentIndex {
      case 0:
        cell = setSearchHistoryCellConfig(indexPath)
      default:
        cell = setViewedHistoryCellConfig(indexPath)
    }
    return cell
  }
}

// MARK: - TableViewDelegate Methods
extension HistoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch segController.selectedSegmentIndex {
      case 0:
        searchFromHistoryList(searched: ChefDefault.searchHistory[indexPath.row])
      default:
        // create an array of all of the keys
        let keysArray = Array(ChefDefault.viewedRecipes.keys)
        // get the indexPath of the key
        let currentIndex = keysArray[indexPath.row]
        showSelectedRecipe(for: Int(currentIndex)!)
    }
  }
  
  // MARK: - Search History Method
  private func searchFromHistoryList(searched: String) {
    let listVC = RecipeListCollectionView()
    listVC.searchedRecipe = searched
    listVC.setLeftBarButton(SourceVCs.searchHistory)
    let navigationController = UINavigationController(rootViewController: listVC)
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .flipHorizontal
    present(navigationController, animated: true)
  }
  
  // MARK: - Viewed History Method
  private func showSelectedRecipe(for recipeID: Int) {
    let recipeVC = RecipeViewController()
    let navigationController = UINavigationController(rootViewController: recipeVC)
    recipeVC.recipeID = recipeID
    recipeVC.setLeftBarButton(ListVCs.history)
    guard let recipeTitle = ChefDefault.viewedRecipes[String(recipeID)] else { return }
    recipeVC.recipeTitle = recipeTitle.capitalized
    navigationController.modalPresentationStyle = .fullScreen
    navigationController.modalTransitionStyle = .flipHorizontal
    present(navigationController, animated: true)
  }
  
  @objc func changeView(_ sender: UISegmentedControl, indexpath: IndexPath) {
    self.tableView.reloadData()
  }
}

extension HistoryViewController {
  func setSearchHistoryCellCount() -> Int {
    var count = Int()
    if ChefDefault.searchHistory.isEmpty {
      count = 1
    } else {
      count = ChefDefault.searchHistory.count
    }
    return count
  }
  
  func setSearchHistoryCellConfig(_ indexpath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexpath)
    var config = cell.defaultContentConfiguration()
    if ChefDefault.searchHistory.isEmpty {
      config.text = "Nope"
    } else {
      config.text = ChefDefault.searchHistory[indexpath.row]
    }
    cell.layer.cornerRadius = 8
    cell.clipsToBounds = true
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.modalBG
    cell.contentConfiguration = config
    return cell
  }
}

extension HistoryViewController {
  func setViewedHistoryCellCount() -> Int {
    self.title = "Viewed History"
    var count = Int()
    if ChefDefault.viewedRecipes.isEmpty {
      count = 1
    } else {
      count = ChefDefault.viewedRecipes.count
    }
    return count
  }
  
  func setViewedHistoryCellConfig(_ indexpath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexpath)
    var config = cell.defaultContentConfiguration()
    if ChefDefault.viewedRecipes.isEmpty {
      config.text = "Nah"
    } else {
      
      // create an array of all of the keys
      let keysArray = Array(ChefDefault.viewedRecipes.keys)
      // get the indexPath of the key
      let currentIndex = keysArray[indexpath.row]
      // unwrap the value using the key at the indexPath
      if let currentRecipe = ChefDefault.viewedRecipes[currentIndex] {
        config.text = currentRecipe
        
      }
    }
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = K.modalBG
    cell.contentConfiguration = config
    return cell
  }
}

