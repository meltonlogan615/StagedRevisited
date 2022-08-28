//
//  SignUpViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import AuthenticationServices
import FirebaseAuth
import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
  
  let imageView = UIImageView()
  
  let signupView = SignUpView()
  var signupViewTextFields: [UITextField]?
  let cancelButton = DetailsButton()
  
  var email: String?
  var password: String?
  var handle: AuthStateDidChangeListenerHandle?
  var creds: Credintials?
  
  var nonce = Nonce()
  fileprivate var currentNonce: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    title = "Sign Up"
    style()
    layout()
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
  
  func style() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "StagedLogo")
    imageView.contentMode = .scaleAspectFill

    signupView.translatesAutoresizingMaskIntoConstraints = false
    
    signupView.emailTextField.delegate = self
    signupView.emailTextField.inputAccessoryView = setupToolbar()
    
    signupView.passwordTextField.delegate = self
    signupView.passwordTextField.inputAccessoryView = setupToolbar()
    
    signupView.passwordConfirmationTextField.delegate = self
    signupView.passwordConfirmationTextField.inputAccessoryView = setupToolbar()

    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    cancelButton.setTitle("Cancel", for: [])
  }
  
  func layout() {
    let imageHeight = (view.frame.height / 5 - 48)
    let imageWidth = (view.frame.width / 1.25)
    
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageView.heightAnchor.constraint(equalToConstant: imageHeight),
      imageView.widthAnchor.constraint(equalToConstant: imageWidth)
    ])
    
    view.addSubview(signupView)
    NSLayoutConstraint.activate([
      signupView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
      signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      signupView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    
    view.addSubview(cancelButton)
    NSLayoutConstraint.activate([
      cancelButton.leadingAnchor.constraint(equalTo: signupView.emailTextField.leadingAnchor),
      cancelButton.trailingAnchor.constraint(equalTo: signupView.emailTextField.trailingAnchor),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: cancelButton.bottomAnchor, multiplier: 2)
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
    
    cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .primaryActionTriggered)
  }
  
  @objc
  func signUpButtonTapped() {
    createChef()
  }
  
  @objc
  func cancelButtonTapped() {
    self.dismiss(animated: true)
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
      print("FART FAIL")
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

