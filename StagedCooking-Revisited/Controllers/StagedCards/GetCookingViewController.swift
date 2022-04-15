//
//  GetCookingViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/14/22.
//

import Foundation
import UIKit

class GetCookingViewController: UIViewController {
  
  let startLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }
  
  
}

extension GetCookingViewController {
  
  func style() {
    startLabel.translatesAutoresizingMaskIntoConstraints = false
    startLabel.textAlignment = .center
    startLabel.font = .preferredFont(forTextStyle: .largeTitle)
    startLabel.text = "Swipe Left To Get Started"
    startLabel.textColor = .white
  }
  
  func layout() {
    view.addSubview(startLabel)
    NSLayoutConstraint.activate([
      startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      startLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
