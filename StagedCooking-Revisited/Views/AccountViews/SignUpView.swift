//
//  SignUpView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import Foundation
import UIKit

// TODO: - #23 - Set Up Firebase to handle account creation and logging in.
// Packages have been added, but not configured.
// https://console.firebase.google.com/project/stagedcooking/authentication


// TODO: - #25 - Sign In With Apple (also covers Signing Up)
// https://developer.apple.com/sign-in-with-apple/get-started/


/**
 View for Account Creation.
 
 Minimal personal information required.
 
 All we need:
 - First Name
 - Email
 - Nothing else
 */
class SignUpView: UIView {
  
  let textFieldStack = UIStackView()
  let nameTextField = LargeTextField()
  let emailTextField = LargeTextField()
  let passwordTextField = LargeTextField()
  let passwordConfirmationTextField = LargeTextField()
  
  let buttonStack = UIStackView()
  let submitButton = ActionButton()
  let cancleButton = DetailsButton()
  let signUpWithAppleButton = SignWithAppleButton()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
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
    // MARK: - TextFields
    textFieldStack.translatesAutoresizingMaskIntoConstraints = false
    textFieldStack.axis = .vertical
    textFieldStack.spacing = 16
    
    nameTextField.translatesAutoresizingMaskIntoConstraints = false
    nameTextField.placeholder = "Name"
    nameTextField.becomeFirstResponder()
    
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    emailTextField.placeholder = "Email Address"
    
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    
    passwordConfirmationTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordConfirmationTextField.placeholder = "Confirm Password"
    passwordConfirmationTextField.isSecureTextEntry = true
    
    // MARK: - Buttons
    buttonStack.translatesAutoresizingMaskIntoConstraints = false
    buttonStack.axis = .vertical
    buttonStack.spacing = 16
    
    submitButton.translatesAutoresizingMaskIntoConstraints = false
    submitButton.setTitle("Sign Up", for: [])
    
    signUpWithAppleButton.translatesAutoresizingMaskIntoConstraints = false
    signUpWithAppleButton.setTitle("Sign Up With Apple", for: [])
    
    cancleButton.translatesAutoresizingMaskIntoConstraints = false
    cancleButton.setTitle("Cancel", for: [])
  }
  
  func layout() {
    textFieldStack.addArrangedSubview(nameTextField)
    textFieldStack.addArrangedSubview(emailTextField)
    textFieldStack.addArrangedSubview(passwordTextField)
    textFieldStack.addArrangedSubview(passwordConfirmationTextField)
    addSubview(textFieldStack)
    NSLayoutConstraint.activate([
      textFieldStack.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 2),
      textFieldStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
      trailingAnchor.constraint(equalToSystemSpacingAfter: textFieldStack.trailingAnchor, multiplier: 4)
    ])
    
    buttonStack.addArrangedSubview(submitButton)
    buttonStack.addArrangedSubview(signUpWithAppleButton)
    buttonStack.addArrangedSubview(cancleButton)
    addSubview(buttonStack)
    NSLayoutConstraint.activate([
      buttonStack.topAnchor.constraint(equalToSystemSpacingBelow: textFieldStack.bottomAnchor, multiplier: 4),
      buttonStack.leadingAnchor.constraint(equalTo: textFieldStack.leadingAnchor),
      buttonStack.trailingAnchor.constraint(equalTo: textFieldStack.trailingAnchor)
    ])
    
  }
}
