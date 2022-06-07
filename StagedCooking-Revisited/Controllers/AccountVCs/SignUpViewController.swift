//
//  SignUpViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import UIKit

class SignUpViewController: UIViewController {
  
  let imageView = UIImageView()
  
  let signupView = SignUpView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Sign Up"
    style()
    layout()
  }
}

extension SignUpViewController {
  
  func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.tintColor = K.scAccent
    imageView.contentMode = .scaleAspectFill

    signupView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    let imageHeight = (view.frame.height / 5 - 48)
    let imageWidth = (view.frame.width / 1.25)

    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])
    
    view.addSubview(signupView)
    NSLayoutConstraint.activate([
      signupView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
      signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      signupView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

extension SignUpViewController {
  @objc func signUpButtonTapped() {
    print("poop")
  }
}
