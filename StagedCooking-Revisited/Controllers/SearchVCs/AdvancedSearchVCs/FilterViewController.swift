//
//  OptionViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/29/22.
//

import UIKit

/**
 Generic `OptionViewController`. Will recieve the view based on the `didSelectItemAt` method in `AdvancedSearchViewController`.
 */

class FilterViewController: UIViewController {
  
  let optionLabel = UILabel()
  var viewTitle = String()
  var optionView = AdvancedSearch()
  
  var model = Response()
  var searchedRecipe = String()
  
  var cuisineOptions = [Cuisine]()
  var selectedCusines = [Cuisine]()
  
  var dietOptions = [Diet]()
  var selectedDiets = [Diet]()
  
  var intoleranceOptions = [Intolerance]()
  var selectedIntolerances = [Intolerance]()
  
  var mealOptions = [MealType]()
  var selectedMeals = [MealType]()
  
  let saveButton = ActionButton()
  var sourceView: UIViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    optionLabel.addKerning(to: viewTitle.capitalized)
    view.backgroundColor = K.primary
    style()
    layout()
    selectInputStyle()
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
    guard let source = sourceView as? RecipeListCollectionView else { return }
    switch self.viewTitle.localizedLowercase {
        
      case FilterOptions.cuisines.rawValue.localizedLowercase:
        source.selectedCuisines = self.selectedCusines
        source.returnedFilters = FilterOptions.cuisines.rawValue.localizedLowercase
        
      case FilterOptions.diets.rawValue.localizedLowercase:
        source.selectedDiets = self.selectedDiets
        source.returnedFilters = FilterOptions.diets.rawValue.localizedLowercase
        
      case FilterOptions.intolerances.rawValue.localizedLowercase:
        source.selectedIntolerances = self.selectedIntolerances
        source.returnedFilters = FilterOptions.intolerances.rawValue.localizedLowercase

      case FilterOptions.mealTypes.rawValue.localizedLowercase:
        source.selectedMealTypes = self.selectedMeals
        source.returnedFilters = FilterOptions.mealTypes.rawValue.localizedLowercase
        
      default:
        break
    }
    self.dismiss(animated: true)
  }
}

extension FilterViewController {
  func selectInputStyle() {
    switch self.viewTitle.localizedLowercase {
      case FilterOptions.cuisines.rawValue.localizedLowercase:
        print("")
        activateSegControllers()
      default:
        activateSwitches()
    }
  }
}

// MARK: - Toggle Switches
extension FilterViewController {
  func activateSwitches() {
    switch self.viewTitle.localizedLowercase {
      case FilterOptions.diets.rawValue.localizedLowercase:
        dietOptions = optionView.dietOptions
      case FilterOptions.intolerances.rawValue.localizedLowercase:
        intoleranceOptions = optionView.intoleranceOptions
      case FilterOptions.mealTypes.rawValue.localizedLowercase:
        mealOptions = optionView.mealOptions
      default:
        print("5-0")
    }
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
      switch self.viewTitle.localizedLowercase {
        case FilterOptions.diets.rawValue.localizedLowercase:
          selectedDiets.append(dietOptions[index])
        case FilterOptions.intolerances.rawValue.localizedLowercase:
          selectedIntolerances.append(intoleranceOptions[index])
        case FilterOptions.mealTypes.rawValue.localizedLowercase:
          selectedMeals.append(mealOptions[index])
        default:
          break
      }
    }
    
    if !sender.isOn {
      let index = sender.tag - 1
      switch self.viewTitle.localizedLowercase {
        case FilterOptions.diets.rawValue.localizedLowercase:
          selectedDiets.remove(at: index)
          selectedDiets.append(dietOptions[index])
        case FilterOptions.intolerances.rawValue.localizedLowercase:
          selectedIntolerances.remove(at: index)
          selectedIntolerances.append(intoleranceOptions[index])
        case FilterOptions.mealTypes.rawValue.localizedLowercase:
          selectedMeals.remove(at: index)
          selectedMeals.append(mealOptions[index])
        default:
          break
      }
    }
  }
}

// MARK: - Segmented Controllers
extension FilterViewController {
  func activateSegControllers() {
    cuisineOptions = optionView.cuisineOptions
    for row in optionView.detailsStack.arrangedSubviews {
      for stack in row.subviews {
        for elements in stack.subviews {
          if elements.tag > 0 {
            print("Fart")
            let seg = elements as! UISegmentedControl
            seg.addTarget(self, action: #selector(includeExclude), for: .valueChanged)
          }
        }
      }
    }
  }
  
  @objc func includeExclude(_ sender: IncludeExcludeSeg) {
    let index = sender.tag - 1
//    sender.selectedSegmentIndex = selectedIndex
    switch sender.selectedSegmentIndex {
      case 0:
        print("Include", cuisineOptions[index], sender.selectedSegmentIndex)
      case 1:
        print("Exclude", cuisineOptions[index], sender.selectedSegmentIndex)
      default:
        print("Nothing")
    }
  }
}
