//
//  SortActions.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/9/22.
//

import Foundation
import UIKit

extension RecipeListCollectionView {
  private enum SortOptions: String {
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
  private enum FilterOptions: String {
    case cuisines, diets, intolerances, macros
    case mealTypes = "Meal Types"
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
      
      // MARK: - Calories Descending from Lowest to Highest
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
      
      // MARK: - Calories Descending from Highest to Lowest
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
      
      // MARK: - Fat Descending from Lowest to Highest
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
      
      // MARK: - Fat Descending from Highest to Lowest
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
    ])
    let filter = UIMenu(title: "Filter By:", image: nil, identifier: nil, options: .singleSelection, children: [
      UIAction(title: FilterOptions.cuisines.rawValue.localizedCapitalized, image: nil, identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = OptionViewController()
        filterView.optionView = CuisinesView()
        filterView.viewTitle = "Cuisines"
        filterView.sourceVC = self
        self.present(filterView, animated: true)
      },
      UIAction(title: FilterOptions.diets.rawValue.localizedCapitalized, image: UIImage(systemName: "chevron.right"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = OptionViewController()
        filterView.optionView = DietsView()
        filterView.viewTitle = "Diets"
        filterView.sourceVC = self
        self.present(filterView, animated: true)
      },
      UIAction(title: FilterOptions.intolerances.rawValue.localizedCapitalized, image: UIImage(systemName: "chevron.right"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = OptionViewController()
        filterView.optionView = IntolerancesView()
        filterView.viewTitle = "Diets"
        filterView.sourceVC = self
        self.present(filterView, animated: true)
      },
      UIAction(title: FilterOptions.macros.rawValue.localizedCapitalized, image: UIImage(systemName: "chevron.right"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = MacrosViewController()
        filterView.viewTitle = "Macronutrients"
        self.present(filterView, animated: true)
      },
      
      UIAction(title: FilterOptions.mealTypes.rawValue.localizedCapitalized, image: UIImage(systemName: "chevron.right"), identifier: nil, discoverabilityTitle: nil) {_ in
        let filterView = OptionViewController()
        filterView.optionView = MealTypesView()
        filterView.viewTitle = "Diets"
        filterView.sourceVC = self
        self.present(filterView, animated: true)
      }
    ])
    
    
    
    self.navigationItem.rightBarButtonItems = [
      UIBarButtonItem(title: "Filter", image: nil, primaryAction: .none, menu: filter),
      UIBarButtonItem(title: "Sort", image: nil, primaryAction: .none, menu: menu)
    ]
  }
  
}
