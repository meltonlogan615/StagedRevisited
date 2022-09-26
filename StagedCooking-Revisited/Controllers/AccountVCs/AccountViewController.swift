//
//  AccountViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 9/9/22.
//

import UIKit

class AccountViewController: UIViewController, UITextFieldDelegate {
  
  let imageView = UIImageView()
  let cancelButton = DetailsButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    style()
    layout()
  }
}

extension AccountViewController {
  func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.tintColor = K.scAccent
    imageView.contentMode = .scaleAspectFill
    
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    cancelButton.setTitle("Cancel", for: [])
    cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
  }
  
  func layout() {
    let imageHeight = (view.frame.height / 5 - 48)
    let imageWidth = (view.frame.width * 0.8)
    
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])
    
    view.addSubview(cancelButton)
    NSLayoutConstraint.activate([
      cancelButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: cancelButton.trailingAnchor, multiplier: 4),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: cancelButton.safeAreaLayoutGuide.bottomAnchor, multiplier: 2)
    ])
  }
  
  @objc
  func cancelButtonTapped() {
    self.dismiss(animated: true)
  }
}
