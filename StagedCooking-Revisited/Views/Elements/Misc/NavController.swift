//
//  NavController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/21/22.
//

import UIKit
/**
 Custom implamentation of a UINavigationController.
 
 Really only used in `SearchViewController` in the buttonTapped methods.
 */
class NavController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.prefersLargeTitles = true
    navigationBar.tintColor = K.scAccent
    navigationBar.backgroundColor = K.primary
  }
  
  
}

