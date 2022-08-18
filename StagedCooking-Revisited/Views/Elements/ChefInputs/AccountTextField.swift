//
//  AccountTextField.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//
import Foundation
import UIKit

class AccountTextField: UITextField {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isAccessibilityElement = true
    style()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var textPadding = UIEdgeInsets(
    top: 12,
    left: 8,
    bottom: 8,
    right: 8
  )
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
}

extension AccountTextField {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    becomeFirstResponder()
    textAlignment = .natural
    backgroundColor = K.modalBG
    font = .systemFont(ofSize: 24, weight: .regular)
    heightAnchor.constraint(equalToConstant: 28).isActive = true
  }
}

class StyledTextField: UIView {
  
  let textField = AccountTextField()
  let underline = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension StyledTextField {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    textField.translatesAutoresizingMaskIntoConstraints = false
    underline.translatesAutoresizingMaskIntoConstraints = false
    underline.frame.size.height = 2
    underline.backgroundColor = K.invertPrimary
  }
  
  func layout() {
    addSubview(textField)
    NSLayoutConstraint.activate([
      textField.topAnchor.constraint(equalTo: topAnchor),
      textField.leadingAnchor.constraint(equalTo: leadingAnchor),
      textField.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
    addSubview(underline)
    NSLayoutConstraint.activate([
      underline.topAnchor.constraint(equalTo: textField.bottomAnchor),
      underline.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
      underline.trailingAnchor.constraint(equalTo: textField.trailingAnchor)
    ])
  }
}
