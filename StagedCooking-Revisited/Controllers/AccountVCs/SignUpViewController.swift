//
//  SignUpViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import AuthenticationServices
import FirebaseAuth
import UIKit

class SignUpViewController: AccountViewController {
  
//  let imageView = UIImageView()
  
  let signupView = SignUpView()
  var signupViewTextFields: [UITextField]?
  let errorLabel = UILabel()
//  let cancelButton = DetailsButton()
  
  var email: String?
  var password: String?
  var handle: AuthStateDidChangeListenerHandle?
//  var creds: Credintials?
  
  var nonce = Nonce()
  fileprivate var currentNonce: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    title = "Sign Up"
    styleSignUp()
    layoutSignUp()
    activateButtons()
  }
  
  // From Firebase Documentation
  override func viewWillAppear(_ animated: Bool) {
    handle = Auth.auth().addStateDidChangeListener { auth, user in
      print(auth)
      print(String(describing: user))
    }
  }
  
  // From Firebase Documentation
  override func viewWillDisappear(_ animated: Bool) {
    Auth.auth().removeStateDidChangeListener(handle!)
  }
}

extension SignUpViewController {
  
  func styleSignUp() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.contentMode = .scaleAspectFill

    signupView.translatesAutoresizingMaskIntoConstraints = false
    signupView.nameTextField.delegate = self
    signupView.nameTextField.inputAccessoryView = setupToolbar()
    
    signupView.emailTextField.delegate = self
    signupView.emailTextField.inputAccessoryView = setupToolbar()

    signupView.passwordTextField.delegate = self
    signupView.passwordTextField.inputAccessoryView = setupToolbar()

    signupView.passwordConfirmationTextField.delegate = self
    signupView.passwordConfirmationTextField.inputAccessoryView = setupToolbar()
    
    errorLabel.translatesAutoresizingMaskIntoConstraints = false

    errorLabel.numberOfLines = 0
    errorLabel.textColor = K.scAccent
    errorLabel.textAlignment = .center
    errorLabel.font = .systemFont(ofSize: 20, weight: .semibold)
    errorLabel.layer.opacity = 0.0
    errorLabel.backgroundColor = K.primary
    errorLabel.layer.zPosition = 10

    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    cancelButton.setTitle("Cancel", for: [])
  }
  
  func layoutSignUp() {
    view.addSubview(signupView)
    signupView.backgroundColor = .cyan
    NSLayoutConstraint.activate([
      signupView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
      signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      signupView.bottomAnchor.constraint(equalTo: cancelButton.topAnchor),
    ])
  }
}

// MARK: - Standard Buttons
extension SignUpViewController {
  func activateButtons() {
    self.signupView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .primaryActionTriggered)
    
    let authorizationButton = ASAuthorizationAppleIDButton(type: .signUp, style: .black)
    authorizationButton.addTarget(self, action: #selector(startSignInWithAppleFlow), for: .touchUpInside)
    authorizationButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    signupView.buttonStack.addArrangedSubview(authorizationButton)
    
    signupView.buttonStack.addArrangedSubview(errorLabel)
  }
  
  @objc
  func signUpButtonTapped() {
    createChef()
  }
  
//  @objc
//  func cancelButtonTapped() {
//    self.dismiss(animated: true)
//  }
}

extension SignUpViewController {
  private func configureLabel(withMessage message: String) {
    errorLabel.fadeIn(0.25, delay: 1.0)
    errorLabel.text = message
    errorLabel.fadeOut(2.0, delay: 1.0)
  }
}


// MARK: - FireBase Account Creation With Email & Password
extension SignUpViewController {
  @objc
  func createChef() {
    guard let name = signupView.nameTextField.text,
          let email = signupView.emailTextField.text,
          let pw = signupView.passwordTextField.text,
          let pwCheck = signupView.passwordConfirmationTextField.text
    else {
      return
    }
    
    if pwCheck != pw {
      configureLabel(withMessage: "Passwords Do Not Match")
      print("FART FAIL")
      return
    }
    
    Auth.auth().createUser(withEmail: email, password: pwCheck) { _, error in
      if let error = error {
        let alert = UIAlertController(title: "Unable To Create Account", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
      } else {
        let vc = TabViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
      }
    }
    ChefDefault.name = name
  }
}

// MARK: - SIGN IN WITH APPLE
extension SignUpViewController: ASAuthorizationControllerPresentationContextProviding {
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

extension SignUpViewController: ASAuthorizationControllerDelegate {
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
          let vc = TabViewController()
          vc.modalPresentationStyle = .fullScreen
          vc.modalTransitionStyle = .crossDissolve
          self.present(vc, animated: true)
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

