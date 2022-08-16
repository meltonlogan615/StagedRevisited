//
//  EmptyTextField.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 8/13/22.
//

import Foundation
import UIKit

extension UITextField {
  func checkIfEmpty(errorMsg: String) {
    guard let input = self.text else { return }
    if input.isEmpty {
      self.placeholder = errorMsg
    }
  }
}
