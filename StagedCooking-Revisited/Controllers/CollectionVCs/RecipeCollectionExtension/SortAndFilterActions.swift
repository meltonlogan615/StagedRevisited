//
//  SortAndFilterActions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/9/22.
//

import Foundation
import UIKit

//protocol Filterable {
//  func filterCuisines(for options: [String])
////  func filterDiets(for options: [String])
//  func filterIntolerances(for options: [String])
//  func filterMealTypes(for options: [String])
//}

enum SortOptions: String {
  case nameAscending = "Name: A → Z"
  case nameDecending = "Name: Z → A"
  case totalTimeUp = "Cook Time: Low → High"
  case totalTimeDown = "Cook Time: High → Low"
  case calsUp = "Calories: Low → High"
  case calsDown = "Calories: High → Low"
  case fatUp = "Fat: Low → High"
  case fatDown = "Fat: High → Low"
  case proteinUp = "Protein: Low → High"
  case proteinDown = "Protein: High → Low"
}

enum FilterOptions: String {
  case cuisines, diets, intolerances, macros
  case mealTypes = "Meal Types"
}

extension RecipeListCollectionView {
  func sortMenu() {
    // MARK: - Alphabetically Ascending from A to Z
    let menu = UIMenu(title: "Sort By:", image: nil, identifier: nil, options: .singleSelection, children: [
      
      UIAction(title: SortOptions.nameAscending.rawValue.localizedCapitalized, image: UIImage(systemName: "a.square"), identifier: nil, discoverabilityTitle: nil) { (_) in
        self.model.results = self.model.results?.sorted(by: <)
        self.recipeCollection.reloadData()
      },
      
      // MARK: - Alphabetically Descending from Z to A
      UIAction(title: SortOptions.nameDecending.rawValue.localizedCapitalized, image: UIImage(systemName: "z.square"), identifier: nil, discoverabilityTitle: nil) { (_) in
        self.model.results = self.model.results?.sorted(by: >)
        self.recipeCollection.reloadData()
      },
      
      // MARK: - Time Descending from Lowest to Highest
      UIAction(title: SortOptions.totalTimeUp.rawValue.localizedCapitalized, image: UIImage(systemName: "clock"), identifier: nil, discoverabilityTitle: nil) { (_) in
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
      UIAction(title: SortOptions.totalTimeDown.rawValue.localizedCapitalized, image: UIImage(systemName: "clock"), identifier: nil, discoverabilityTitle: nil) { _ in
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
      
      // MARK: - Calories Descending from Lowest to Highest
      UIAction(title: SortOptions.calsUp.rawValue.localizedCapitalized, image: UIImage(systemName: "bolt"), identifier: nil, discoverabilityTitle: nil) { _ in
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
      
      // MARK: - Calories Descending from Highest to Lowest
      UIAction(title: SortOptions.calsDown.rawValue.localizedCapitalized, image: UIImage(systemName: "bolt"), identifier: nil, discoverabilityTitle: nil) { _ in
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
      
      // MARK: - Fat Descending from Lowest to Highest
      UIAction(title: SortOptions.fatUp.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { _ in
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
      
      // MARK: - Fat Descending from Highest to Lowest
      UIAction(title: SortOptions.fatDown.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) { _ in
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
    ])
    
    let filter = UIMenu(title: "Filter By:", image: nil, identifier: nil, options: .singleSelection, children: [
      
      UIAction(title: FilterOptions.cuisines.rawValue.localizedCapitalized, image: UIImage(systemName: "globe.europe.africa"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = FilterViewController()
        filterView.viewTitle = FilterOptions.cuisines.rawValue.localizedCapitalized
        filterView.optionView.layoutCuisines()
//        filterView.model = self.model
        self.present(filterView, animated: true)
      },
      
      UIAction(title: FilterOptions.diets.rawValue.localizedCapitalized, image: UIImage(systemName: "scalemass"), identifier: nil, discoverabilityTitle: nil) { _ in
        let filterView = FilterViewController()
        filterView.viewTitle = FilterOptions.diets.rawValue.localizedCapitalized
        filterView.optionView.layoutDiets()
        filterView.searchedRecipe = self.searchedRecipe
//        filterView.model = self.model
        self.present(filterView, animated: true)
      },
      
      UIAction(title: FilterOptions.intolerances.rawValue.localizedCapitalized, image: UIImage(systemName: "hand.raised.slash"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = FilterViewController()
        filterView.viewTitle = FilterOptions.intolerances.rawValue.localizedCapitalized
        filterView.optionView.layoutIntolerances()
//        filterView.model = self.model
        self.present(filterView, animated: true)
      },
      
      UIAction(title: FilterOptions.macros.rawValue.localizedCapitalized, image: UIImage(systemName: "atom"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = MacrosViewController()
        filterView.viewTitle = FilterOptions.macros.rawValue.localizedCapitalized
        filterView.searchedRecipe = self.searchedRecipe
        self.present(filterView, animated: true)
      },
      
      UIAction(title: FilterOptions.mealTypes.rawValue.localizedCapitalized, image: UIImage(systemName: "checklist"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = FilterViewController()
        filterView.viewTitle = FilterOptions.mealTypes.rawValue.localizedCapitalized
        filterView.optionView.layoutMealTypes()
//        filterView.model = self.model
        self.present(filterView, animated: true)
      }
    ])
    
    self.navigationItem.rightBarButtonItems = [
      UIBarButtonItem(title: "Filter", image: nil, primaryAction: .none, menu: filter),
      UIBarButtonItem(title: "Sort", image: nil, primaryAction: .none, menu: menu)
    ]
  }
}
//
//extension RecipeListCollectionView: Filterable {
//  
//  
//  func filterCuisines(for options: [String]) {
//    var newModel = Response()
//    var newResults = [Recipe]()
//    guard let recipes = model.results else { return }
//    for recipe in recipes {
//      guard let cuisines = recipe.cuisines else { return }
//      for cuisine in cuisines {
//        if options.contains(cuisine) {
//          newResults.append(recipe)
//          newModel.results = newResults
//          self.model = newModel
//        }
//      }
//    }
//  }
//  
////  func filterDiets(for selections: [String], with list: Response) {
////    var mutableList = list
////    var newResults = [Recipe]()
////    print(selections)
//////    guard let recipes = self.model.results else { return }
////    if let recipes = mutableList.results {
////      for recipe in recipes {
////        guard let diets = recipe.diets else { return }
////// convert [Diet] into [String] before matching
////        let dietStrings: [String] = {
////          var test = [String]()
////          for diet in diets {
////            test.append(diet.rawValue)
////          }
////          return test
////        }()
////        if Set(dietStrings).isSubset(of: Set(selections)) {
////          newResults.append(recipe)
////          print(recipe.title)
////        }
////      }
////    }
////    if !newResults.isEmpty {
////      mutableList.results = newResults
////      self.model = mutableList
////      print(String(describing: self.model.results?.count))
////    }
////    self.recipeCollection.reloadData()
////    print(String(describing: self.model.results?.count))
////  } // End Filter By Diets
//  
//  func filterIntolerances(for options: [String]) {
//    var newModel = Response()
//    var newResults = [Recipe]()
//    guard let recipes = model.results else { return }
//    for recipe in recipes {
//      guard let allergens = recipe.intolerances else { return }
//      for allergen in allergens {
//        if options.contains(allergen.rawValue) {
//          newResults.append(recipe)
//          newModel.results = newResults
//          self.model = newModel
//        
//        }
//      }
//    }
//  }
//  
//  func filterMacros(_ options: [String: Int], by: String) {
//    guard let recipes = model.results else { return }
//    for recipe in recipes {
//      print(recipe)
//    }
//  }
//  
//  func filterMealTypes(for options: [String]) {
//    var newModel = Response()
//    var newResults = [Recipe]()
//    guard let recipes = model.results else { return }
//    for recipe in recipes {
//      guard let dishTypes = recipe.dishTypes else { return }
//      for dishType in dishTypes {
//        if options.contains(dishType.rawValue) {
//          newResults.append(recipe)
//          newModel.results = newResults
//          self.model = newModel
//        }
//      }
//    }
//    self.recipeCollection.reloadData()
//  }
//  
//}// End of Extension
