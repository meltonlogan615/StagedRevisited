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
      
      /// Existis in Docs, but rarely showing up in any of the results
//      UIAction(title: FilterOptions.cuisines.rawValue.localizedCapitalized, image: UIImage(systemName: "globe.europe.africa"), identifier: nil, discoverabilityTitle: nil) {_ in
//        let filterView = FilterViewController()
//        filterView.sourceView = self
//        filterView.modalPresentationStyle = .fullScreen
//        filterView.viewTitle = FilterOptions.cuisines.rawValue.localizedCapitalized
//        filterView.optionView.layoutCuisines()
//        self.present(filterView, animated: true)
//      },

      UIAction(title: FilterOptions.diets.rawValue.localizedCapitalized, image: UIImage(systemName: "scalemass"), identifier: nil, discoverabilityTitle: nil) { _ in
        let filterView = FilterViewController()
        filterView.sourceView = self
        filterView.modalPresentationStyle = .fullScreen
        filterView.viewTitle = FilterOptions.diets.rawValue.localizedCapitalized
        filterView.optionView.layoutDiets()
        self.present(filterView, animated: true)
      },
      
      /// Existis in Docs, but not showing up in any of the results
//      UIAction(title: FilterOptions.intolerances.rawValue.localizedCapitalized, image: UIImage(systemName: "hand.raised.slash"), identifier: nil, discoverabilityTitle: nil) {_ in
//        let filterView = FilterViewController()
//        filterView.sourceView = self
//        filterView.modalPresentationStyle = .fullScreen
//        filterView.viewTitle = FilterOptions.intolerances.rawValue.localizedCapitalized
//        filterView.optionView.layoutIntolerances()
////        filterView.model = self.model
//        self.present(filterView, animated: true)
//      },
      
//      UIAction(title: FilterOptions.macros.rawValue.localizedCapitalized, image: UIImage(systemName: "atom"), identifier: nil, discoverabilityTitle: nil) {_ in
//        let filterView = MacrosViewController()
//        filterView.sourceView = self
//        filterView.modalPresentationStyle = .fullScreen
//        filterView.viewTitle = FilterOptions.macros.rawValue.localizedCapitalized
//        filterView.searchedRecipe = self.searchedRecipe
//        self.present(filterView, animated: true)
//      },
      
      UIAction(title: FilterOptions.mealTypes.rawValue.localizedCapitalized, image: UIImage(systemName: "checklist"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = FilterViewController()
        filterView.sourceView = self
        filterView.modalPresentationStyle = .fullScreen
        filterView.viewTitle = FilterOptions.mealTypes.rawValue.localizedCapitalized
        filterView.optionView.layoutMealTypes()
        self.present(filterView, animated: true)
      }
    ])
    
    self.navigationItem.rightBarButtonItems = [
      UIBarButtonItem(title: "Filter", image: nil, primaryAction: .none, menu: filter),
      UIBarButtonItem(title: "Sort", image: nil, primaryAction: .none, menu: menu)
    ]
  }
}
