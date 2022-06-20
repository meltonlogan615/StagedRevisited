//
//  TestVC.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/19/22.
//

import UIKit

class TestVC: UIViewController {
  
  let test = MessageView()
  let button = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    style()
    layout()
  }
}

extension TestVC {
  
  func style() {
    test.translatesAutoresizingMaskIntoConstraints = false
    test.message.text = "Saved"
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Test", for: [])
    button.addTarget(self, action: #selector(performTest), for: .primaryActionTriggered)
  }
  
  func layout() {
//    view.addSubview(test)
//    NSLayoutConstraint.activate([
//      test.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//      test.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      test.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//    ])
    view.addSubview(button)
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}

extension TestVC {
  @objc func performTest() {
    print("trying")
    view.addSubview(test)
    test.slideIn(from: .top, duration: 3, delay: 1)
    test.message.text = "Testing"
    print(test.frame.height)
//    test.slideOut(to: .leading, duration: 2, delay: 1)
  }
}
