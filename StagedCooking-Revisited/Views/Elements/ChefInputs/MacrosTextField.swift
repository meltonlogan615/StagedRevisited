//
//  MacrosTextField.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/17/22.
//

import Foundation

import UIKit

class MacrosTextField: UITextField {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isAccessibilityElement = true
    style()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MacrosTextField {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    becomeFirstResponder()
    textAlignment = .center
    layer.cornerRadius = 8
    clipsToBounds = true
    backgroundColor = .secondarySystemBackground
    layer.borderWidth = 1
    layer.borderColor = UIColor.secondaryLabel.cgColor
    heightAnchor.constraint(equalToConstant: 36).isActive = true
    widthAnchor.constraint(equalToConstant: 56).isActive = true
  }
}
