//
//  SignUpViewController.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 6/4/22.
//

import AuthenticationServices
import FirebaseAuth
import UIKit

class SignUpViewController: UIViewController {
  
  let imageView = UIImageView()
  
  let signupView = SignUpView()
  var signupViewTextFields: [UITextField]?
  
  var handle: AuthStateDidChangeListenerHandle?
  var email: String?
  var password: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = K.primary
    title = "Sign Up"
    style()
    layout()
    setupProviderLoginView()
    activateButtons()
//    setupToolbar(for: self, textFields: [signupView.nameTextField, signupView.emailTextField])
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
    signupView.emailTextField.textContentType = .emailAddress
    signupView.passwordTextField.textContentType = .newPassword
    signupView.passwordConfirmationTextField.textContentType = .newPassword
    NSLayoutConstraint.activate([
      signupView.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1),
      signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      signupView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    
  }
}

extension SignUpViewController {
  func activateButtons() {
    self.signupView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .primaryActionTriggered)
    
    self.signupView.signUpWithAppleButton.addTarget(self, action: #selector(signUpWithAppleTapped), for: .primaryActionTriggered)
    
    self.signupView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .primaryActionTriggered)
  }
}

// From Firebase Documentation
extension SignUpViewController {
  func createUser() {
    guard let email = signupView.emailTextField.text,
          let password = signupView.passwordTextField.text,
          !email.isEmpty,
          !password.isEmpty
    else {
      return
    }
    // Firebase Auth
    Auth.auth().createUser(withEmail: email, password: password) { _, error in
      if error == nil {
        Auth.auth().signIn(withEmail: email, password: password)
        let vc = TabViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
      } else {
        print("Error in createUser: \(error?.localizedDescription ?? "")")
      }
    }
  }
}

extension SignUpViewController {
  @objc
  func signUpButtonTapped() {
    createUser()
    print("poop")
  }
  
  @objc
  func signUpWithAppleTapped() {
    let tabView = TabViewController()
    tabView.modalPresentationStyle = .fullScreen
    present(tabView, animated: true)
  }
  
  @objc
  func cancelButtonTapped() {
    self.dismiss(animated: true)
  }
}

// MARK: - SIGN IN WITH APPLE
extension SignUpViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return self.view.window!
  }
  
  func setupProviderLoginView() {
    let authorizationButton = ASAuthorizationAppleIDButton(type: .signUp, style: .black)
    authorizationButton.addTarget(self, action: #selector(handleAuthorization), for: .touchUpInside)
    authorizationButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    self.signupView.buttonStack.addArrangedSubview(authorizationButton)
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

