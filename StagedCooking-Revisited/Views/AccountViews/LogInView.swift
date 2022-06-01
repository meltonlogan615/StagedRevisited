//
//  LogInView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import Foundation
import UIKit

// TODO: - #23 - Set Up Firebase to handle account creation and logging in.
// https://console.firebase.google.com/project/stagedcooking/authentication

// TODO: - #24 - Biometric Authentication
// https://developer.apple.com/documentation/localauthentication/logging_a_user_into_your_app_with_face_id_or_touch_id
// TODO: - #25 - Sign In With Apple
// https://developer.apple.com/sign-in-with-apple/get-started/

/**
 View to present options for Logging In.
 
 General Flow:
 - Log In
 - email / password text fields
 - submit button
 - Goes to SearchViewController
 */
class LogInView: UIView {
  
  let stackView = UIStackView()
  let emailTextField = LargeTextField()
  let passwordTextField = LargeTextField()
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

extension LogInView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 12
    
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    emailTextField.placeholder = "Email"
    
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    
    submitButton.translatesAutoresizingMaskIntoConstraints = false
    submitButton.setTitle("Log In", for: [])
  }
  
  func layout() {
    addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
    ])
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
