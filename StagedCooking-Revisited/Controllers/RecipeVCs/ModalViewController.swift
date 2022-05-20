//
//  ModalViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//

// Acts as a holder for the Modal Views

import UIKit

protocol ModalDataSource: AnyObject {
  func showModal(_ sender: UIButton)
}

class ModalViewController: UIViewController {
  
  var modalView = RecipeModal()
  var closeButton = DetailsButton()
  
  var modalLabel = UILabel()
  var labelText = String()
  
  override func viewWillAppear(_ animated: Bool) {
    style()
    layout()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let spaced = [NSAttributedString.Key.kern: 1]
    let spacyString = NSMutableAttributedString(string: labelText.capitalized, attributes: spaced)
    modalLabel.attributedText = spacyString
  }
}

extension ModalViewController {
  func style() {
    let backgroundFilter = UIBlurEffect(style: .dark)
    let blurredBackground = UIVisualEffectView(effect: backgroundFilter)
    blurredBackground.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
    view.addSubview(blurredBackground)
    
    modalLabel.translatesAutoresizingMaskIntoConstraints = false
    modalLabel.font = .systemFont(ofSize: 36, weight: .semibold)
    modalLabel.textColor = .white
    modalLabel.textAlignment = .center
    
    modalView.translatesAutoresizingMaskIntoConstraints = false
    modalView.layer.cornerRadius = 8
    modalView.clipsToBounds = true
    modalView.layer.borderColor = K.primary?.cgColor
    modalView.layer.borderWidth = 2
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.setTitle("Close", for: [])
    closeButton.addTarget(self, action: #selector(dismissView), for: .primaryActionTriggered)
    closeButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .semibold)    
  }
  
  func layout() {
    
    view.addSubview(modalLabel)
    NSLayoutConstraint.activate([
      modalLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: modalLabel.trailingAnchor, multiplier: 4),
      modalLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4)
    ])
    
    view.addSubview(modalView)
    NSLayoutConstraint.activate([
      modalView.topAnchor.constraint(equalToSystemSpacingBelow: modalLabel.bottomAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: modalView.trailingAnchor, multiplier: 4),
      view.bottomAnchor.constraint(equalToSystemSpacingBelow: modalView.bottomAnchor, multiplier: 16),
      modalView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
    ])
    
    view.addSubview(closeButton)
    NSLayoutConstraint.activate([
      closeButton.topAnchor.constraint(equalToSystemSpacingBelow: modalView.bottomAnchor, multiplier: 2),
      closeButton.trailingAnchor.constraint(equalTo: modalView.trailingAnchor),
      closeButton.leadingAnchor.constraint(equalTo: modalView.leadingAnchor),
      closeButton.heightAnchor.constraint(equalToConstant: 48)
    ])
  }
}


