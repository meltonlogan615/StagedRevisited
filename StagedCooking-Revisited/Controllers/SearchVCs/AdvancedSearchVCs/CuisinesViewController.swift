//
//  CuisinesViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/20/22.
//

import UIKit

class CuisinesViewController: UIViewController {
  
  let cuisines = [Cuisine]()
  let cuisinesView = CuisinesView()
  
  let saveButton = ActionButton()
  
  override func viewWillAppear(_ animated: Bool) {
    style()
    makeLabels()
    layout()
  }
  
  override func viewDidLoad() {
    view.backgroundColor = K.primary
    super.viewDidLoad()
    view.layoutSubviews()
  }
}

extension CuisinesViewController {
  
  func style() {
    cuisinesView.translatesAutoresizingMaskIntoConstraints = false
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false
    saveButton.setTitle("Save", for: [])
  }

  func layout() {
    print("loaded")
    view.addSubview(cuisinesView)
    NSLayoutConstraint.activate([
      cuisinesView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      cuisinesView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: cuisinesView.trailingAnchor, multiplier: 2),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: cuisinesView.bottomAnchor, multiplier: 12)

//      view.bottomAnchor.constraint(equalToSystemSpacingBelow: cuisinesView.bottomAnchor, multiplier: 1)
    ])
    
    view.addSubview(saveButton)
    NSLayoutConstraint.activate([
      saveButton.leadingAnchor.constraint(equalTo: cuisinesView.detailsStack.leadingAnchor),
      saveButton.trailingAnchor.constraint(equalTo: cuisinesView.detailsStack.trailingAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: saveButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6)
    ])
  }
  
  func makeLabels() {
    for option in Cuisine.allCases {
      
      print("---")
      let row = AdvancedSearchRow()
      //      row.backgroundColor = .red
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let rowTitle = SCLabel()
      rowTitle.translatesAutoresizingMaskIntoConstraints = false
      
      let toggle = ToggleSwitch()
      toggle.translatesAutoresizingMaskIntoConstraints = false
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      rowTitle.text = option.rawValue.localizedCapitalized
      print(String(describing: option.rawValue.localizedCapitalized))
      
      row.addArrangedSubview(rowTitle)
      row.addArrangedSubview(toggle)
      
      cuisinesView.detailsStack.addArrangedSubview(row)
      cuisinesView.detailsStack.addArrangedSubview(divider)
    }
    print(String(describing: cuisinesView.detailsStack.frame))

  }
  
}
