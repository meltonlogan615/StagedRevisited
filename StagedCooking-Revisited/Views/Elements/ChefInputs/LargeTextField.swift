//
//  LargeTextField.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 4/3/22.
//

import UIKit
/**
  Large height & width UITextField
  
  - Will be used for manual input of lengthy values.
  - Used in `SearchView`, `LogInView`, and other things.
 */
class LargeTextField: UITextField {
  var textPadding = UIEdgeInsets(
    top: 12,
    left: 8,
    bottom: 12,
    right: 8
  )
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isAccessibilityElement = true
    style()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
}

extension LargeTextField {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    becomeFirstResponder()
    textAlignment = .natural
    layer.cornerRadius = 8
    clipsToBounds = true
    backgroundColor = K.modalBG
    font = .systemFont(ofSize: 24, weight: .regular)
    heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
  
}

