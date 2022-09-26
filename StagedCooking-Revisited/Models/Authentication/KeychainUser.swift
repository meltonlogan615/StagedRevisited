//
//  KeychainUser.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 9/7/22.
//

import Foundation

class KeychainUser {
  let chefKey = "ChefKey"
  var chefData: String {
    didSet {
      ChefDefault.defaults.set(chefData, forKey: chefKey)
    }
  }
  
  // MARK: - Retrieve Password if exists
  func getStoredPassword() -> String {
    let kcw = KeychainWrapper()
    if let password = try? kcw.getGenericPasswordFor(account: "StagedCooking", service: "SavedData") {
      return password
    }
    return ""
  }
  
  // MARK: - Update Current Password
  func updateStoredPassword(_ password: String) {
    let kcw = KeychainWrapper()
    do {
      try kcw.storeGenericPasswordFor(account: "StagedCooking", service: "SavedData", password: password)
    } catch let error as KeychainError {
      print("Exception setting password: \(error.message ?? "no message")")
    } catch {
      print("An error occurred setting the password.")
    }
  }
  
  // MARK: - Data Validation
  func validatePassword(_ password: String) -> Bool {
    let currentpassword = getStoredPassword()
    return password == currentpassword
  }
  
  // MARK: - Change Password
  func changedPassword(currentPassword: String, newPassword: String) -> Bool {
    guard validatePassword(currentPassword) == true else {
      return false
    }
    updateStoredPassword(newPassword)
    return true
  }
  
  init() {
    chefData = ChefDefault.defaults.string(forKey: chefKey) ?? ""
  }
}
