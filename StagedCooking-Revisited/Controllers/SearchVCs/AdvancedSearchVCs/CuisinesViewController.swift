//
//  CuisinesViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/20/22.
//

import UIKit

class CuisinesViewController: UIViewController {
  
  let cuisines = [Cuisine]()
  
  override func viewWillAppear(_ animated: Bool) {
    style()
//    layout()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.layoutSubviews()
  }
}

extension CuisinesViewController {
  
  func style() {
    let cuisinesView = CuisinesView(cuisine: cuisines)
    cuisinesView.translatesAutoresizingMaskIntoConstraints = false
//  }
//
//  func layout() {
    print("loaded")
    view.addSubview(cuisinesView)
    NSLayoutConstraint.activate([
      cuisinesView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      cuisinesView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: cuisinesView.trailingAnchor, multiplier: 2)
    ])
  }
}
