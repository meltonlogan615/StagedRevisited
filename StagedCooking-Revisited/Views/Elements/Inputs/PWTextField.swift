//
//  PWTextField.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/10/22.
//

import UIKit

class PWTextField: UITextField {
  
  var textPadding = UIEdgeInsets(
    top: 12,
    left: 8,
    bottom: 12,
    right: 8
  )
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // Gives breathing room around the text within the TextField
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
}

extension PWTextField {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
//    textAlignment = .natural
//    layer.cornerRadius = 8
//    clipsToBounds = true
    backgroundColor = K.modalBG
    font = .systemFont(ofSize: 24, weight: .regular)
    heightAnchor.constraint(equalToConstant: 48).isActive = true
  }
}

