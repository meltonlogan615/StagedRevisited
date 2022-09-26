//
//  KeychainError.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/29/22.
//

import Foundation

struct KeychainError: Error {
  var message: String?
  var type: KeychainErrorType
  
  enum KeychainErrorType {
    case noPassword // not found
    case unexpectedPasswordData // invalid data / unable to convert string to utf8 data.
    case serviceError
    case unhandledError(status: OSStatus)
  }
  
  init(status: OSStatus, type: KeychainErrorType) {
    self.type = type
    if let errorMsg = SecCopyErrorMessageString(status, nil) {
      self.message = String(errorMsg)
    } else {
      self.message = "Status Code: \(status)"
    }
  }
  
  init(type: KeychainErrorType) {
    self.type = type
  }
  
  init(message: String, type: KeychainErrorType) {
    self.message = message
    self.type = type
  }
}



/// source: https://www.raywenderlich.com/11496196-how-to-secure-ios-user-data-keychain-services-and-biometrics-with-swiftui
