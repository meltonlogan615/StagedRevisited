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
      
       // May be too many options...
      
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
