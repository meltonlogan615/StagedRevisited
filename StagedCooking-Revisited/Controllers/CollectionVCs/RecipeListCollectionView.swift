//
//  RecipeListCollectionView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

// MARK: - Notes From Daniel:
// Ability to add filters
// Add Time to Cook Label
// Add Difficulty Level Label
// If image is missing, remove from list
// Format Title Labels

// TODO: - Activity Indicator when loading information

import Foundation
import UIKit

protocol RecipeByID: AnyObject {
  func loadRecipeByID(for chosenID: Int)
}

class RecipeListCollectionView: UIViewController {
  
  var dataprovider = DataProvider()
  var model = Response()
  
  var searchedRecipe = String()
  var leftBarButtonText = String()
  
  private let recipeCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    var recipeCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    recipeCollection.backgroundColor = K.primary
    recipeCollection.layer.zPosition = 10
    return recipeCollection
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    
    loadRecipes(for: searchedRecipe)
    recipeCollection.register(RecipeCell.self, forCellWithReuseIdentifier: "recipeCell")
    recipeCollection.dataSource = self
    recipeCollection.delegate = self
    
    title = searchedRecipe.capitalized
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(dismissView))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter Results", style: .plain, target: self, action: #selector(filterResults))
    
    style()
    layout()
  }
}
// MARK: - Styling & Layout
extension RecipeListCollectionView {
  func style() {
    recipeCollection.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(recipeCollection)
    NSLayoutConstraint.activate([
      recipeCollection.topAnchor.constraint(equalTo: view.topAnchor),
      recipeCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      recipeCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      recipeCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
    ])
  }
}

// MARK: - CollectionView - DataSource
extension RecipeListCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let cellCount = model.results?.count  else { return 1 }
    return cellCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as! RecipeCell
    if let recipeItems = model.results {
      if let receipeTitle = recipeItems[indexPath.row].title {
        cell.titleLabel.text = receipeTitle.capitalized
      }
      if let recipeImage = recipeItems[indexPath.row].image {
        cell.image.loadImage(url: recipeImage)
        cell.image.layer.cornerRadius = 8
        cell.image.clipsToBounds = true
      }
    }
    return cell
  }
}

// MARK: - CollectionView - Delegate
extension RecipeListCollectionView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let recipeVC = RecipeViewController()
    guard let selectedID = model.results?[indexPath.row].id else { return }
    guard let selectedTitle = model.results?[indexPath.row].title else { return }
    recipeVC.recipeID = selectedID
    recipeVC.recipeTitle = selectedTitle.capitalized

    
    // MARK: - ChefDefaults Button Actions
    // TODO: - Once it gets close to release time, bring these back into play
    //    ChefDefault.requestedID = selectedID - Used later along with UserDefaults
    navigationController?.pushViewController(recipeVC, animated: true)
  }
}

// MARK: - CollectionView - Flow Layout & Cell Sizing
extension RecipeListCollectionView: UICollectionViewDelegateFlowLayout {
  private enum LayoutConstant {
    static let spacing = CGFloat(4)
    static let itemHeight = CGFloat(150)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
    return CGSize(width: width, height: LayoutConstant.itemHeight)
  }
  
  func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
    let itemsInRow = 1.0
    let totalSpacing = CGFloat(2.0 * spacing + (itemsInRow - 1.0) * spacing)
    let finalWidth = (width - totalSpacing) / itemsInRow
    return finalWidth - 5.0
  }
}

// MARK: - Networking, Spoonacular ComplexSearch
extension RecipeListCollectionView {
  func loadRecipes(for recipe: String) {
    dataprovider.getRecipes(for: recipe) { [weak self] (foodResult: Result<Response, Error>) in
      guard let self = self else { return }
      switch foodResult {
        case .success(let model):
          self.model = model as Response
          guard let results = self.model.results else { return }
          
          // if there are no results for the searched phrase, display alert
          self.noResults(for: recipe)
          
          for result in results {
            // MARK: - Text Labels
            guard let receipe = result.title else { return }
            self.searchedRecipe = receipe
          }
        case .failure(let error):
          print(error)
      }
      self.recipeCollection.reloadData()
    }
  }
}

// MARK: - No Results Alert
extension RecipeListCollectionView {
  func noResults(for recipe: String) {
    guard let results = self.model.results else { return }
    if results.isEmpty {
      print("No results found for \(recipe)")
      let nothingAlert = UIAlertController(title: "No results found for \"\(recipe)\"", message: "Please check your spelling or try searching again.", preferredStyle: .alert)
      let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { _ in
        self.dismiss(animated: true)
      }
      nothingAlert.addAction(dismissAction)
      present(nothingAlert, animated: true)
    }
  }
}

// MARK: - Filter Results
extension RecipeListCollectionView {
  @objc func filterResults() {
    let filterVC = AdvancedSearchViewController()
//    show(filterVC, sender: self)
    present(filterVC, animated: true)
  }
}




