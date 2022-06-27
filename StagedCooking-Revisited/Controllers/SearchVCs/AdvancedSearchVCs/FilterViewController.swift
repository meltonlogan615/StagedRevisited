//
//  OptionViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/29/22.
//

import UIKit
import SwiftUI


/**
 Generic `OptionViewController`. Will recieve the view based on the `didSelectItemAt` method in `AdvancedSearchViewController`.
 
 
 */
class FilterViewController: UIViewController {
  
  
  let optionLabel = UILabel()
  var optionView = AdvancedSearch()
  let saveButton = ActionButton()
  
  var viewTitle = String()
  var switches = [ToggleSwitch]()
//  var viewOptions = [FilterViews.RawValue]()
//  var optionViewSwitches = [ToggleSwitch: Bool]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    optionLabel.addKerning(to: viewTitle.capitalized)
    view.backgroundColor = K.primary
    style()
    layout()
    activateSwitches()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    // something
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
    self.dismiss(animated: true)
  }
}

extension FilterViewController {
  func activateSwitches() {
    for row in optionView.detailsStack.arrangedSubviews {
      for stack in row.subviews {
        for elements in stack.subviews {
          if elements.tag % 2 == 0 && elements.tag != 0 {
            do {
              let toggle = elements as! ToggleSwitch
              toggle.addTarget(self, action: #selector(didToggle), for: .valueChanged)
            }
          }
        }
      }
    }
  }
  
  @objc func didToggle() {
    print("yup")
  }
}


