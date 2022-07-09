//
//  OptionViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/29/22.
//

import UIKit
import SwiftUI

protocol Filterable: AnyObject {
   func filterRecipes(for recipe: String, with options: String)
//  func filterCuisines(for options: [String])
//  func filterDiets(for options: [String], with list: Response)
//  func filterIntolerances(for options: [String])
//  func filterMealTypes(for options: [String])
}

/**
 Generic `OptionViewController`. Will recieve the view based on the `didSelectItemAt` method in `AdvancedSearchViewController`.
 
 
 */
class FilterViewController: UIViewController {
  
  
  let optionLabel = UILabel()
  var viewTitle = String()
  var optionView = AdvancedSearch()
  
  var model = Response()
  var searchedRecipe = String()
  var options = [String]()
  var selectedOptions = [String]()
  let saveButton = ActionButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    optionLabel.addKerning(to: viewTitle.capitalized)
    view.backgroundColor = K.primary
    style()
    layout()
    activateSwitches()
  }
}


extension FilterViewController {
  func style() {
    optionLabel.translatesAutoresizingMaskIntoConstraints = false
    optionLabel.font = .preferredFont(forTextStyle: .largeTitle)
    optionLabel.textColor = K.invertPrimary
    optionLabel.textAlignment = .center
    optionLabel.text = viewTitle
    
    optionView.translatesAutoresizingMaskIntoConstraints = false
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false
    saveButton.setTitle("Save", for: [])
    saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .primaryActionTriggered)
  }
  
  func layout() {
    view.addSubview(optionLabel)
    NSLayoutConstraint.activate([
      optionLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      optionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: optionLabel.trailingAnchor, multiplier: 4),
    ])
    
    view.addSubview(optionView)
    NSLayoutConstraint.activate([
      optionView.topAnchor.constraint(equalTo: optionLabel.bottomAnchor),
      optionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      optionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
    
    view.addSubview(saveButton)
    NSLayoutConstraint.activate([
      saveButton.topAnchor.constraint(equalToSystemSpacingBelow: optionView.bottomAnchor, multiplier: 1),
      saveButton.leadingAnchor.constraint(equalTo: optionView.detailsStack.leadingAnchor),
      saveButton.trailingAnchor.constraint(equalTo: optionView.detailsStack.trailingAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: saveButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6)
    ])
  }
}

extension FilterViewController {
  @objc func saveButtonTapped() {
    let listVC = RecipeListCollectionView()
    switch self.viewTitle.localizedLowercase {
      case FilterOptions.diets.rawValue.localizedLowercase:
        print(selectedOptions)
         let testy = dietaryRestrictions(from: selectedOptions)
        listVC.filterRecipes(for: searchedRecipe, with: testy)
        print(testy)
      default:
        break
        
    }
    self.dismiss(animated: true)
  }
}

extension FilterViewController {
  func activateSwitches() {
    options = optionView.allOptions
    for row in optionView.detailsStack.arrangedSubviews {
      for stack in row.subviews {
        for elements in stack.subviews {
          if elements.tag > 0 {
            do {
              let toggle = elements as! ToggleSwitch
              toggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)
            }
          }
          
        }
      }
    }
  }
  
  
  
  @objc func didToggle(_ sender: ToggleSwitch) {
    if sender.isOn {
      let index = sender.tag - 1
      selectedOptions.append(options[index])
    }
  }
}

extension FilterViewController {
  func filterCuisines(for options: [String]) {
    var newModel = Response()
    var newResults = [Recipe]()
    guard let recipes = model.results else { return }
    for recipe in recipes {
      guard let cuisines = recipe.cuisines else { return }
      for cuisine in cuisines {
        if options.contains(cuisine) {
          newResults.append(recipe)
          newModel.results = newResults
          self.model = newModel
        }
      }
    }
  }

  func filterDiets(for selections: [String]) {
    var newModel = Response()
    var newResults = [Recipe]()
    guard let recipes = self.model.results else { return }
    for recipe in recipes {
      
      guard let diets = recipe.diets else { return }
      
      // convert [Diet] into [String] before matching
      let test2: [String] = {
        var test = [String]()
        for diet in diets {
          test.append(diet.rawValue)
        }
        return test
      }()
      
      if Set(test2).isSubset(of: Set(selections)) {
        newResults.append(recipe)
      }
        
    }
    newModel.results = newResults
    self.model = newModel
  }

  func filterIntolerances(for options: [String]) {
    var newModel = Response()
    var newResults = [Recipe]()
    guard let recipes = model.results else { return }
    for recipe in recipes {
      guard let allergens = recipe.intolerances else { return }
      for allergen in allergens {
        if options.contains(allergen.rawValue) {
          newResults.append(recipe)
          newModel.results = newResults
          self.model = newModel

        }
      }
    }
  }

  func filterMealTypes(for options: [String]) {
    var newModel = Response()
    var newResults = [Recipe]()
    guard let recipes = model.results else { return }
    for recipe in recipes {
      guard let dishTypes = recipe.dishTypes else { return }
      for dishType in dishTypes {
        if options.contains(dishType.rawValue) {
          newResults.append(recipe)
          newModel.results = newResults
          self.model = newModel
        }
      }
    }
  }

}


