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

// TODO: - Activity Indicator when loading information
// TODO: - #27 - Change to Infinite Scrolling

import Foundation
import UIKit
import CoreMIDI

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
//  var menu = UIMenu()
  
  let recipeCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    var recipeCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    recipeCollection.backgroundColor = K.primary
    recipeCollection.layer.zPosition = 10
    return recipeCollection
  }()
  
//  override func viewWillAppear(_ animated: Bool) {
//    menu = self.generateMenu()
//  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadRecipes(for: searchedRecipe)
    
    view.backgroundColor = K.primary
    title = searchedRecipe.capitalized
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(dismissView))
    sortMenu()
    
    recipeCollection.register(RecipeCell.self, forCellWithReuseIdentifier: "recipeCell")
    recipeCollection.dataSource = self
    recipeCollection.delegate = self

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
    if let recipeResults = model.results {
      if let receipeTitle = recipeResults[indexPath.item].title {
        cell.titleLabel.text = receipeTitle.capitalized
      }
      if let recipeImage = recipeResults[indexPath.item].image {
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
    guard let selectedID = model.results?[indexPath.item].id else { return }
    guard let selectedTitle = model.results?[indexPath.item].title else { return }
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
          guard let totalCount = self.model.totalResults else { return }
          self.title = "\(self.searchedRecipe) (\(totalCount))"
          
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

extension RecipeListCollectionView {
  func showActivity() {
    addChild(spinner)
    recipeCollection.isHidden = true
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

// MARK: - Filter Results
// TODO: - #14 - This ⬇️
extension RecipeListCollectionView {
  @objc func sortResultsBy() {
    
  }
  
  @objc func filterResults() {
    let filterVC = AdvancedSearchViewController()
    //    show(filterVC, sender: self)
    present(filterVC, animated: true)
  }
}

extension RecipeListCollectionView {
  private enum SortOptions: String {
    case nameAscending = "Name: A → Z"
    case nameDecending = "Name: Z → A"
    case totalTimeUp = "Cook Time: Low → High"
    case totalTimeDown = "Cook Time: Hight → Low"
    case calsUp = "Calories: Low → High"
    case calsDown = "Calories: High → Low"
    case fatUp = "Fat: Low → High"
    case fatDown = "Fat: High → Low"
    case proteinUp = "Protein: Low → High"
    case proteinDown = "Protein: High → Low"
  }
  
  func sortMenu() {
    // MARK: - Alphabetically Ascending from A to Z
    let menu = UIMenu(title: "Sort By:", image: nil, identifier: nil, options: .singleSelection, children: [
      UIAction(title: SortOptions.nameAscending.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
        self.model.results = self.model.results?.sorted(by: <)
        self.recipeCollection.reloadData()
      },
      
      // MARK: - Alphabetically Descending from Z to A
      UIAction(title: SortOptions.nameDecending.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
        self.model.results = self.model.results?.sorted(by: >)
        self.recipeCollection.reloadData()
      },
      
      // MARK: - Time Descending from Lowest to Highest
      UIAction(title: SortOptions.totalTimeUp.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
        guard let timeSorter = self.model.results else { return }
        let sorted = timeSorter.sorted { (lhs, rhs) -> Bool in
          var returnBool = Bool()
          if let lefty = lhs.readyInMinutes {
            if let righty = rhs.readyInMinutes {
              returnBool = lefty < righty
            }
          }
          return returnBool
        }
        self.model.results = sorted
        self.recipeCollection.reloadData()
      },
      
      // MARK: - Time Descending from Highest to Lowest
      UIAction(title: SortOptions.totalTimeDown.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
        guard let timeSorter = self.model.results else { return }
        let sorted = timeSorter.sorted { (lhs, rhs) -> Bool in
          var returnBool = Bool()
          if let lefty = lhs.readyInMinutes {
            if let righty = rhs.readyInMinutes {
              returnBool = lefty > righty
            }
          }
          return returnBool
        }
        self.model.results = sorted
        self.recipeCollection.reloadData()
      },
      
      UIAction(title: SortOptions.calsUp.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { _ in
        guard let calSorter = self.model.results else { return }
        let sorted = calSorter.sorted { (lhs, rhs) -> Bool in
          var returnBool = Bool()
          if let leftFlavs = lhs.nutrition?.nutrients {
            if let rightFlavs = rhs.nutrition?.nutrients {
              for lefty in leftFlavs {
                for righty in rightFlavs {
                  if lefty.unit == "kcal" && righty.unit == "kcal" {
                    if let left = lefty.amount, let right = righty.amount {
                      returnBool = left < right
                    }
                  }
                }
              }
            }
          }
          return returnBool
        }
        self.model.results = sorted
        self.recipeCollection.reloadData()
      },
      
      UIAction(title: SortOptions.calsDown.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
        guard let calSorter = self.model.results else { return }
        let sorted = calSorter.sorted { (lhs, rhs) -> Bool in
          var returnBool = Bool()
          if let leftFlavs = lhs.nutrition?.nutrients {
            if let rightFlavs = rhs.nutrition?.nutrients {
              for lefty in leftFlavs {
                for righty in rightFlavs {
                  if lefty.unit == "kcal" && righty.unit == "kcal" {
                    if let left = lefty.amount, let right = righty.amount {
                      returnBool = left > right
                    }
                  }
                }
              }
            }
          }
          return returnBool
        }
        self.model.results = sorted
        self.recipeCollection.reloadData()
      },

      UIAction(title: SortOptions.fatUp.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
        guard let calSorter = self.model.results else { return }
        let sorted = calSorter.sorted { (lhs, rhs) -> Bool in
          var returnBool = Bool()
          if let leftFlavs = lhs.nutrition?.nutrients {
            if let rightFlavs = rhs.nutrition?.nutrients {
              for lefty in leftFlavs {
                for righty in rightFlavs {
                  if lefty.name?.lowercased() == "fat" && righty.name?.lowercased() == "fat" {
                    if let left = lefty.amount, let right = righty.amount {
                      returnBool = left < right
                    }
                  }
                }
              }
            }
          }
          return returnBool
        }
        self.model.results = sorted
        self.recipeCollection.reloadData()
      },
      UIAction(title: SortOptions.fatDown.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
        guard let calSorter = self.model.results else { return }
        let sorted = calSorter.sorted { (lhs, rhs) -> Bool in
          var returnBool = Bool()
          if let leftFlavs = lhs.nutrition?.nutrients {
            if let rightFlavs = rhs.nutrition?.nutrients {
              for lefty in leftFlavs {
                for righty in rightFlavs {
                  if lefty.name?.lowercased() == "fat" && righty.name?.lowercased() == "fat" {
                    if let left = lefty.amount, let right = righty.amount {
                      returnBool = left > right
                    }
                  }
                }
              }
            }
          }
          return returnBool
        }
        self.model.results = sorted
        self.recipeCollection.reloadData()

      },
//      UIAction(title: SortOptions.proteinUp.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
//        print("poop")
//      },
//      UIAction(title: SortOptions.proteinDown.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { (_) in
//        print("poop")
//      },
      
    ])
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", image: nil, primaryAction: .none, menu: menu)
  }
  
}






