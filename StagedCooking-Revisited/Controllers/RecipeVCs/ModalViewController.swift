//
//  ModalViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 5/3/22.
//


import UIKit

protocol ModalDataSource: AnyObject {
  func showModal(_ sender: UIButton)
}

/*
 Acts as a holder for the Modal Views
*/
class ModalViewController: UIViewController {
  
  var modalView = SCModal()
  var closeButton = DetailsButton()
  
  var modalLabel = UILabel()
  var labelText = String()
  
  override func viewWillAppear(_ animated: Bool) {
    style()
    layout()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    modalLabel.addKerning(to: labelText.capitalized)
  }
}

extension ModalViewController {
  func style() {
    view.addSubview(self.blur())
    
    modalLabel.translatesAutoresizingMaskIntoConstraints = false
    modalLabel.font = .systemFont(ofSize: 36, weight: .semibold)
    modalLabel.textColor = K.primary
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


