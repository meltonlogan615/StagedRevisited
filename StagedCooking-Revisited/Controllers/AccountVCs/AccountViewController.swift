//
//  AccountViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/19/22.
//

import UIKit

class AccountViewController: UIViewController {
  
  let landing = LandingView()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissView))

    style()
    layout()
    setButtons()
  }
}

extension AccountViewController {
  
  func style() {
    landing.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    view.addSubview(landing)
    NSLayoutConstraint.activate([
      landing.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
      landing.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      landing.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      landing.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

extension AccountViewController {
  private func setButtons() {
    self.landing.logInButton.addTarget(self, action: #selector(logInTapped), for: .primaryActionTriggered)
    self.landing.signUpButton.addTarget(self, action: #selector(signUpTapped), for: .primaryActionTriggered)
  }
}

extension AccountViewController {
  @objc func logInTapped() {
    print("in")
  }
  
  @objc func signUpTapped() {
    print("up")
  }
}
