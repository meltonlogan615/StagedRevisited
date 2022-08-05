//
//  ViewController-Alert.swift
//  StagedCooking-Revisited
//
//  Created by Logan Melton on 7/21/22.
//

import Foundation
import UIKit

extension UIViewController {
  func noResults(title: String, message: String) {
    let nothingAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let dismissAction = UIAlertAction(title: "OK", style: .default)
      nothingAlert.addAction(dismissAction)
      present(nothingAlert, animated: true)
  }
}
