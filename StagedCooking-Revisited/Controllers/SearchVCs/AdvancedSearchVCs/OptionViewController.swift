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
class OptionViewController: UIViewController {
  
  let optionLabel = UILabel()
  var optionView = AdvancedSearch()
  let saveButton = ActionButton()
  
  var viewTitle = String()
  var viewOptions = [FilterViews.RawValue]()
  var optionViewSwitches = [ToggleSwitch: Bool]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    optionLabel.addKerning(to: viewTitle.capitalized)
    view.backgroundColor = K.primary
    self.activateSwitches(optionView)
    style()
    layout()
  }
}

extension OptionViewController {
  func style() {
    optionLabel.translatesAutoresizingMaskIntoConstraints = false
    optionLabel.font = .systemFont(ofSize: 36, weight: .semibold)
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

extension OptionViewController {
  @objc func saveButtonTapped() {
    self.dismiss(animated: true)
  }
}

extension OptionViewController {
  ///   `switch-case`  based on the information sent  from `AdvancesSearchViewController`
  func activateSwitches(_ view: AdvancedSearch) {
    switch view {
        
      case is CuisinesView:
        for option in Cuisine.allCases {
          viewOptions.append(option.rawValue)
        }
        
      case is DietsView:
        for option in Diet.allCases {
          viewOptions.append(option.rawValue)
        }
        
      case is IntolerancesView:
        for option in Intolerances.allCases {
          viewOptions.append(option.rawValue)
        }
        
      // MARK: - Still not entirely sure how to handle this one...
      case is AdvancedMacrosView:
        print("intol")
        
      case is MealTypesView:
        for option in MealType.allCases {
          viewOptions.append(option.rawValue)
        }
        
      default:
        break
    }
  }
}

