//
//  LandingView.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import Foundation
import UIKit
/**
 Acts as a Splash while authentication is in process.
 
 No ideas on what it should be at this time
 */
class LandingView: UIView {
  
  let stack = UIStackView()

  let logInButton = ActionButton()
  let signUpButton = DetailsButton()
  let forgotPassword = TextOnlyButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LandingView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.borderWidth = 2
    layer.borderColor = K.scGreen?.cgColor
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 24
    
    logInButton.translatesAutoresizingMaskIntoConstraints = false
    logInButton.setTitle("Log In", for: []
    )
    signUpButton.translatesAutoresizingMaskIntoConstraints = false
    signUpButton.setTitle("Sign Up", for: [])
    
    forgotPassword.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    addSubview(stack)
    NSLayoutConstraint.activate([
      stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 4),
      stack.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
    stack.addArrangedSubview(logInButton)
    stack.addArrangedSubview(signUpButton)
    
//    addSubview(forgotPassword)
  }
}

