//
//  LogInViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import AuthenticationServices
import CryptoKit
import FirebaseAuth
import UIKit
import SwiftUI

class LogInViewController: UIViewController {

  let imageView = UIImageView()
  let loginView = LogInView()
  
  var handle: AuthStateDidChangeListenerHandle?

  fileprivate var currentNonce: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
//    title = "Log In"
    style()
    layout()
//    setupToolbar()
//    setupProviderLoginView()
    activateButtons()
  }
  
  // From Firebase Documentation
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    handle = Auth.auth().addStateDidChangeListener { auth, user in
      if user == nil {
        self.navigationController?.popToRootViewController(animated: true)
      } else {
        print(String(describing: user))
//        self.present(TabViewController(), animated: true)
        self.loginView.emailTextField.text = nil
        self.loginView.passwordTextField.text = nil
      }
    }
  }
  
  // From Firebase Documentation
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    guard let handle = handle else { return }
    Auth.auth().removeStateDidChangeListener(handle)
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
    loginView.emailTextField.textContentType = .emailAddress
    loginView.passwordTextField.textContentType = .password
    NSLayoutConstraint.activate([
      loginView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
      loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

extension LogInViewController {
  func activateButtons() {
    self.loginView.submitButton.addTarget(self, action: #selector(loginButtonTapped), for: .primaryActionTriggered)
    
    self.loginView.cancleButton.addTarget(self, action: #selector(cancelButtonTapped), for: .primaryActionTriggered)
  }
}

extension LogInViewController {
  @objc
  func loginButtonTapped() {
    guard let email = loginView.emailTextField.text,
          let password = loginView.passwordTextField.text,
          !email.isEmpty,
          !password.isEmpty
    else {
      loginView.emailTextField.placeholder = "I don't know who I am"
      loginView.passwordTextField.placeholder = "I'm sad and empty inside"
      return
    }
    Auth.auth().signIn(withEmail: email, password: password) { user, error in
      if let error = error, user == nil {
        let alert = UIAlertController(title: "Unable To Sign In",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
      } else {
        let vc = TabViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
      }
    }
  }
  
  @objc
  func cancelButtonTapped() {
    self.dismiss(animated: true)
  }
}

// From Apple Documentation
//extension LogInViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
//  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//    return self.view.window!
//  }
//
//  // From Apple Documentation
//  func setupProviderLoginView() {
//    let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
//    authorizationButton.addTarget(self, action: #selector(handleAuthorization), for: .touchUpInside)
//    authorizationButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
//    self.loginView.buttonStack.addArrangedSubview(authorizationButton)
//  }
//
//  @objc
//  func handleAuthorization() {
//    let appleIDProvider = ASAuthorizationAppleIDProvider()
//    let request = appleIDProvider.createRequest()
//    request.requestedScopes = [.fullName, .email]
//
//    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//    authorizationController.delegate = self
//    authorizationController.presentationContextProvider = self
//    authorizationController.performRequests()
//    print("nope")
//
//    let searchTab = TabViewController()
//    searchTab.modalTransitionStyle = .crossDissolve
//    searchTab.modalPresentationStyle = .fullScreen
//    present(searchTab, animated: true)
//  }
//
//
//  // Unhashed nonce.
//  // From Firebase Documentation
//  @available(iOS 13, *)
//  func startSignInWithAppleFlow() {
//    let nonce = self.nonce.randomNonceString()
//    currentNonce = nonce
//    let appleIDProvider = ASAuthorizationAppleIDProvider()
//    let request = appleIDProvider.createRequest()
//    request.requestedScopes = [.fullName, .email]
//    request.nonce = self.nonce.sha256(nonce)
//
//    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//    authorizationController.delegate = self
//    authorizationController.presentationContextProvider = self
//    authorizationController.performRequests()
//  }
//}
//
//
//// From Firebase Documentation
//@available(iOS 13.0, *)
//extension LogInViewController {
//
//  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//      guard let nonce = currentNonce else {
//        fatalError("Invalid state: A login callback was received, but no login request was sent.")
//      }
//      guard let appleIDToken = appleIDCredential.identityToken else {
//        print("Unable to fetch identity token")
//        return
//      }
//      guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
//        return
//      }
//      // Initialize a Firebase credential.
//      let credential = OAuthProvider.credential(withProviderID: "apple.com",
//                                                idToken: idTokenString,
//                                                rawNonce: nonce)
//      // Sign in with Firebase.
//      Auth.auth().signIn(with: credential) { (authResult, error) in
//        if error != nil {
//          // Error. If error.code == .MissingOrInvalidNonce, make sure
//          // you're sending the SHA256-hashed nonce as a hex string with
//          // your request to Apple.
//          print(String(describing: error?.localizedDescription))
//          return
//        }
//
////        if let chef = self.chef {
////          let uid = chef.uid
////          let email = chef.email
////          var multiFactorString = "MutliFactor: "
////          for info in chef.multiFactor.enrolledFactors {
////            multiFactorString += info.displayName ?? "Chef"
////            multiFactorString += " "
////          }
////        }
//      }
//    }
//  }
//
//  // From Firebase Documentation
//  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//    // Handle error.
//    print("Sign in with Apple errored: \(error)")
//  }
//
//}
