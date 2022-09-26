//
//  PasswordResetRequestViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/27/22.
//

import AuthenticationServices
import Firebase
import FirebaseAuth
import FirebaseCore
import Foundation
import UIKit

class PasswordResetRequestViewController: UIViewController, UITextFieldDelegate {
  
  let imageView = UIImageView()
  let stack = UIStackView()
  let emailTextField = LargeTextField(placeholder: "Email Address")
  let submitButton = ActionButton()
  let cancelButton = DetailsButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }
}

extension PasswordResetRequestViewController {
  func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.contentMode = .scaleAspectFill

    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 16
    
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    emailTextField.delegate = self
    
    submitButton.translatesAutoresizingMaskIntoConstraints = false
    submitButton.setTitle("Submit", for: [])
    submitButton.addTarget(self, action: #selector(helpMeObiWan), for: .touchUpInside)
    
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    cancelButton.setTitle("Cancel", for: [])
    cancelButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

  }
  
  func layout() {
    let imageHeight = (view.frame.height / 5 - 48)
    let imageWidth = (view.frame.width * 0.8)
    
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])

    stack.addArrangedSubview(emailTextField)
    stack.addArrangedSubview(submitButton)
    view.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 4),
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
    
    view.addSubview(cancelButton)
    NSLayoutConstraint.activate([
      cancelButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
      cancelButton.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: cancelButton.bottomAnchor, multiplier: 2)
    ])
  }
}

extension PasswordResetRequestViewController {
  @objc
  func helpMeObiWan() {
    // See Firebase Documentation...
  }
}
