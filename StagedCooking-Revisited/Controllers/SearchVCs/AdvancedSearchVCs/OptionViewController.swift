//
//  OptionViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/29/22.
//

import UIKit

class OptionViewController: UIViewController {
  
  let optionLabel = UILabel()
  let saveButton = ActionButton()
  var optionView = AdvancedSearch()
  
  var viewTitle = String()
  var viewOptions = [FilterViews.RawValue]()
  var optionViewSwitches = [ToggleSwitch: Bool]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let spaced = [NSAttributedString.Key.kern: 1]
    let spacyString = NSMutableAttributedString(string: viewTitle.capitalized, attributes: spaced)
    optionLabel.attributedText = spacyString
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
  func activateSwitches(_ view: AdvancedSearch) {
    switch view {
        
      case is CuisinesView:
        for option in Cuisine.allCases {
          viewOptions.append(option.rawValue)
        }
        print(optionView.switches)
        
      case is DietsView:
        for option in Diet.allCases {
          viewOptions.append(option.rawValue)
        }
        
      case is IntolerancesView:
        for option in Intolerances.allCases {
          viewOptions.append(option.rawValue)
        }
        
//      case is AdvancedMacrosView:
//        print("intol")
      case is MealTypesView:
        for option in MealType.allCases {
          viewOptions.append(option.rawValue)
        }
        
      default:
        break
    }
//    print(viewOptions)
  }
}

extension OptionViewController {
  func switchDidToggle() {
    
  }
}
