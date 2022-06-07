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
//    navigationBar.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Advanced", style: .plain, target: self, action: #selector(advancedButtonTapped))
    
    style()
    layout()
    configureButtonActions()
//    let spinner = self.activityIndicator(style: .large, center: self.view.center)
//    self.view.addSubview(spinner)
//    spinner.startAnimating()
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
    
//    view.addSubview(acctButton)
//    NSLayoutConstraint.activate([
//      acctButton.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
//      acctButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor),
//      view.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: acctButton.bottomAnchor, multiplier: 8)
//    ])
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
    self.acctButton.addTarget(self, action: #selector(didTapAcctButton), for: .primaryActionTriggered)
    
    // MARK: - ChefDefaults Button Actions
    // TODO: - Once it gets close to release time, bring these back into play
//    searchView.searchHistoryButton.addTarget(self, action: #selector(searchHistoryButtonTapped), for: .primaryActionTriggered)
//    searchView.viewedHistoryButton.addTarget(self, action: #selector(viewedHistoryButtonTapped), for: .primaryActionTriggered)
    
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
      print("empty")
      configureLabel(withMessage: "Search Field Cannot Be Empty")
      return
    } else {
      listVC.searchedRecipe = searched.unaccent()
      
      // MARK: - ChefDefaults Adds Searched Phrase to ChefDefault.searchHistory Array
      // TODO: - Once it gets close to release time, bring these back into play
//      ChefDefault.searchHistory.insert(searched, at: 0)
//      ChefDefault.defaults.set(ChefDefault.searchHistory, forKey: "history")
//      if let query = searched.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
//        ChefDefault.searched = query
//      }
      
//      let navigationController = GitGuardian(rootViewController: listVC)
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
  
  @objc func didTapAcctButton() {
    let acctVC = LandingViewController()
    let navigationController = NavController(rootViewController: acctVC)
    navigationController.modalTransitionStyle = .flipHorizontal
    navigationController.modalPresentationStyle = .fullScreen
    present(navigationController, animated: true)
  }
}

//extension SearchViewController {
//  private func activityIndicator(style: UIActivityIndicatorView.Style = .large,
//                                 frame: CGRect? = nil,
//                                 center: CGPoint? = nil) -> UIActivityIndicatorView {
//    let spinner = UIActivityIndicatorView(style: style)
//
//    if let frame = frame {
//      spinner.frame = frame
//    }
//    if let center = center {
//      spinner.center = center
//    }
//    return spinner
//  }
//}




