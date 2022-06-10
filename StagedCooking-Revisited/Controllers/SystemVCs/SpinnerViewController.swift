//
//  SpinnerViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/8/22.
//

import UIKit

class SpinnerViewController: UIViewController {
  
  let indicator = UIActivityIndicatorView(style: .large)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    parent?.addChild(self)
    style()
    layout()
  }
}

extension SpinnerViewController {
  
  func style() {
    indicator.translatesAutoresizingMaskIntoConstraints = false
    indicator.startAnimating()
    indicator.color = K.invertPrimary
  }
  
  func layout() {
    view.addSubview(indicator)
    NSLayoutConstraint.activate([
      indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}


