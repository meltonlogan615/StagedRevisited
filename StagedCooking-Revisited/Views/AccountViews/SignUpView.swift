//
//  SignUpView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import Foundation
import UIKit

class SignUpView: UIView {
  
  // MARK: - Subviews
  let stackView = UIStackView()
  let nameTextField = CustomTextField()
  let emailTextField = CustomTextField()
  let passwordTextField = CustomTextField()
  let submitButton = ActionButton()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = K.primary
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SignUpView {
  
  // MARK: - Style & Layout
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 12
    
    nameTextField.translatesAutoresizingMaskIntoConstraints = false
    nameTextField.placeholder = "Name"
    
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    emailTextField.placeholder = "Email Address"
    
    submitButton.translatesAutoresizingMaskIntoConstraints = false
    submitButton.setTitle("Get Cookin'", for: [])
  }
  
  func layout() {
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 2)
    ])
    stackView.addArrangedSubview(nameTextField)
    stackView.addArrangedSubview(emailTextField)
    stackView.addArrangedSubview(passwordTextField)
    
    addSubview(submitButton)
    NSLayoutConstraint.activate([
      submitButton.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
      submitButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      submitButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
    ])
  }
}
