//
//  LogInViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import UIKit

class LogInViewController: UIViewController {
  
  let imageView = UIImageView()
  let loginView = LogInView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Log In"
    style()
    layout()
  }
}

extension LogInViewController {
  
  func style() {
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(systemName: "fork.knife.circle")
    imageView.tintColor = K.scAccent
    imageView.contentMode = .scaleAspectFill

    loginView.translatesAutoresizingMaskIntoConstraints = false
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
    
    view.addSubview(loginView)
    NSLayoutConstraint.activate([
      loginView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
      loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}
