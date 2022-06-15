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
  let acctButton = TextOnlyButton()

  var searched: String? {
    return searchView.searchTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    style()
    layout()
    configureButtonActions()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    searchView.searchTextField.text = ""
    searchView.searchTextField.becomeFirstResponder()
    searchView.errorLabel.isHidden = true
  }
}

extension SearchViewController {
  private func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.tintColor = K.scAccent
    imageView.contentMode = .scaleAspectFit

    searchView.translatesAutoresizingMaskIntoConstraints = false
    
    acctButton.translatesAutoresizingMaskIntoConstraints = false
    acctButton.setTitle("Have an Account or Need One?", for: [])

  }
  
  private func layout() {
    let imageHeight = (view.frame.height / 3 - 48)
    let imageWidth = (view.frame.width / 1.25)
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])
    view.addSubview(searchView)
    NSLayoutConstraint.activate([
      searchView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchView.trailingAnchor, multiplier: 4),
      searchView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
    ])
  }
}

extension SearchViewController {
  // if searchTextField is blank, show error
  private func configureLabel(withMessage message: String) {
    searchView.errorLabel.fadeIn(0.25, delay: 1.0)
    searchView.errorLabel.text = message
    searchView.errorLabel.fadeOut(2.0, delay: 0.0)
  }
}

extension SearchViewController {
  @objc func configureButtonActions() {
    searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .primaryActionTriggered)
    searchView.advancedSearchButton.addTarget(self, action: #selector(advancedButtonTapped), for: .primaryActionTriggered)
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
      let cleansedSearch = searched.unaccent().lowercased()
      listVC.searchedRecipe = cleansedSearch
      
      
      ChefDefault.searchHistory.insert(searched, at: 0)
      ChefDefault.defaults.set(ChefDefault.searchHistory, forKey: "history")
      
      let navigationController = NavController(rootViewController: listVC)
      navigationController.modalTransitionStyle = .flipHorizontal
      navigationController.modalPresentationStyle = .fullScreen
      present(navigationController, animated: true)
    }
  }
  
  @objc func advancedButtonTapped() {
    let advancedVC = AdvancedSearchViewController()
    let navigationController = UINavigationController(rootViewController: advancedVC)
    navigationController.modalTransitionStyle = .flipHorizontal
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true)
  }
}





