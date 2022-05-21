//
//  NavController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/21/22.
//

import UIKit

class NavController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.prefersLargeTitles = true
    navigationBar.tintColor = K.scAccent
    navigationBar.backgroundColor = K.primary
    style()
    layout()
  }
  
  
}

extension NavController {
  
  func style() {
    
  }
  
  func layout() {
    
  }
}
