//
//  ViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import UIKit

protocol PassingRequest: AnyObject {
  func loadRecipes(for: String)
}

class SearchViewController: UIViewController {
  
  let navigationBar = UINavigationController()
  let imageView = UIImageView()
  let searchView = SearchView()
  var searched: String? {
    return searchView.searchTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(named: "SC-Primary")
    style()
    layout()
    configureButtonActions()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    searchView.searchTextField.text = ""
    searchView.errorLabel.isHidden = true
  }
}

extension SearchViewController {
  private func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "fork.knife.circle")
    imageView.contentMode = .scaleAspectFit
    searchView.translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  private func layout() {
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: 200),
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 10),
      imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
    
    view.addSubview(searchView)
    NSLayoutConstraint.activate([
      searchView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 10),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchView.trailingAnchor, multiplier: 2),
      searchView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
}

extension SearchViewController {
  // if searchTextField is blank, show error
  private func configureLabel(withMessage message: String) {
    searchView.errorLabel.isHidden = false
    searchView.errorLabel.text = message
  }
}

extension SearchViewController {
  @objc func configureButtonActions() {
    searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .primaryActionTriggered)
    
    // MARK: - ChefDefaults Button Actions
    // TODO: - Once it gets close to release time, bring these back into play
//    searchView.searchHistoryButton.addTarget(self, action: #selector(searchHistoryButtonTapped), for: .primaryActionTriggered)
//    searchView.viewedHistoryButton.addTarget(self, action: #selector(viewedHistoryButtonTapped), for: .primaryActionTriggered)
//    searchView.advancedSearchButton.addTarget(self, action: #selector(advancedSearchButtonTapped), for: .primaryActionTriggered)
    
//    if ChefDefault.isLoggedIn == true {
//      searchView.searchHistoryButton.isHidden = false
//      searchView.viewedHistoryButton.isHidden = false
//    } else {
//      searchView.searchHistoryButton.isHidden = true
//      searchView.viewedHistoryButton.isHidden = true
//    }
  }
}

extension SearchViewController {
  @objc func searchButtonTapped(sender: UIButton) {
    let listVC = RecipeListCollectionView()
    guard let searched = searched else {
      assertionFailure("searched shouldn't be nil!")
      return
    }
    if searched.isEmpty {
      configureLabel(withMessage: "Search Field Cannot Be Empty")
      return
    } else {
      listVC.searchedRecipe = searched
      
      // MARK: - ChefDefaults Adds Searched Phrase to ChefDefault.searchHistory Array
      // TODO: - Once it gets close to release time, bring these back into play
//      ChefDefault.searchHistory.insert(searched, at: 0)
//      ChefDefault.defaults.set(ChefDefault.searchHistory, forKey: "history")
//      if let query = searched.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
//        ChefDefault.searched = query
//      }
      let navigationController = UINavigationController(rootViewController: listVC)
      navigationController.modalTransitionStyle = .flipHorizontal
      navigationController.modalPresentationStyle = .fullScreen
      present(navigationController, animated: true)
    }
  }
  
  // MARK: - ChefDefaults Button Methods
  // TODO: - Once it gets close to release time, bring these back into play

//  @objc func searchHistoryButtonTapped(_ sender: UIButton) {
//    let searchHistoryVC = SearchHistoryViewController()
//    let navigationController = UINavigationController(rootViewController: searchHistoryVC)
//    navigationController.modalPresentationStyle = .fullScreen
//    navigationController.modalTransitionStyle = .flipHorizontal
//    present(navigationController, animated: true)
//  }
  
//  @objc func viewedHistoryButtonTapped(_ sender: UIButton) {
//    let viewedHistory = ViewedHistoryViewController()
//    let navigationController = UINavigationController(rootViewController: viewedHistory)
//    navigationController.modalTransitionStyle = .flipHorizontal
//    navigationController.modalPresentationStyle = .fullScreen
//    present(navigationController, animated: true)
//  }
  
//  @objc func advancedSearchButtonTapped(_ sender: UIButton) {
//    let advancedSearch = AdvancedSearchViewController()
//    let navigationController = UINavigationController(rootViewController: advancedSearch)
//    navigationController.modalPresentationStyle = .formSheet
//    present(navigationController, animated: true)
//  }
}


