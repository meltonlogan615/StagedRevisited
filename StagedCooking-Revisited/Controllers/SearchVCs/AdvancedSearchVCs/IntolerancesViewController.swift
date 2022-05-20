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
    navigationController?.navigationBar.prefersLargeTitles = true
    print("loaded")
    styleIntoerances()
    layoutIntoerances()
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
}

extension IntolerancesViewController {
  @objc func saveButtonTapped() {
    self.dismiss(animated: false)
  }
}
