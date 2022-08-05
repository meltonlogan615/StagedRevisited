//
//  LogInViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import UIKit
import AuthenticationServices

class LogInViewController: UIViewController {

  
  
  let imageView = UIImageView()
  let loginView = LogInView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
//    title = "Log In"
    style()
    layout()
    setupProviderLoginView()
  }
}

extension LogInViewController {
  
  func style() {
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.contentMode = .scaleAspectFill

    loginView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  func layout() {
    let imageHeight = (view.frame.height / 5 - 48)
    let imageWidth = (view.frame.width / 1.25)

    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])
    
    view.addSubview(loginView)
    NSLayoutConstraint.activate([
//      loginView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 12),
//      imageView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

extension LogInViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return self.view.window!
  }
  
  func setupProviderLoginView() {
    let authorizationButton = ASAuthorizationAppleIDButton()
    authorizationButton.addTarget(self, action: #selector(handleAuthorization), for: .touchUpInside)
    authorizationButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    self.loginView.buttonstack.addArrangedSubview(authorizationButton)
  }
  
  @objc
  func handleAuthorization() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]
    
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
    print("nope")
    
    let searchTab = TabViewController()
    searchTab.modalTransitionStyle = .crossDissolve
    searchTab.modalPresentationStyle = .fullScreen
    present(searchTab, animated: true)
  }

}

