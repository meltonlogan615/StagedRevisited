//
//  MediumTextField.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/28/22.
//

import UIKit
/**
 Medium height & width UITextField
 
 - Cannot recall where this is being used.
 */

class MediumTextField: UITextField {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isAccessibilityElement = true
    style()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MediumTextField {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    becomeFirstResponder()
    textAlignment = .center
    backgroundColor = K.primary
    font = .systemFont(ofSize: 24, weight: .regular)
    heightAnchor.constraint(equalToConstant: 28).isActive = true
  }
}
