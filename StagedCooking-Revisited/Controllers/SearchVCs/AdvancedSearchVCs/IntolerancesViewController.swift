//
//  IntolerancesViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import UIKit

class IntolerancesViewController: UIViewController {
  
  let intolerancesView = IntolerancesView()
  var intolerances: Intolerances?
  
  let saveButton = ActionButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    title = "Pew-Pew"
    navigationController?.navigationBar.prefersLargeTitles = true
    styleIntoerances()
    layoutIntoerances()
    makeLabels()
  }
  
  
}

extension IntolerancesViewController {
  
  func styleIntoerances() {
    intolerancesView.translatesAutoresizingMaskIntoConstraints = false
    intolerancesView.layer.zPosition = 1
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false
    saveButton.layer.zPosition = 10
    saveButton.setTitle("Save", for: [])
  }
  
  func layoutIntoerances() {
    view.addSubview(intolerancesView)
    NSLayoutConstraint.activate([
      intolerancesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      intolerancesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      intolerancesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: intolerancesView.bottomAnchor, multiplier: 12)
    ])
    
    view.addSubview(saveButton)
    NSLayoutConstraint.activate([
      saveButton.leadingAnchor.constraint(equalTo: intolerancesView.detailsStack.leadingAnchor),
      saveButton.trailingAnchor.constraint(equalTo: intolerancesView.detailsStack.trailingAnchor),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: saveButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 6)
    ])
  }
  
  func makeLabels() {
    var tag = 0
    for option in Intolerances.allCases {
      let row = AdvancedSearchRow()
      row.translatesAutoresizingMaskIntoConstraints = false
      
      let label = ModalLabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = option.rawValue.localizedCapitalized
      
      let toggle = ToggleSwitch()
      toggle.tag = tag
      toggle.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
      toggle.translatesAutoresizingMaskIntoConstraints = false
      
      let divider = Divider()
      divider.translatesAutoresizingMaskIntoConstraints = false
      
      row.addArrangedSubview(label)
      row.addArrangedSubview(toggle)
      
      intolerancesView.detailsStack.addArrangedSubview(row)
      intolerancesView.detailsStack.addArrangedSubview(divider)
      tag += 1
    }
  }
}

extension IntolerancesViewController {
  @objc func saveButtonTapped() {
    self.dismiss(animated: false)
  }
  
  @objc func didToggleSwitch(_ sender: UIControl) {
    var array = [String]()
    print(String(describing: sender.tag))
    for name in Intolerances.allCases {
      array.append(name.rawValue)
    }
    print(String(describing: array[sender.tag]))
  }
}

