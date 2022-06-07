//
//  LandingViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import UIKit

class LandingViewController: UIViewController {
  
  let imageView = UIImageView()
  
  let landing = LandingView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.dWhite
    style()
    layout()
    setButtons()
  }
}

extension LandingViewController {
  
  func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.tintColor = K.scAccent
    imageView.contentMode = .scaleAspectFill

  
    landing.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    let imageHeight = (view.frame.height / 3 - 48)
    let imageWidth = (view.frame.width / 1.25)
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])
    
    view.addSubview(landing)
    NSLayoutConstraint.activate([
      landing.topAnchor.constraint(equalToSystemSpacingBelow: imageView.topAnchor, multiplier: 1),
      landing.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      landing.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      landing.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

extension LandingViewController {
  private func setButtons() {
    self.landing.logInButton.addTarget(self, action: #selector(logInTapped), for: .primaryActionTriggered)
    self.landing.signUpButton.addTarget(self, action: #selector(signUpTapped), for: .primaryActionTriggered)
    self.landing.forgotPassword.addTarget(self, action: #selector(forgotTapped), for: .primaryActionTriggered)

  }
}

extension LandingViewController {
  @objc func logInTapped() {
    print("in")
  }
  
  @objc func signUpTapped() {
    print("up")
  }
  
  @objc func forgotTapped() {
    print("oops")
  }
  

}
