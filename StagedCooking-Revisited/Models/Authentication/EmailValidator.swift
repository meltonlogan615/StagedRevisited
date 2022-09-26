//
//  EmailValidator.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 9/12/22.
//

import Firebase
import FirebaseAuth
import FirebaseCore
import Foundation

struct EmailValidator {
  func beginValidation() -> NSObject {
    let actionCodeSettings = ActionCodeSettings()
    actionCodeSettings.url = URL(string: "")
    
    actionCodeSettings.handleCodeInApp = true
    if let bundleID = Bundle.main.bundleIdentifier {
      actionCodeSettings.setIOSBundleID(bundleID)
    }
//    actionCodeSettings.setAndroidPackageName("com.example.android",
//                                             installIfNotAvailable: false, minimumVersion: "12")
    return actionCodeSettings
  }
  
  func sendAuthEmail(to email: String) {
    Auth.auth().sendSignInLink(toEmail: email, actionCodeSettings: beginValidation() as! ActionCodeSettings) { error in
      
      if let error = error {
        print(String(describing: error.localizedDescription))
        return
      }
      UserDefaults.standard.set(email, forKey: "Email")
      // Show message to check email
    }
  }
}
