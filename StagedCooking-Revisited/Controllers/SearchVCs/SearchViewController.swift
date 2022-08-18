//
//  ViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import FirebaseAuth
import FirebaseCore
import UIKit

protocol PassingRequest: AnyObject {
  func loadRecipes(for: String)
}

class SearchViewController: UIViewController {
  
  let navigationBar = UINavigationController()
  let imageView = UIImageView()
  let searchView = SearchView()
  let acctButton = TextOnlyButton()
  
  var handle: AuthStateDidChangeListenerHandle?
  var user: User?

  var searched: String? {
    return searchView.searchTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    style()
    layout()
    configureButtonActions()
    setupToolbar()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    handle = Auth.auth().addStateDidChangeListener { _, user in
      guard let user = user else { return }
      self.user = user
    }
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    guard let handle = handle else { return }
    Auth.auth().removeStateDidChangeListener(handle)
    searchView.searchTextField.text = ""
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
    searchView.searchTextField.delegate = self
    
    acctButton.translatesAutoresizingMaskIntoConstraints = false
    acctButton.setTitle("Have an Account or Need One?", for: [])

  }
  
  private func layout() {
    let imageHeight = (view.frame.height / 5 - 48)
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
//      searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      searchView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//      searchView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 4),
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
  func configureButtonActions() {
    searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    searchView.advancedSearchButton.addTarget(self, action: #selector(advancedButtonTapped), for: .touchUpInside)
  }
}

extension SearchViewController {
  @objc func searchButtonTapped() {
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
      listVC.setLeftBarButton(SourceVCs.search)

      ChefDefault.addToSearchHistory(searchTerm: searched)

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

extension SearchViewController {
  func setupToolbar() {

    let bar = UIToolbar()

    //Create a done button with an action to trigger our function to dismiss the keyboard
    let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))

    //Create a felxible space item so that we can add it around in toolbar to position our done button
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

    //Add the created button items in the toobar
    bar.items = [flexSpace, flexSpace, doneButton]
    bar.sizeToFit()

    //Add the toolbar to our textfield
    searchView.searchTextField.inputAccessoryView = bar
  }

  @objc func dismissMyKeyboard(){
    view.endEditing(true)
  }
}

extension SearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if searchView.searchTextField.text != nil {
      textField.resignFirstResponder()
      searchButtonTapped()
      return true
    }
    return false
  }
}


