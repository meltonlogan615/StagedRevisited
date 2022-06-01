//
//  LargeTextField.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import UIKit
/*
  Large height & width UITextField
  
  - Will be used for manual input of lengthy values.
  - Used in `SearchView`, `LogInView`, and other things.
 */
class LargeTextField: UITextField {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isAccessibilityElement = true
    style()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LargeTextField {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    becomeFirstResponder()
    textAlignment = .center
    layer.cornerRadius = 8
    clipsToBounds = true
    backgroundColor = .secondarySystemBackground
    layer.borderWidth = 1
    layer.borderColor = UIColor.secondaryLabel.cgColor
    font = .systemFont(ofSize: 24, weight: .regular)
    heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
}

