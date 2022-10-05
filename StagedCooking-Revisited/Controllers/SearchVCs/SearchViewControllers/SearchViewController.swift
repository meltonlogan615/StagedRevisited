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
  
  let spinner = SpinnerViewController()
  var dataprovider = DataProvider()

  let imageView = UIImageView()
  let searchView = SearchView()
  var suggestions = Response()
  
  let collection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.layer.zPosition = 10
    return collection
  }()

  var searched: String? {
    return searchView.searchTextField.text
  }

  var handle: AuthStateDidChangeListenerHandle?
  var user: User?

  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    style()
    layout()
    configureButtonActions()
    searchView.searchTextField.inputAccessoryView = setupToolbar()
    collection.register(SuggestionCell.self, forCellWithReuseIdentifier: "suggestionCell")
    collection.dataSource = self
    collection.delegate = self
    getRandomSuggestions()
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
    
    collection.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func layout() {
    let imageHeight = (view.frame.height / 5 - 48)
    let imageWidth = (view.frame.width / 2)

    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])
    
    view.addSubview(searchView)
    NSLayoutConstraint.activate([

      searchView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
      searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: searchView.trailingAnchor, multiplier: 2),
      searchView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
    ])
    
    view.addSubview(collection)
    NSLayoutConstraint.activate([
      collection.topAnchor.constraint(equalToSystemSpacingBelow: searchView.bottomAnchor, multiplier: 5),
      collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

// MARK: - Fade In / Fade Out Error Message
extension SearchViewController {
  // if searchTextField is blank, show error
  private func configureLabel(withMessage message: String) {
    searchView.errorLabel.fadeIn(0.25, delay: 1.0)
    searchView.errorLabel.text = message
    searchView.errorLabel.fadeOut(2.0, delay: 0.0)
  }
}

// MARK: - Button Setup
extension SearchViewController {
  func configureButtonActions() {
    searchView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    searchView.advancedSearchButton.addTarget(self, action: #selector(advancedButtonTapped), for: .touchUpInside)
  }
}

// MARK: - Button Actions
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

// MARK: - TextFieldDelegate
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

// MARK: - CollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let cellCount = suggestions.recipes?.count else { return 1 }
    return cellCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "suggestionCell", for: indexPath) as! SuggestionCell
    if let recipes = suggestions.recipes {
      if let title = recipes[indexPath.item].title {
        cell.titleLabel.text = title
      }
      if let image = recipes[indexPath.item].image {
        cell.image.loadImage(url: image)
      } else if recipes[indexPath.item].image == nil {
        // do something so it will not show up in the list. Will need to be part of the larger data validation process.
      }
    }
    return cell
  }
}

extension SearchViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let recipeVC = RecipeViewController()
    
    guard let selectedID = suggestions.recipes?[indexPath.item].id else { return }
    guard let selectedTitle = suggestions.recipes?[indexPath.item].title else { return }
    guard let recipeImage = suggestions.recipes?[indexPath.item].image else { return }
    let img = UIImageView()
    
    recipeVC.recipeID = selectedID
    recipeVC.recipeTitle = selectedTitle.capitalized
    recipeVC.recipeImage = img.loadImageToPass(url: recipeImage)
    recipeVC.setLeftBarButton(.collection)
    
    ChefDefault.addToViewed(recipeID: String(selectedID), recipeTitle: selectedTitle)
    
    let navController = NavController(rootViewController: recipeVC)
    navController.modalPresentationStyle = .fullScreen
    present(navController, animated: true)
  }
}

// MARK: - CollectionView - Flow Layout & Cell Sizing
extension SearchViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: searchView.frame.width, height: CGFloat(96))
  }
}

// MARK: - CollectionView - Network Call
extension SearchViewController {
  private func getRandomSuggestions() {
    showActivity()
    dataprovider.getRandomRecipes() { [weak self] (randomResult: Result<Response, Error>) in
      guard let self = self else { return }
      self.removeActivity()
      switch randomResult {
        case .success(let model):
          self.suggestions = model as Response
        case .failure(let error):
          print(String(describing: error))
      }
      self.collection.reloadData()
    }
  }
}

// MARK: - Activity View
extension SearchViewController {
  func showActivity() {
    addChild(spinner)
    collection.isHidden = true
    spinner.view.frame = view.frame
    view.addSubview(spinner.view)
  }
  
  func removeActivity() {
    spinner.willMove(toParent: nil)
    collection.isHidden = false
    spinner.view.removeFromSuperview()
    spinner.removeFromParent()
  }
}
