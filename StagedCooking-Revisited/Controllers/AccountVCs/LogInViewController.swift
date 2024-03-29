//
//  LogInViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import AuthenticationServices
import CryptoKit
import FirebaseAuth
import LocalAuthentication
import Security
import UIKit

class LogInViewController: AccountViewController {
  
  let loginView = LogInView()
  
  var nonce = Nonce()
  var handle: AuthStateDidChangeListenerHandle?
  //  var creds: Credintials?
  
  fileprivate var currentNonce: String?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    handle = Auth.auth().addStateDidChangeListener { auth, user in
      if user == nil {
        self.navigationController?.popToRootViewController(animated: true)
      } else {
        print(String(describing: user))
        self.loginView.emailTextField.text = nil
        self.loginView.passwordTextField.text = nil
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    styleLogIn()
    layoutLogIn()
    loginView.emailTextField.inputAccessoryView = setupToolbar()
    activateButtons()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    guard let handle = handle else { return }
    Auth.auth().removeStateDidChangeListener(handle)
  }
}

extension LogInViewController {
  
  func styleLogIn() {
    loginView.translatesAutoresizingMaskIntoConstraints = false
    loginView.emailTextField.inputAccessoryView = setupToolbar()
    loginView.emailTextField.delegate = self
    
    loginView.passwordTextField.inputAccessoryView = setupToolbar()
    loginView.passwordTextField.delegate = self
  }
  
  func layoutLogIn() {
    view.addSubview(loginView)    
    NSLayoutConstraint.activate([
      loginView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
      loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      loginView.bottomAnchor.constraint(equalTo: cancelButton.topAnchor),
    ])
  }
}

extension LogInViewController {
  func activateButtons() {
    self.loginView.submitButton.addTarget(self, action: #selector(loginButtonTapped), for: .primaryActionTriggered)
    
    let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    authorizationButton.addTarget(self, action: #selector(startSignInWithAppleFlow), for: .touchUpInside)
    authorizationButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    self.loginView.buttonStack.addArrangedSubview(authorizationButton)
    
//    button.addTarget(self, action: #selector(cancelButtonTapped), for: .primaryActionTriggered)
  }
}

// MARK: - Firebase Log In
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
  
//  @objc
//  func cancelButtonTapped() {
//    self.dismiss(animated: true)
//  }
}

// MARK: - Sign In With Apple Log In
extension LogInViewController: ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    var safeAnchor = ASPresentationAnchor()
    if let anchor = self.view.window {
      safeAnchor = anchor
    }
    return safeAnchor
  }
  
  @available(iOS 13, *)
  @objc
  func startSignInWithAppleFlow() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]
    
    let nonce = self.nonce.randomNonceString()
    currentNonce = nonce
    
    request.nonce = self.nonce.sha256(currentNonce!)
    
    let authController = ASAuthorizationController(authorizationRequests: [request])
    authController.delegate = self
    authController.presentationContextProvider = self
    authController.performRequests()
  }
}

extension LogInViewController: ASAuthorizationControllerDelegate {
  @available(iOS 13, *)
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
      ChefDefault.defaults.set(appleIDCredential.user, forKey: "appleAuthorizedUserIdKey")
      
      guard let nonce = currentNonce else {
        print("Invalid state. Recived, but not requested")
        return
      }
      guard let appleIDToken = appleIDCredential.identityToken else {
        print("No token")
        return
      }
      guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
        return
      }
      
      // Firebase portion
      let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                idToken: idTokenString,
                                                rawNonce: nonce)
      
      Auth.auth().signIn(with: credential) { [weak self] (authResult, error) in
        if error != nil {
          print(String(describing: error?.localizedDescription))
          return
        }
        if authResult != nil {
          guard let self = self else { return }
          print("poop")
          self.pushToSearchView()
        }
      }
    } else {
      print("Credital Auth Failed \(String(describing: authorization.credential))")
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    print("Error Signing In W/ Apple", error)
  }
}

// MARK: - Biometrics
extension LogInViewController {
  func tryBiometricAuthentication() {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
      let reason = "Unlocky Lock."
      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { authenticated, error in
        DispatchQueue.main.async {
          if authenticated {
            print("authed")
            self.pushToSearchView()
          } else {
            if let errorString = error?.localizedDescription {
              print("Error: \(errorString)")
            }
          }
        }
      }
    } else {
      if let errorString = error?.localizedDescription {
        print("Error LoginVC: \(errorString)")
      }
    }
  }
}


extension LogInViewController {
  private func pushToSearchView() {
    let vc = TabViewController()
    vc.modalPresentationStyle = .fullScreen
    vc.modalTransitionStyle = .crossDissolve
    self.present(vc, animated: true)
  }
}
