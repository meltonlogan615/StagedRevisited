//
//  RecipeListCollectionView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

// MARK: - Notes From Daniel:
// Ability to add filters within this VC
// Add Time to Cook Label
// Add Difficulty Level Label ...?
// If image is missing, remove from list
// Format Title Labels

// TODO: - #27 - Change to Infinite Scrolling

import Foundation
import UIKit

enum SourceVCs: String {
  case search, searchHistory
}

protocol RecipeByID: AnyObject {
  func loadRecipeByID(for chosenID: Int)
}

/**
 Basic `CollectionView`  displays `[Response]`s from network call
 */
class RecipeListCollectionView: UIViewController {
  
  let spinner = SpinnerViewController()
  var dataprovider = DataProvider()

  var model = Response()
  
  var searchedRecipe = String()
  var cellTitle = String()
  var currentCount = Int()
  
  var returnedFilters = String()
  var selectedCuisines = [Cuisine]()
  var selectedDiets = [Diet]()
  var selectedIntolerances = [Intolerance]()
  var selectedMealTypes = [MealType]()
  
  var recipeCollection: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadRecipes(for: searchedRecipe)
    recipeCollection = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
    style()
    layout()
    
    view.backgroundColor = K.primary
    title = searchedRecipe.capitalized
    navigationController?.navigationBar.tintColor = K.scAccent
    
    showSortMenu()
    recipeCollection.register(RecipeCell.self, forCellWithReuseIdentifier: "recipeCell")
    recipeCollection.dataSource = self
    recipeCollection.delegate = self
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    switch returnedFilters.localizedLowercase {
        
      case FilterOptions.cuisines.rawValue.localizedLowercase:
        print("fart")
        
      case FilterOptions.diets.rawValue.localizedLowercase:
        filterDiets(with: selectedDiets, from: model)
        
      case FilterOptions.intolerances.rawValue.localizedLowercase:
        filterIntolerances(with: selectedIntolerances, from: model)

      case FilterOptions.mealTypes.rawValue.localizedLowercase:
        filterMeals(with: selectedMealTypes, from: model)
        
      default:
        break
    }
  }
}

// MARK: - Styling & Layout
extension RecipeListCollectionView {
  func style() {
//    recipeCollection.translatesAutoresizingMaskIntoConstraints = false

    recipeCollection.translatesAutoresizingMaskIntoConstraints = false
    recipeCollection.backgroundColor = K.primary
  }
  
  func layout() {
    view.addSubview(recipeCollection)
    NSLayoutConstraint.activate([
      recipeCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      recipeCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      recipeCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      recipeCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor)
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
    if let recipeResults = model.results {
      if let receipeTitle = recipeResults[indexPath.item].title {
        cellTitle = receipeTitle.capitalized
        cell.titleLabel.text = cellTitle
      }
      if let recipeImage = recipeResults[indexPath.item].image {
        cell.backgroundColor = .clear
        cell.image.loadImage(url: recipeImage)

      }
    }
    return cell
  }
}

// MARK: - CollectionView - Delegate / DidSelectItemAt
extension RecipeListCollectionView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let recipeVC = RecipeViewController()
    
    guard let selectedID = model.results?[indexPath.item].id else { return }
    guard let selectedTitle = model.results?[indexPath.item].title else { return }
    guard let recipeImage = model.results?[indexPath.item].image else { return }
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
//extension RecipeListCollectionView: UICollectionViewDelegateFlowLayout {
//  private enum LayoutConstant {
//    static let spacing = CGFloat(4)
//    static let itemHeight = CGFloat(150)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
//    return CGSize(width: width, height: LayoutConstant.itemHeight)
//  }
//
//  func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
//    let itemsInRow = 1.0
//    let totalSpacing = CGFloat(2.0 * spacing + (itemsInRow - 1.0) * spacing)
//    let finalWidth = (width - totalSpacing) / itemsInRow
//    return finalWidth - 5.0
//  }
//}

extension RecipeListCollectionView {
  func createCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { _,_ in
      return self.createGroup()
    }
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 20
    layout.configuration = config
    return layout
  }
  
  func createGroup() -> NSCollectionLayoutSection {
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(160))
    
    let largeGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(320))
    
    let mediumStackGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
    
    let sectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(640))
    
    let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    let tallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
    let mediumItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
    let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
    
    let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
    let tallItem = NSCollectionLayoutItem(layoutSize: tallItemSize)
    let mediumItem = NSCollectionLayoutItem(layoutSize: mediumItemSize)
    let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
    
    let groupOne = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [largeItem])
    let groupTwo = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [smallItem])
    let largeGroupOne = NSCollectionLayoutGroup.vertical(layoutSize: largeGroupSize, subitems: [groupOne, groupTwo])
    
    let groupThree = NSCollectionLayoutGroup.vertical(layoutSize: mediumStackGroupSize, subitems: [mediumItem])
    let largeGroupTwo = NSCollectionLayoutGroup.horizontal(layoutSize: largeGroupSize, subitems: [groupThree, tallItem])

    let largeGroupThree = NSCollectionLayoutGroup.horizontal(layoutSize: largeGroupSize, subitems: [tallItem, groupThree])
    
    let sectionAssembly = NSCollectionLayoutGroup.vertical(layoutSize: sectionSize, subitems:   [
      largeGroupOne,
      largeGroupTwo,
      largeGroupOne,
      largeGroupThree
    ])
    
    let section = NSCollectionLayoutSection(group: sectionAssembly)
    return section
    
  }
}

// MARK: - Networking, Spoonacular ComplexSearch
extension RecipeListCollectionView {
  // MARK: - Regular Search
  func loadRecipes(for recipe: String) {
    showActivity()
    dataprovider.getRecipes(for: recipe) { [weak self] (foodResult: Result<Response, Error>) in
      guard let self = self else { return }
      self.removeActivity()
      switch foodResult {
        case .success(let model):
          self.model = model as Response
          
          // if there are no results for the searched phrase, display alert
          self.noResults(for: recipe)
          
          // total number of results
          guard let totalCount = self.model.results?.count else { return }
          self.currentCount = totalCount
          
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
      let nothingAlert = UIAlertController(title: "No results found for \"\(recipe)\"", message: "Please check your spelling or try searching again.", preferredStyle: .alert)
      let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { _ in
        self.dismiss(animated: true)
      }
      nothingAlert.addAction(dismissAction)
      present(nothingAlert, animated: true)
    }
  }
}

// MARK: - Activity Indicator - Show & Remove
extension RecipeListCollectionView {
  func showActivity() {
    addChild(spinner)
//    recipeCollection.isHidden = true
    spinner.view.frame = view.frame
    view.addSubview(spinner.view)
  }
  
  func removeActivity() {
    spinner.willMove(toParent: nil)
    recipeCollection.isHidden = false
    spinner.view.removeFromSuperview()
    spinner.removeFromParent()
  }
}

// MARK: - LeftBarButton Setup
extension RecipeListCollectionView {
  func setLeftBarButton(_ sender: SourceVCs) {
    switch sender {
      case .search:
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(dismissView))
      case .searchHistory:
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search History", style: .plain, target: self, action: #selector(dismissView))
    }
  }
}









