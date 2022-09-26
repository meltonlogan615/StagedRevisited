//
//  Keychain.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/25/22.
//

import Foundation

class KeychainWrapper {
  
  // MARK: - Save New Password
  func storeGenericPasswordFor(account: String, service: String, password: String) throws {
    // convert password string into data
    guard let passwordData = password.data(using: .utf8) else {
      print("Error converting password")
      throw KeychainError(type: .unexpectedPasswordData)
    }
    
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: account, // username
      kSecAttrService as String: service, // arbitrary, should reflect the purpose of the password, i.e., `user login`
      kSecValueData as String: passwordData // password
    ]
    
    let status = SecItemAdd(query as CFDictionary, nil)
    switch status {
      case errSecSuccess: // ifins it works...
        break
      default: // ifins it ain't...
        throw KeychainError(status: status, type: .serviceError)
    }
  }
  
  // MARK: - Get Existing Password
  func getGenericPasswordFor(account: String, service: String) throws -> String {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: account,
      kSecAttrService as String: service,
      
      kSecMatchLimit as String: kSecMatchLimitOne, // expect to return one item
      kSecReturnAttributes as String: true,
      kSecReturnData as String: true
    ]
    
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    guard status != errSecItemNotFound else {
      throw KeychainError(type: .noPassword)
    }
    guard status == errSecSuccess else {
      throw KeychainError(status: status, type: .serviceError)
    }
    guard let existingItem = item as? [String: Any],
          let valueData = existingItem[kSecValueData as String] as? Data,
          let value = String(data: valueData, encoding: .utf8) // converts password data into string
    else {
      throw KeychainError(type: .unexpectedPasswordData)
    }
    return value
    
  }
  
  // MARK: - Update Password
  func updateGenericPasswordFor(
    account: String,
    service: String,
    password: String
  ) throws {
    guard let passwordData = password.data(using: .utf8) else {
      print("Error converting value to data")
      return
    }
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: account,
      kSecAttrService as String: service
    ]
    let attributes: [String: Any] = [ kSecValueData as String: passwordData]
    
    let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
    guard status != errSecItemNotFound else {
      throw KeychainError(message: "Matching item not found", type: .noPassword)
    }
    guard status == errSecSuccess else {
      throw KeychainError(status: status, type: .serviceError)
    }
  }
  
  // MARK: - Deleting Existing Password
  func deleteGenericPasswordFor(account: String, service: String) throws {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: account,
      kSecAttrService as String: service
    ]
    
    let status = SecItemDelete(query as CFDictionary)
    guard status == errSecSuccess || status == errSecItemNotFound else {
      throw KeychainError(status: status, type: .serviceError)
    }
  }
}



/// source: https://www.raywenderlich.com/11496196-how-to-secure-ios-user-data-keychain-services-and-biometrics-with-swiftui
