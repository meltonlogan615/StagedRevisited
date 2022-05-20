//
//  TestVC.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import UIKit

class TestVC: UIViewController {
  
  let object = TextOnlyButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    style()
    layout()
    object.addTarget(self, action: #selector(buttonPushed), for: .primaryActionTriggered)
  }
  
  
}

extension TestVC {
  
  func style() {
    object.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(object)
    object.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    object.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  @objc func buttonPushed() {
    print("button")
  }
}
