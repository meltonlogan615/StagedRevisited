////
////  LandingViewController.swift
////  StagedCooking-Revisited
////
////  Created by Logan Melton on 5/19/22.
////
//
//import AuthenticationServices
//import CryptoKit
//import FirebaseAuth
//import LocalAuthentication
//import Security
//import UIKit
//
//class LandingViewController: AccountViewController {
//  
//  //  let imageView = UIImageView()
//  
//  let landing = LandingView()
//  let login = LogInView()
//  let signup = SignUpView()
//  var currentView: UIView!
//  
//  var errorLabel = UILabel()
//  
//  // MARK: - Auth
//  private var nonce = Nonce()
//  private var handle: AuthStateDidChangeListenerHandle?
//  private var currentNonce: String?
//  
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    currentView = landing
//    view.backgroundColor = K.primary
//    styleLanding()
//    layoutLanding()
//    setButtons()
//    activateButtons()
//  }
//}
//
//extension LandingViewController {
//  
//  func styleLanding() {
//    landing.translatesAutoresizingMaskIntoConstraints = false
//    login.translatesAutoresizingMaskIntoConstraints = false
//    signup.translatesAutoresizingMaskIntoConstraints = false
//    
//    errorLabel.numberOfLines = 0
//    errorLabel.textColor = K.scAccent
//    errorLabel.textAlignment = .center
//    errorLabel.font = .systemFont(ofSize: 20, weight: .semibold)
//    errorLabel.layer.opacity = 0.0
//    errorLabel.backgroundColor = K.primary
//    errorLabel.layer.zPosition = 10
//  
//  }
//  
//  func layoutLanding() {
//    super.cancelButton.isHidden = true
//    view.addSubview(landing)
//    NSLayoutConstraint.activate([
//      landing.topAnchor.constraint(equalToSystemSpacingBelow: imageView.topAnchor, multiplier: 1),
//      landing.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      landing.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      landing.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//    ])
//  }
//}
//
//extension LandingViewController {
//  private func setButtons() {
//    self.landing.logInButton.addTarget(self, action: #selector(logInTapped), for: .primaryActionTriggered)
//    self.landing.signUpButton.addTarget(self, action: #selector(signUpTapped), for: .primaryActionTriggered)
//    self.landing.forgotPassword.addTarget(self, action: #selector(forgotTapped), for: .primaryActionTriggered)
//  }
//}
//
//extension LandingViewController {
//  @objc
//  func logInTapped() {
//    currentView = login
//    cancelButton.isHidden = false
//    view.addSubview(login)
//    NSLayoutConstraint.activate([
//      login.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
//      login.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      login.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      login.bottomAnchor.constraint(equalTo: cancelButton.topAnchor),
//    ])
//    login.emailTextField.inputAccessoryView = setupToolbar()
//    login.passwordTextField.inputAccessoryView = setupToolbar()
//    landing.removeFromSuperview()
//  }
//  
//  @objc
//  func signUpTapped() {
//    currentView = signup
//    cancelButton.isHidden = false
//    view.addSubview(signup)
//    NSLayoutConstraint.activate([
//      signup.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
//      signup.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      signup.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      signup.bottomAnchor.constraint(equalTo: cancelButton.topAnchor),
//    ])
//    signup.nameTextField.inputAccessoryView = setupToolbar()
//    signup.emailTextField.inputAccessoryView = setupToolbar()
//    signup.passwordTextField.inputAccessoryView = setupToolbar()
//    signup.passwordConfirmationTextField.inputAccessoryView = setupToolbar()
//    landing.removeFromSuperview()
//  }
//  
//  @objc
//  func forgotTapped() {
//    let forgotVC = PasswordResetRequestViewController()
//    forgotVC.modalPresentationStyle = .fullScreen
//    present(forgotVC, animated: true)
//  }
//  
//  @objc
//  override func cancelButtonPressed() {
//    switch currentView {
//      case login:
//        login.removeFromSuperview()
//        view.addSubview(landing)
//        styleLanding()
//        layoutLanding()
//        print("Log In")
//        
//      case signup:
//        signup.removeFromSuperview()
//        view.addSubview(landing)
//        styleLanding()
//        layoutLanding()
//        print("Sign Up")
//        
//      default:
//        print("poop")
//    }
//  }
//}
//
//extension LandingViewController {
//  func activateButtons() {
//    login.submitButton.addTarget(self, action: #selector(loginButtonTapped), for: .primaryActionTriggered)
//    signup.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .primaryActionTriggered)
//    
//    var signInWithApple: ASAuthorizationAppleIDButton!
//    signInWithApple = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
//    signInWithApple.addTarget(self, action: #selector(logInWithAppleFlow), for: .touchUpInside)
//    login.buttonStack.addArrangedSubview(signInWithApple)
//    signInWithApple.heightAnchor.constraint(equalToConstant: 48).isActive = true
//    
//    var signUpWithApple: ASAuthorizationAppleIDButton!
//    signUpWithApple = ASAuthorizationAppleIDButton(type: .signUp, style: .black)
//    signUpWithApple.addTarget(self, action: #selector(signUpWithAppleFlow), for: .touchUpInside)
//    signup.buttonStack.addArrangedSubview(signUpWithApple)
//    signUpWithApple.heightAnchor.constraint(equalToConstant: 48).isActive = true
//    
//  }
//}
//
//// MARK: - Logging In Methods
//extension LandingViewController {
//  @objc
//  func loginButtonTapped() {
//    guard let email = login.emailTextField.text,
//          let password = login.passwordTextField.text,
//          !email.isEmpty,
//          !password.isEmpty
//    else {
//      login.emailTextField.placeholder = "I don't know who I am"
//      login.passwordTextField.placeholder = "I'm sad and empty inside"
//      return
//    }
//    
//    Auth.auth().signIn(withEmail: email, password: password) { user, error in
//      if let error = error, user == nil {
//        let alert = UIAlertController(title: "Unable To Sign In",
//                                      message: error.localizedDescription,
//                                      preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true)
//      } else {
//        let vc = TabViewController()
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        self.present(vc, animated: true)
//      }
//    }
//  }
//}
//
//// MARK: - Logging In Presentation Anchor
//extension LandingViewController: ASAuthorizationControllerPresentationContextProviding {
//  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//    var safeAnchor = ASPresentationAnchor()
//    if let anchor = self.view.window {
//      safeAnchor = anchor
//    }
//    return safeAnchor
//  }
//  
//  
//  @available(iOS 13, *)
//  @objc
//  func logInWithAppleFlow() {
//    let appleIDProvider = ASAuthorizationAppleIDProvider()
//    let request = appleIDProvider.createRequest()
//    request.requestedScopes = [.fullName, .email]
//    let nonce = self.nonce.randomNonceString()
//    currentNonce = nonce
//    
//    request.nonce = self.nonce.sha256(currentNonce!)
//    
//    let authController = ASAuthorizationController(authorizationRequests: [request])
//    authController.delegate = self
//    authController.presentationContextProvider = self
//    authController.performRequests()
//  }
//  
//}
//
//extension LandingViewController {
//  @available(iOS 13, *)
//  private func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//
//
//    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//      ChefDefault.defaults.set(appleIDCredential.user, forKey: "appleAuthorizedUserIdKey")
//      
//      guard let nonce = currentNonce else {
//        print("Invalid state. Recived, but not requested")
//        return
//      }
//      guard let appleIDToken = appleIDCredential.identityToken else {
//        print("No token")
//        return
//      }
//      guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
//        return
//      }
//      
//      // Firebase portion
//      let credential = OAuthProvider.credential(withProviderID: "apple.com",
//                                                idToken: idTokenString,
//                                                rawNonce: nonce)
//      
//      Auth.auth().signIn(with: credential) { [weak self] (authResult, error) in
//        if error != nil {
//          print(String(describing: error?.localizedDescription))
//          return
//        }
//        if authResult != nil {
//          guard let self = self else { return }
//          print("poop")
//          self.pushToSearchView()
//        }
//      }
//    } else {
//      print("Credital Auth Failed \(String(describing: authorization.credential))")
//    }
//  }
//  
////  private func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
////    print("Error Signing In W/ Apple", error)
////  }
//}
//
//// MARK: - Sign Up Methods
//extension LandingViewController {
//  private func configureLabel(withMessage message: String) {
//    errorLabel.fadeIn(0.25, delay: 1.0)
//    errorLabel.text = message
//    errorLabel.fadeOut(2.0, delay: 1.0)
//  }
//}
//
//// MARK: - Sign Up - FireBase Account Creation With Email & Password
//extension LandingViewController {
//  @objc
//  func signUpButtonTapped() {
//    guard let name = signup.nameTextField.text,
//          let email = signup.emailTextField.text,
//          let pw = signup.passwordTextField.text,
//          let pwCheck = signup.passwordConfirmationTextField.text
//    else {
//      return
//    }
//    
//    if pwCheck != pw {
//      configureLabel(withMessage: "Passwords Do Not Match")
//      print("FART FAIL")
//      return
//    }
//    
//    Auth.auth().createUser(withEmail: email, password: pwCheck) { _, error in
//      if let error = error {
//        let alert = UIAlertController(title: "Unable To Create Account", message: error.localizedDescription, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true)
//      } else {
//        let vc = TabViewController()
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        self.present(vc, animated: true)
//      }
//    }
//    ChefDefault.name = name
//  }
//}
//
//// MARK: - Sign Up With Apple
//extension LandingViewController {
//  @available(iOS 13, *)
//  @objc
//  func signUpWithAppleFlow() {
//    let appleIDProvider = ASAuthorizationAppleIDProvider()
//    let request = appleIDProvider.createRequest()
//    request.requestedScopes = [.fullName, .email]
//    let nonce = self.nonce.randomNonceString()
//    currentNonce = nonce
//    
//    request.nonce = self.nonce.sha256(currentNonce!)
//    
//    let authController = ASAuthorizationController(authorizationRequests: [request])
//    authController.delegate = self
//    authController.presentationContextProvider = self
//    authController.performRequests()
//  }
//}
//
////extension LandingViewController: ASAuthorizationControllerDelegate {
////  @available(iOS 13, *)
//
////      guard let appleIDToken = appleIDCredential.identityToken else {
////        print("No token")
////        return
////      }
////      guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
////        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
////        return
////      }
//      
//      // Firebase portion
////      let credential = OAuthProvider.credential(withProviderID: "apple.com",
////                                                idToken: idTokenString,
////                                                rawNonce: nonce)
////
////      Auth.auth().signIn(with: credential) { [weak self] (authResult, error) in
////        if error != nil {
////          print(String(describing: error?.localizedDescription))
////          return
////        }
////        if authResult != nil {
////          guard let self = self else { return }
////          let vc = TabViewController()
////          vc.modalPresentationStyle = .fullScreen
////          vc.modalTransitionStyle = .crossDissolve
////          self.present(vc, animated: true)
////        }
////      }
////    } else {
////      print("Credital Auth Failed \(String(describing: authorization.credential))")
////    }
////  }
//  
////  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
////    print("Error Signing In W/ Apple", error)
////  }
////}
//
//// MARK: - Logging In Biometrics
//extension LandingViewController {
//  func tryBiometricAuthentication() {
//    let context = LAContext()
//    var error: NSError?
//    
//    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//      let reason = "Unlocky Lock."
//      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { authenticated, error in
//        DispatchQueue.main.async {
//          if authenticated {
//            print("authed")
//            self.pushToSearchView()
//          } else {
//            if let errorString = error?.localizedDescription {
//              print("Error: \(errorString)")
//            }
//          }
//        }
//      }
//    } else {
//      if let errorString = error?.localizedDescription {
//        print("Error LoginVC: \(errorString)")
//      }
//    }
//  }
//}
//
//extension LandingViewController: ASAuthorizationControllerDelegate {
//  private func selectAuthProcess(_ view: UIView) {
//    @available(iOS 13, *)
//
//    switch view {
//      case signup:
//        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//          if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            ChefDefault.defaults.set(appleIDCredential.user, forKey: "appleAuthorizedUserIdKey")
//            
//            guard let nonce = currentNonce else {
//              print("Invalid state. Recived, but not requested")
//              return
//            }
//            
//            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
//            
//            Auth.auth().signIn(with: credential) { [weak self] (authResult, error) in
//              if error != nil {
//                print(String(describing: error?.localizedDescription))
//                return
//              }
//              if authResult != nil {
//                guard let self = self else { return }
//                let vc = TabViewController()
//                vc.modalPresentationStyle = .fullScreen
//                vc.modalTransitionStyle = .crossDissolve
//                self.present(vc, animated: true)
//              }
//            }
//          } else {
//            print("Credital Auth Failed \(String(describing: authorization.credential))")
//          }
//        }
//        print("fart")
//      case login:
//        print("fuck")
//      default:
//        print("Fight")
//    }
//  }
//  
//  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//    print("Error Signing In W/ Apple", error)
//  }
//}
//
//extension LandingViewController {
//  private func pushToSearchView() {
//    let vc = TabViewController()
//    vc.modalPresentationStyle = .fullScreen
//    vc.modalTransitionStyle = .crossDissolve
//    self.present(vc, animated: true)
//  }
//}
//
//
