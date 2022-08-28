//
//  Keychain.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/25/22.
//

import Foundation

struct Credintials {
  var username: String
  var password: String
  
  func saveKeychain() {
    
  }
}

enum KeychainError: Error {
  case noPassword
  case unexpectedPasswordData
  case unhandledError(status: OSStatus)
}

